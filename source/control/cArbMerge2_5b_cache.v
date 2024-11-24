
module cArbMerge2_5b_cache #(
    parameter DATA_WIDTH = 5
) (
    input i_drive1,i_drive0,
    input [DATA_WIDTH-1:0] i_data0,
    input [DATA_WIDTH-1:0] i_data1,
    input i_freeNext,
    input rstn,

    output o_free1,o_free0,
    output o_driveNext,
    output [DATA_WIDTH-1:0] o_data
);
	wire [2-1:0] w_drive;
	wire [2-1:0] w_free;

	assign w_drive = { i_drive1, i_drive0 };
	assign { o_free1, o_free0 } = w_free;

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
      cPmtFifo1 PmtFifo (
          .i_drive(w_drive[i]),
          .i_freeNext(w_pmtIfreeNext_2[i]),
          .o_free(w_free[i]),
          .o_driveNext(w_driveNext_2[i]),
          .o_fire_1(w_fire_2[i]),
          .pmt(pmt),
          .rstn(rstn)
      );
      assign w_trig_2[i]  = w_fire_2[i] | w_reset_2[i];
      // freeSetDelay #(
      //   .DELAY_UNIT_NUM(DELAY_w_reset)
      // ) delayReset (
      //     .i_signal(w_grant_2[i] & i_freeNext),
      //     .o_signal(w_reset_2[i]),
      //     .rstn     (rstn)
      // );
      delay3U delayReset(
          .inR  (w_grant_2[i] & i_freeNext  ),
          .outR (w_reset_2[i] ),
          .rstn  (rstn  )
      );
      contTap tap (
          .trig(w_trig_2[i]),
          .req (w_req_2[i]),
          .rstn (rstn)
      );
      // freeSetDelay #(
      //   .DELAY_UNIT_NUM(DELAY_w_driveNext)
      // ) delayDriveNext (
      //     .i_signal(w_driveNext_2[i]),
      //     .o_signal(),
      //     .rstn     (rstn)
      // );
      delay4U delayDriveNext(
          .inR  (w_driveNext_2[i]  ),
          .outR (w_d_driveNext_2[i] ),
          .rstn  (rstn  )
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
  always @(w_grant_2) begin
    case (w_grant_2)
        2'b01: r_wdata <= w_data0 ;
        2'b10: r_wdata <= w_data1 ;
        default : r_wdata <= {DATA_WIDTH{1'b0}};
    endcase
  end

endmodule