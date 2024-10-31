/*
 * @Description: 改进的arbmerge
 * @Author: liaozz
 * @Date: 2024-07-28 19:33:13
 * @LastEditors: liaozz
 * @LastEditTime: 2024-09-29 17:40:52
 * @Design version: 
 */

module cArbMerge2_N_retire
#(
	parameter DATA_WIDTH=32
)(
    input [2-1:0] i_drive_2,
    input [DATA_WIDTH-1:0] i_data0,
    input [DATA_WIDTH-1:0] i_data1,
    input i_freeNext,
    input rstn,

    output [2-1:0] o_free_2,
    output o_driveNext,
    output [DATA_WIDTH-1:0] o_data
);

  localparam DELAY_w_driveNext = 4;//为了匹配仲裁器组合电路的时间+MUX时间
  localparam DELAY_w_sendDrive1 = 8;//此参数是为了配合MUX的延时
  localparam DELAY_w_reset =3;//此参数是为了避免因ifreeNext脉宽过宽带来的竞争冒险,注意:DELAY_w_reset必须<DELAY_w_sendDrive1

  (* dont_touch="true" *)wire [2-1:0] w_fire_2;
  (* dont_touch="true" *)wire [2-1:0] w_driveNext_2;
  (* dont_touch="true" *)wire [2-1:0] w_d_driveNext_2;

  (* dont_touch="true" *)wire w_sendFire_1;

  (* dont_touch="true" *)wire [2-1:0] w_reset_2;

  (* dont_touch="true" *)wire [2-1:0] w_trig_2;

  (* dont_touch="true" *)wire [2-1:0] w_req_2;

  (* dont_touch="true" *)wire [DATA_WIDTH-1:0] w_data0, w_data1;
  (* dont_touch="true" *)reg [DATA_WIDTH-1:0] r_wdata;

  (* dont_touch="true" *)reg [DATA_WIDTH-1:0]r_data0,r_data1, r_data;

  (* dont_touch="true" *)wire w_sendFinish;
  (* dont_touch="true" *)wire pmt;
  (* dont_touch="true" *)wire pmtFinish;
  (* dont_touch="true" *)wire w_sendDrive;
  (* dont_touch="true" *)wire w_sendDrive0;
  (* dont_touch="true" *)wire w_sendDrive1;
  (* dont_touch="true" *)wire w_sendFree;
  (* dont_touch="true" *)wire [2-1:0] w_grant_2;
  (* dont_touch="true" *)wire [2-1:0] w_pmtIfreeNext_2;

  // save inputs
  genvar i;
  generate
    for (i = 0; i < 2; i = i + 1) begin : pmt_fifo
      assign w_pmtIfreeNext_2[i]=w_sendFire_1 & w_grant_2[i];
      cPmtFifo1_retire PmtFifo (
          .i_drive(i_drive_2[i]),
          .i_freeNext(w_pmtIfreeNext_2[i]),
          .o_free(o_free_2[i]),
          .o_driveNext(w_driveNext_2[i]),
          .o_fire_1(w_fire_2[i]),
          .pmt(pmt),
          .rstn(rstn)
      );
      assign w_trig_2[i]  = w_fire_2[i] | w_reset_2[i];
      freeSetDelay #(
        .DELAY_UNIT_NUM(DELAY_w_reset)
      ) delayReset (
          .i_signal(w_grant_2[i] & i_freeNext),
          .o_signal(w_reset_2[i]),
          .rstn     (rstn)
      );
      contTap tap (
          .trig(w_trig_2[i]),
          .req (w_req_2[i]),
          .rstn (rstn)
      );
      freeSetDelay #(
        .DELAY_UNIT_NUM(DELAY_w_driveNext)
      ) delayDriveNext (
          .i_signal(w_driveNext_2[i]),
          .o_signal(w_d_driveNext_2[i]),
          .rstn     (rstn)
      );
    end
  endgenerate


  always @(posedge w_fire_2[0] or negedge rstn) begin
    if (!rstn) begin
      r_data0 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data0 <= i_data0;
    end
  end
  assign w_data0 = r_data0;

  always @(posedge w_fire_2[1] or negedge rstn) begin
    if (!rstn) begin
      r_data1 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data1 <= i_data1;
    end
  end
  assign w_data1 = r_data1;


  //lock
  assign pmt = ~(|w_req_2);

  // grant
  assign w_grant_2 = w_req_2 & (~w_req_2 + 1'b1);

  //sendFifo

  assign w_sendDrive0 = (|(w_d_driveNext_2 & w_grant_2));

  assign pmtFinish = (w_req_2==w_grant_2)?1'b0:1'b1;
  freeSetDelay #(
    .DELAY_UNIT_NUM(DELAY_w_sendDrive1)
  ) delayW_sendFire (
      .i_signal(i_freeNext & pmtFinish),
      .o_signal(w_sendDrive1),
      .rstn     (rstn)
  );
  assign w_sendDrive = w_sendDrive0 | w_sendDrive1;

  cFifo1_retire sendFifo (
      .i_drive(w_sendDrive),
      .i_freeNext(i_freeNext),
      .o_free(w_sendFree),
      .o_driveNext(o_driveNext),
      .o_fire_1(w_sendFire_1),
      .rstn(rstn)
  );

  always @(posedge w_sendFire_1 or negedge rstn) begin
    if (!rstn) begin
      r_data <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data <= r_wdata;
    end
  end
  assign o_data = r_data;

  //Mux
  always @(w_grant_2) begin
    case (w_grant_2)
        2'b01: r_wdata <= w_data0 ;
        2'b10: r_wdata <= w_data1 ;
        default : r_wdata <= {DATA_WIDTH{1'b0}};
    endcase
  end

endmodule  //cArbMerge2_N_retire
