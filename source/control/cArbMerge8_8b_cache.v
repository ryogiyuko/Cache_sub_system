/*
 * @Description: 改进的arbmerge，轮转输出
 * @Author: liaozz
 * @Date: 2024-09-10 12:10:41
 * @LastEditTime: 2024-09-27 17:12:22
 */
module cArbMerge8_8b_cache #(
    parameter DATA_WIDTH = 8
) (
	  input i_drive0,i_drive1,i_drive2,i_drive3,i_drive4,i_drive5,i_drive6,i_drive7,
	  input [DATA_WIDTH-1:0] i_data0,
    input [DATA_WIDTH-1:0] i_data1,
    input [DATA_WIDTH-1:0] i_data2,
    input [DATA_WIDTH-1:0] i_data3,
    input [DATA_WIDTH-1:0] i_data4,
    input [DATA_WIDTH-1:0] i_data5,
    input [DATA_WIDTH-1:0] i_data6,
    input [DATA_WIDTH-1:0] i_data7,
    input i_freeNext,
    input rstn,
	  output o_free0,o_free1,o_free2,o_free3,o_free4,o_free5,o_free6,o_free7,
	  output o_driveNext,
    output [DATA_WIDTH-1:0] o_data
);
	wire [8-1:0]w_drive,w_free;
	assign w_drive = { i_drive7,i_drive6,i_drive5,i_drive4,i_drive3,i_drive2,i_drive1,i_drive0 };
	assign  { o_free7,o_free6,o_free5,o_free4,o_free3,o_free2,o_free1,o_free0 } = w_free;

  localparam DELAY_w_driveNext = 11;//为了匹配仲裁器组合电路的时间+MUX时间
  localparam DELAY_w_sendDrive1 = 8;//此参数是为了配合MUX的延时
  localparam DELAY_w_reset =3;//此参数是为了避免因ifreeNext脉宽过宽带来的竞争冒险,注意:DELAY_w_reset必须<DELAY_w_sendDrive1

  (* dont_touch="true" *)wire [8-1:0] w_fire_8;
  (* dont_touch="true" *)wire [8-1:0] w_driveNext_8;
  (* dont_touch="true" *)wire [8-1:0] w_d_driveNext_8;

  (* dont_touch="true" *)wire w_sendFire_1;

  (* dont_touch="true" *)wire [8-1:0] w_reset_8;

  (* dont_touch="true" *)wire [8-1:0] w_trig_8;

  (* dont_touch="true" *)wire [8-1:0] w_req_8;

  (* dont_touch="true" *)wire [DATA_WIDTH-1:0] w_data0, w_data1, w_data2, w_data3, w_data4, w_data5, w_data6, w_data7, w_data;
  (* dont_touch="true" *)reg [DATA_WIDTH-1:0] r_wdata;

  (* dont_touch="true" *)reg [DATA_WIDTH-1:0]r_data0, r_data1, r_data2, r_data3, r_data4, r_data5, r_data6, r_data7, r_data;

  (* dont_touch="true" *)wire w_sendFinish;
  (* dont_touch="true" *)wire pmt;
  (* dont_touch="true" *)wire pmtFinish;
  (* dont_touch="true" *)wire w_sendDrive;
  (* dont_touch="true" *)wire w_sendDrive0;
  (* dont_touch="true" *)wire w_sendDrive1;
  (* dont_touch="true" *)wire w_sendFree;
  (* dont_touch="true" *)wire [8-1:0] w_grant_8;
  (* dont_touch="true" *)wire [8-1:0] w_pmtIfreeNext_8;

  // save inputs
  genvar i;
  generate
    for (i = 0; i < 8; i = i + 1) begin : pmt_fifo
      assign w_pmtIfreeNext_8[i]=w_sendFire_1 & w_grant_8[i];
      cPmtFifo1_retire PmtFifo (
          .i_drive(w_drive[i]),
          .i_freeNext(w_pmtIfreeNext_8[i]),
          .o_free(w_free[i]),
          .o_driveNext(w_driveNext_8[i]),
          .o_fire_1(w_fire_8[i]),
          .pmt(pmt),
          .rstn(rstn)
      );
      assign w_trig_8[i]  = w_fire_8[i] | w_reset_8[i];
      // freeSetDelay #(
      //   .DELAY_UNIT_NUM(DELAY_w_reset)
      // ) delayReset (
      //     .i_signal(w_grant_8[i] & i_freeNext),
      //     .o_signal(w_reset_8[i]),
      //     .rstn     (rstn)
      // );
      delay3U delayReset(
          .inR  (w_grant_8[i] & i_freeNext  ),
          .outR (w_reset_8[i] ),
          .rstn  (rstn  )
      );
      contTap tap (
          .trig(w_trig_8[i]),
          .req (w_req_8[i]),
          .rstn (rstn)
      );
      // freeSetDelay #(
      //   .DELAY_UNIT_NUM(DELAY_w_driveNext)
      // ) delayDriveNext (
      //     .i_signal(w_driveNext_8[i]),
      //     .o_signal(w_d_driveNext_8[i]),
      //     .rstn     (rstn)
      // );
      delay11U delayDriveNext(
          .inR  (w_driveNext_8[i]  ),
          .outR (w_d_driveNext_8[i] ),
          .rstn  (rstn  )
      );
    end
  endgenerate


  always @(posedge w_fire_8[0] or negedge rstn) begin
    if (!rstn) begin
      r_data0 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data0 <= i_data0;
    end
  end
  assign w_data0 = r_data0;

  always @(posedge w_fire_8[1] or negedge rstn) begin
    if (!rstn) begin
      r_data1 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data1 <= i_data1;
    end
  end
  assign w_data1 = r_data1;

  always @(posedge w_fire_8[2] or negedge rstn) begin
    if (!rstn) begin
      r_data2 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data2 <= i_data2;
    end
  end
  assign w_data2 = r_data2;

  always @(posedge w_fire_8[3] or negedge rstn) begin
    if (!rstn) begin
      r_data3 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data3 <= i_data3;
    end
  end
  assign w_data3 = r_data3;

  always @(posedge w_fire_8[4] or negedge rstn) begin
    if (!rstn) begin
      r_data4 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data4 <= i_data4;
    end
  end
  assign w_data4 = r_data4;

  always @(posedge w_fire_8[5] or negedge rstn) begin
    if (!rstn) begin
      r_data5 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data5 <= i_data5;
    end
  end
  assign w_data5 = r_data5;

  always @(posedge w_fire_8[6] or negedge rstn) begin
    if (!rstn) begin
      r_data6 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data6 <= i_data6;
    end
  end
  assign w_data6 = r_data6;

  always @(posedge w_fire_8[7] or negedge rstn) begin
    if (!rstn) begin
      r_data7 <= {DATA_WIDTH{1'b0}};
    end else begin
      r_data7 <= i_data7;
    end
  end
  assign w_data7 = r_data7;

  //lock
  assign pmt = ~(|w_req_8);

  // grant
  assign w_grant_8 = w_req_8 & (~w_req_8 + 1'b1);

  //sendFifo

  assign w_sendDrive0 = (|(w_d_driveNext_8 & w_grant_8));

  assign pmtFinish = (w_req_8==w_grant_8)?1'b0:1'b1;
  freeSetDelay #(
    .DELAY_UNIT_NUM(DELAY_w_sendDrive1)
  ) delayW_sendFire (
      .i_signal(i_freeNext & pmtFinish),
      .o_signal(w_sendDrive1),
      .rstn     (rstn)
  );
  assign w_sendDrive = w_sendDrive0 | w_sendDrive1;

  cFifo1 sendFifo (
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
  always @(w_grant_8) begin
    case (w_grant_8)
        8'b00000001: r_wdata <= w_data0 ;
        8'b00000010: r_wdata <= w_data1 ;
        8'b00000100: r_wdata <= w_data2 ;
        8'b00001000: r_wdata <= w_data3 ;
        8'b00010000: r_wdata <= w_data4 ;
        8'b00100000: r_wdata <= w_data5 ;
        8'b01000000: r_wdata <= w_data6 ;
        8'b10000000: r_wdata <= w_data7 ;
        default : r_wdata <= {DATA_WIDTH{1'b0}};
    endcase
  end

endmodule
