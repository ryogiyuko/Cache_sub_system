/*
 * @Description: 改进的9路arbmerge 轮转输出
 * @Author: liaozz
 * @Date: 2024-09-10 12:36:15
 * @LastEditors: liaozz
 * @LastEditTime: 2024-09-27 12:57:33
 * @Design version: 
 */
module cArbMerge9_N_retire #(
    parameter DATA_WIDTH = 12
) (
    input [9-1:0] i_drive_9,
    input [DATA_WIDTH-1:0] i_data0,
    input [DATA_WIDTH-1:0] i_data1,
    input [DATA_WIDTH-1:0] i_data2,
    input [DATA_WIDTH-1:0] i_data3,
    input [DATA_WIDTH-1:0] i_data4,
    input [DATA_WIDTH-1:0] i_data5,
    input [DATA_WIDTH-1:0] i_data6,
    input [DATA_WIDTH-1:0] i_data7,
    input [DATA_WIDTH-1:0] i_data8,
    input i_freeNext,
    input rstn,

    output [9-1:0] o_free_9,
    output o_driveNext,
    output [DATA_WIDTH-1:0] o_data
);

  localparam DELAY_w_driveNext = 4;  //为了匹配仲裁器组合电路的时间+MUX时间
  localparam DELAY_w_sendDrive1 = 9;//此参数是为了配合MUX的延时
  localparam DELAY_w_reset =3;//此参数是为了避免因ifreeNext脉宽过宽带来的竞争冒险,注意:DELAY_w_reset必须<DELAY_w_sendDrive1

  (* dont_touch="true" *) wire [9-1:0] w_fire_9;
  (* dont_touch="true" *) wire [9-1:0] w_driveNext_9;
  (* dont_touch="true" *) wire [9-1:0] w_d_driveNext_9;
  (* dont_touch="true" *) wire w_sendFire_1;
  (* dont_touch="true" *) wire [9-1:0] w_reset_9;
  (* dont_touch="true" *) wire [9-1:0] w_trig_9;
  (* dont_touch="true" *) wire [9-1:0] w_req_9;
  (* dont_touch="true" *)wire [DATA_WIDTH-1:0] w_data0, w_data1, w_data2, w_data3, w_data4, w_data5, w_data6, w_data7, w_data8;
  (* dont_touch="true" *)reg  [DATA_WIDTH-1:0] r_wdata;
  (* dont_touch="true" *) reg [DATA_WIDTH-1:0]r_data0, r_data1, r_data2, r_data3, r_data4, r_data5, r_data6, r_data7, r_data8, r_data;
  (* dont_touch="true" *) wire pmt;
  (* dont_touch="true" *) wire pmtFinish;
  (* dont_touch="true" *) wire w_sendDrive;
  (* dont_touch="true" *) wire w_sendDrive0;
  (* dont_touch="true" *) wire w_sendDrive1;
  (* dont_touch="true" *) wire w_sendFree;
  (* dont_touch="true" *) wire [9-1:0] w_grant_9;
  (* dont_touch="true" *) wire [9-1:0] w_pmtIfreeNext_9;


  // save inputs
  genvar i;
  generate
    for (i = 0; i < 9; i = i + 1) begin : pmt_fifo
      assign w_pmtIfreeNext_9[i]=w_sendFire_1 & w_grant_9[i];
      cPmtFifo1_retire PmtFifo (
          .i_drive(i_drive_9[i]),
          .i_freeNext(w_pmtIfreeNext_9[i]),
          .o_free(o_free_9[i]),
          .o_driveNext(w_driveNext_9[i]),
          .o_fire_1(w_fire_9[i]),
          .pmt(pmt),
          .rstn(rstn)
      );
      assign w_trig_9[i]  = w_fire_9[i] | w_reset_9[i];
      freeSetDelay #(
        .DELAY_UNIT_NUM(DELAY_w_reset)
      ) delayReset (
          .i_signal(w_grant_9[i] & i_freeNext),
          .o_signal(w_reset_9[i]),
          .rstn     (rstn)
      );
      contTap tap (
          .trig(w_trig_9[i]),
          .req (w_req_9[i]),
          .rstn (rstn)
      );
      freeSetDelay #(
          .DELAY_UNIT_NUM(DELAY_w_driveNext)
      ) delayDriveNext (
          .i_signal(w_driveNext_9[i]),
          .o_signal(w_d_driveNext_9[i]),
          .rstn     (rstn)
      );
    end
  endgenerate


  always @(posedge w_fire_9[0] or negedge rstn) begin
    if (!rstn) begin
      r_data0 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data0 <= i_data0;
    end
  end
  assign w_data0 = r_data0;

  always @(posedge w_fire_9[1] or negedge rstn) begin
    if (!rstn) begin
      r_data1 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data1 <= i_data1;
    end
  end
  assign w_data1 = r_data1;

  always @(posedge w_fire_9[2] or negedge rstn) begin
    if (!rstn) begin
      r_data2 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data2 <= i_data2;
    end
  end
  assign w_data2 = r_data2;

  always @(posedge w_fire_9[3] or negedge rstn) begin
    if (!rstn) begin
      r_data3 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data3 <= i_data3;
    end
  end
  assign w_data3 = r_data3;

  always @(posedge w_fire_9[4] or negedge rstn) begin
    if (!rstn) begin
      r_data4 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data4 <= i_data4;
    end
  end
  assign w_data4 = r_data4;

  always @(posedge w_fire_9[5] or negedge rstn) begin
    if (!rstn) begin
      r_data5 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data5 <= i_data5;
    end
  end
  assign w_data5 = r_data5;

  always @(posedge w_fire_9[6] or negedge rstn) begin
    if (!rstn) begin
      r_data6 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data6 <= i_data6;
    end
  end
  assign w_data6 = r_data6;

  always @(posedge w_fire_9[7] or negedge rstn) begin
    if (!rstn) begin
      r_data7 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data7 <= i_data7;
    end
  end
  assign w_data7 = r_data7;

  always @(posedge w_fire_9[8] or negedge rstn) begin
    if (!rstn) begin
      r_data8 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data8 <= i_data8;
    end
  end
  assign w_data8 = r_data8;

  //lock
  assign pmt = ~(|w_req_9);

  // grant
  assign w_grant_9 = w_req_9 & (~w_req_9 + 1'b1);

  //sendFifo

  assign w_sendDrive0 = (|(w_d_driveNext_9 & w_grant_9));

  assign pmtFinish = (w_req_9==w_grant_9)?1'b0:1'b1;
  freeSetDelay #(
    .DELAY_UNIT_NUM(DELAY_w_sendDrive1)
  ) delayW_sendFire (
      .i_signal(i_freeNext & pmtFinish),
      .o_signal(w_sendDrive1),
      .rstn     (rstn)
  );
  assign w_sendDrive  = w_sendDrive0 | w_sendDrive1;

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
  always @(w_grant_9) begin
    case (w_grant_9)
        9'b000000001: r_wdata <= w_data0;
        9'b000000010: r_wdata <= w_data1;
        9'b000000100: r_wdata <= w_data2;
        9'b000001000: r_wdata <= w_data3;
        9'b000010000: r_wdata <= w_data4;
        9'b000100000: r_wdata <= w_data5;
        9'b001000000: r_wdata <= w_data6;
        9'b010000000: r_wdata <= w_data7;
        9'b100000000: r_wdata <= w_data8;
        default : r_wdata <= {DATA_WIDTH{1'b0}};
    endcase
  end

endmodule  //cArbMerge9_N_retire
