module L2Cache(
    input rstn,
    
    //init
    input init_sign,// 1有效，启动初始化
    input init_clk, init_wea,
    input [33:0] init_PA_34,
    input [255:0] init_datain_256,

    // DCache
    input i_DCache_miss_drive, i_DCache_writeBack_drive, i_freeNext_DCache,
    output o_DCache_miss_free, o_DCache_writeBack_free, o_driveNext_DCache,

    input [33:0] i_miss_Addr_from_DCache_34, i_writeBack_Addr_from_DCache_34,
    input [255:0] i_L1Cache_writeBackLine_32B,  // ֻҪ�Ǳ�DCache writeBack������DV�϶�����1
    
    output [255:0] o_refillLine_to_L1Cache_32B, // ICache DCache ���� ���忿�¼�����

    // ICache
    input i_ICache_miss_drive, i_freeNext_ICache,
    output o_ICache_miss_free, o_driveNext_ICache,

    input [33:0] i_miss_Addr_from_ICache_34,
    // output [255:0] o_refillLine_to_L1Cache_32B
    
    output [1:0] o_DCache_or_ICache_2,  // ��������refillLine�Ǹ�ICache���Ǹ�DCache

    // DDR
    input i_DDR_drive, i_freeNext_DDR_miss, i_freeNext_DDR_writeBack,
    output o_DDR_free, o_driveNext_DDR_miss, o_driveNext_DDR_writeBack, // L2Cache Ҳ�� miss writeBack �����¼�����DDR

    output [33:0] o_miss_Addr_to_DDR_34, o_writeBack_Addr_to_DDR_34,
    input [255:0] i_DDR_refillLine_32B,
    output [255:0] o_writeBackLine_to_DDR_32B

	//a

    // ����
    ,output [3:0] o_r_case_number_4
    ,output [1:0] o_r_DCache_or_ICache_2
    ,output o_w_need_writeBack,
    output [33:0] o_r_physical_Addr_34,
    output o_w_hit,
    output o_w_have_empty,
    output [6:0] o_w_2_plruSRAM_addr_7,
    output [6:0] o_w_2_plruSRAM_in_7,
    output o_w_2_read_or_write_plruSRAM,
    output o_w_read_or_write_plruSRAM,
    output o_r_plruSRAM_OP_sel,
    output o_r_dvSRAM_OP_sel,
    output o_r_OP_sel1,
    output o_r_OP_sel2,
    output o_w_1_read_or_write_plruSRAM,
    output [255:0] o_r_refillLine_to_L2Cache_32B,
    output o_r_selector1_valid,
    output [6:0] o_r_2_plruSRAM_in_7,
    output [255:0] o_r_result_data_32B,

    output o_r_hit, o_r_have_empty, o_r_need_writeBack,
    output [2:0] o_r_hit_way_3, o_r_empty_way_3, o_r_evict_way_3
);

// mutex0 (cMutexMerge2_5b)
    wire w_mutex0_drive_arb1;
    wire w_mutex0_free_arb1;
    wire [4:0] w_mutex0_data_to_arb1_5;

// arb1 (cArbMerge2_5b)
    wire w_arb1_drive_mutex1, w_arb1_free_mutex1;
    wire [4:0] w_arb1_data_to_mutex1_5;

// mutex1 (cMutexMerge3_outpmt_5b)
    wire w_mutex1_drive_cfifo1, w_mutex1_free_cfifo1;
    wire [4:0] w_mutex1_data_to_cfifo1_5;
    wire w_pmt_mutex1_to_cfifo1;

// cfifo1 (cPmtFifo2)
    wire w_cfifo1_drive_selector1, w_cfifo1_free_selector1;
    wire [1:0] w_cfifo1_fire_2;

    // fire0
    reg [3:0] r_case_number_4;  // 0001 L1 miss  0010 L1(DCache)д��  0100 miss ����  1000 д�ػ���
    reg [1:0] r_DCache_or_ICache_2; // 10:DCache  01:ICache   ��¼��������������
    reg [33:0] r_physical_Addr_34;
    reg [255:0] w_refillLine_to_L2Cache_32B;    // DDR ���� ��writeBack����

    reg r_OP_sel1;
    reg r_OP_sel2;

    // tagSRAM
    reg w_read_or_write_tagSRAM;
    reg [18:0] w_tagSRAM_in_19;
    reg [9:0] w_tagSRAM_addr_10;
    wire [18:0] w_tagSRAM_out_way0_19, w_tagSRAM_out_way1_19, w_tagSRAM_out_way2_19, w_tagSRAM_out_way3_19;
    wire [18:0] w_tagSRAM_out_way4_19, w_tagSRAM_out_way5_19, w_tagSRAM_out_way6_19, w_tagSRAM_out_way7_19;
    reg [18:0] w_writeBack_tag_19;
    
    // dvSRAM 
    wire w_dvSRAM_OP_sel;

    reg w_read_or_write_dvSRAM;
    reg [1:0] w_dvSRAM_in_2;
    reg [9:0] w_dvSRAM_addr_10;

    reg w_1_read_or_write_dvSRAM;
    reg [1:0] w_1_dvSRAM_in_2;
    reg [9:0] w_1_dvSRAM_addr_10;

    reg r_read_or_write_dvSRAM;
    reg [1:0] r_dvSRAM_in_2;
    reg [9:0] r_dvSRAM_addr_10;

    wire [1:0] w_dvSRAM_out_way0_2, w_dvSRAM_out_way1_2, w_dvSRAM_out_way2_2, w_dvSRAM_out_way3_2;
    wire [1:0] w_dvSRAM_out_way4_2, w_dvSRAM_out_way5_2, w_dvSRAM_out_way6_2, w_dvSRAM_out_way7_2;


    // plruSRAM
    wire w_plruSRAM_OP_sel;

    reg w_read_or_write_plruSRAM;
    reg [6:0] w_plruSRAM_in_7;
    reg [6:0] w_plruSRAM_addr_7;
    wire [6:0] w_plruSRAM_out_7;

    reg w_1_read_or_write_plruSRAM;
    reg [6:0] w_1_plruSRAM_in_7;
    reg [6:0] w_1_plruSRAM_addr_7;

    reg w_2_read_or_write_plruSRAM;
    reg [6:0] w_2_plruSRAM_in_7;
    reg [6:0] r_2_plruSRAM_in_7;
    reg [6:0] w_2_plruSRAM_addr_7;

    // dataSRAM
    reg r_read_or_write_dataSRAM;
    reg [9:0] r_dataSRAM_addr_10;
    //reg [255:0] r_dataSRAM_in_32B;
    wire [255:0] w_dataSRAM_in_32B;
    wire [255:0] w_dataSRAM_out_way7_32B, w_dataSRAM_out_way6_32B, w_dataSRAM_out_way5_32B, w_dataSRAM_out_way4_32B, w_dataSRAM_out_way3_32B, w_dataSRAM_out_way2_32B, w_dataSRAM_out_way1_32B, w_dataSRAM_out_way0_32B; 


    reg [255:0] w_result_data_32B;
    reg [33:0] w_miss_addr_to_DDR_34;


    //tag Compare
    wire w_hit;
    wire w_need_writeBack;
    wire w_have_empty;
    wire [2:0] w_hit_way_3;
    wire [2:0] w_empty_way_3;
    wire [2:0] w_evict_way_3;

    reg [18:0] w_toCompare_tag_19;

    wire w_1_cfifo1_delayDrive_selector1;


// selector1 (cSelector2)   
    wire w_selector1_drive_cfifo2, w_selector1_free_cfifo2;
    wire w_selector1_fire;

    reg r_selector1_valid;
    
    //record tagCompare
    reg r_hit, r_have_empty, r_need_writeBack;
    reg [2:0] r_hit_way_3, r_empty_way_3, r_evict_way_3;
    // wire w_1_driveNext_DDR_miss;
    // wire w_2_driveNext_DDR_miss;


// cfifo2 (cFifo1)
    wire w_cfifo2_drive_selector2, w_cfifo2_free_selector2;
    wire w_cfifo2_fire;

    // wire w_1_cfifo2_delayDrive_selector2;
    // wire w_2_cfifo2_delayDrive_selector2;

// selector2 (cSelector4)
    reg [33:0] w_writeBack_Addr_to_DDR_34;

    wire w_selector2_drive_mutex1;
    wire w_selector2_free_mutex1;
    wire w_selector2_fire;

    reg r_selector2_valid0;
    reg r_selector2_valid1;
    reg r_selector2_valid2;
    reg r_selector2_valid3;

// ����
    assign o_r_case_number_4 = r_case_number_4;
    assign o_r_DCache_or_ICache_2 = r_DCache_or_ICache_2;
    assign o_w_need_writeBack = w_need_writeBack;
    assign o_w_hit = w_hit;
    assign o_w_have_empty = w_have_empty;
    assign o_r_physical_Addr_34 = r_physical_Addr_34;
    assign o_w_2_plruSRAM_addr_7 = w_2_plruSRAM_addr_7;
    assign o_w_2_plruSRAM_in_7 = w_2_plruSRAM_in_7;
    assign o_w_2_read_or_write_plruSRAM = w_2_read_or_write_plruSRAM;
    assign o_w_read_or_write_plruSRAM = w_read_or_write_plruSRAM;
    assign o_r_plruSRAM_OP_sel = w_plruSRAM_OP_sel;
    assign o_r_dvSRAM_OP_sel = w_dvSRAM_OP_sel;
    assign o_r_OP_sel1 = r_OP_sel1;
    assign o_r_OP_sel2 = r_OP_sel2;
    assign o_w_1_read_or_write_plruSRAM = w_1_read_or_write_plruSRAM;
    assign o_r_refillLine_to_L2Cache_32B = w_refillLine_to_L2Cache_32B;
    assign o_r_selector1_valid = r_selector1_valid;
    assign o_r_2_plruSRAM_in_7 = r_2_plruSRAM_in_7;
    assign o_r_result_data_32B = w_result_data_32B;
    assign o_r_hit_way_3 = r_hit_way_3;
    assign o_r_empty_way_3 =  r_empty_way_3;
    assign o_r_evict_way_3 = r_evict_way_3;
    assign o_r_hit =  r_hit;
    assign o_r_have_empty = r_have_empty;
    assign o_r_need_writeBack =  r_need_writeBack;

// mutex0
// DCache miss:00001  writeBack:00010
    wire mutex0_delay_drive0;
    reg [4:0] mutex0_data0_5, mutex0_data1_5, arb1_data1_5, mutex1_data1_5, mutex1_data2_5;

    always @(posedge i_DCache_miss_drive or negedge rstn) begin
        if (rstn==0) begin
            mutex0_data0_5 <= 5'b00001;
            mutex0_data1_5 <= 5'b00010;
            arb1_data1_5 <= 5'b00100;
            mutex1_data1_5 <= 5'b01000;
            mutex1_data2_5 <= 5'b10000;
        end
        else begin
            mutex0_data0_5 <= 5'b00001;
            mutex0_data1_5 <= 5'b00010;
            arb1_data1_5 <= 5'b00100;
            mutex1_data1_5 <= 5'b01000;
            mutex1_data2_5 <= 5'b10000;
        end
    end

    delay6U u_delayin_6U(
        .inR  (i_DCache_miss_drive  ),
        .rstn (rstn ),
        .outR (mutex0_delay_drive0 )
    );
    

    (*dont_touch = "true"*)cMutexMerge2_5b_cache mutex0(
        .i_drive0   (mutex0_delay_drive0),
        .i_drive1   (i_DCache_writeBack_drive),
        .i_data0    (mutex0_data0_5),
        .i_data1    (mutex0_data1_5),
        .i_freeNext (w_mutex0_free_arb1), // w_mutex0_free_cfifo0

        .o_free0    (o_DCache_miss_free),
        .o_free1    (o_DCache_writeBack_free),

        .o_driveNext(w_mutex0_drive_arb1),
        .o_data     (w_mutex0_data_to_arb1_5),
        .rstn        (rstn)

        //.pmt        (w_pmt_mutex0_to_cfifo0)
    );


// arb1
// ICache miss:00100
    (*dont_touch = "true"*)cArbMerge2_5b_cache arb1(
        .i_drive0   (w_mutex0_drive_arb1),
        .i_drive1   (i_ICache_miss_drive),
        .i_data0    (w_mutex0_data_to_arb1_5),
        .i_data1    (arb1_data1_5),

        .i_freeNext (w_arb1_free_mutex1),
        .rstn        (rstn),
        .o_free0    (), // w_cfifo0_free_arb1
        .o_free1    (), // o_ICache_miss_free

        .o_driveNext(w_arb1_drive_mutex1),
        .o_data     (w_arb1_data_to_mutex1_5)
    );

    assign w_mutex0_free_arb1 = o_driveNext_DCache;
    assign o_ICache_miss_free = o_driveNext_ICache;
    assign w_arb1_free_mutex1 = (o_driveNext_DCache | o_driveNext_ICache);  // ���ɹ���L1Cache�������� ��free arb
    assign o_DDR_free = w_cfifo2_drive_selector2 & ( r_case_number_4[2] | r_case_number_4[3] );

// mutex1
// ���վ�������L2Cacheģ�� Ҫ�����ĸ��¼�

    (*dont_touch = "true"*)cMutexMerge3_outpmt_5b mutex1(
        .i_drive0   (w_arb1_drive_mutex1),
        .i_drive1   (w_selector2_drive_mutex1),
        .i_drive2   (i_DDR_drive),

        .i_data0    (w_arb1_data_to_mutex1_5),
        .i_data1    (mutex1_data1_5),
        .i_data2    (mutex1_data2_5),

        .i_freeNext (w_mutex1_free_cfifo1),
        .rstn        (rstn),
        .pmt        (w_pmt_mutex1_to_cfifo1),
        
        .o_free0    (), // w_arb1_free_mutex1
        .o_free1    (w_selector2_free_mutex1),
        .o_free2    (), // o_DDR_free

        .o_driveNext(w_mutex1_drive_cfifo1),
        .o_data     (w_mutex1_data_to_cfifo1_5)
    );


//  cfifo1
//
    (*dont_touch = "true"*)cPmtFifo2_cache cfifo1(
        .rstn        (rstn),
        .pmt        (w_pmt_mutex1_to_cfifo1),

        .i_drive    (w_mutex1_drive_cfifo1),
        .o_free     (w_mutex1_free_cfifo1),

        .o_driveNext(w_cfifo1_drive_selector1),
        .i_freeNext (w_cfifo1_free_selector1),

        .o_fire_2   (w_cfifo1_fire_2)
    );

    
    always @(posedge w_cfifo1_fire_2[0] or negedge rstn) begin
        if (rstn == 0) begin 
            r_case_number_4 <= 4'b0000;
            r_DCache_or_ICache_2 <= 2'b00;
            r_physical_Addr_34 <= 34'b0;
            //r_refillLine_to_L2Cache_32B <= 256'b0;
        end 
        else begin 

            if (w_mutex1_data_to_cfifo1_5[0] | w_mutex1_data_to_cfifo1_5[2]) begin 
                r_case_number_4 <= 4'b0001; // L1 miss
                //r_refillLine_to_L2Cache_32B <= 256'b0;
                if (w_mutex1_data_to_cfifo1_5[0]) begin
                    r_DCache_or_ICache_2 <= 2'b10;  // DCache
                    r_physical_Addr_34 <= i_miss_Addr_from_DCache_34;
                end
                else begin
                    r_DCache_or_ICache_2 <= 2'b01;  // ICache
                    r_physical_Addr_34 <= i_miss_Addr_from_ICache_34;
                end
            end
            else if (w_mutex1_data_to_cfifo1_5[1]) begin 
                r_case_number_4 <= 4'b0010; // L1(DCache) д��
                r_DCache_or_ICache_2 <= 2'b10;  // DCache
                r_physical_Addr_34 <= i_writeBack_Addr_from_DCache_34;
                //r_refillLine_to_L2Cache_32B <= i_L1Cache_writeBackLine_32B;
            end
            else if (w_mutex1_data_to_cfifo1_5[3]) begin 
                r_case_number_4 <= 4'b0001;
                r_DCache_or_ICache_2 <= 2'b10;
                r_physical_Addr_34 <= i_miss_Addr_from_DCache_34;
                //r_refillLine_to_L2Cache_32B <= 256'b0;
            end
            else if (w_mutex1_data_to_cfifo1_5[4]) begin    // ��Ի����������
                r_DCache_or_ICache_2 <= r_DCache_or_ICache_2;
                if (r_case_number_4[0]) begin
                    r_case_number_4 <= 4'b0100; // L2miss DDR����L2
                    r_physical_Addr_34 <= r_physical_Addr_34;
                    //r_refillLine_to_L2Cache_32B <= i_DDR_refillLine_32B;
                end
                else if (r_case_number_4[1]) begin
                    r_case_number_4 <= 4'b1000; // DCache����L2
                    r_physical_Addr_34 <= r_physical_Addr_34;
                    // r_refillLine_to_L2Cache_32B <= r_refillLine_to_L2Cache_32B;
                    //r_refillLine_to_L2Cache_32B <= i_L1Cache_writeBackLine_32B;
                end
                else begin
                    r_case_number_4 <= r_case_number_4;
                    r_physical_Addr_34 <= r_physical_Addr_34;
                    //r_refillLine_to_L2Cache_32B <= r_refillLine_to_L2Cache_32B;
                end
            end
            // else begin 
            //     r_case_number_4 <= r_case_number_4;
            //     r_DCache_or_ICache_2 <= r_DCache_or_ICache_2;
            //     r_physical_Addr_34 <= r_physical_Addr_34;
            //     //r_refillLine_to_L2Cache_32B <= r_refillLine_to_L2Cache_32B;
            // end
        end
    end


    always @( *) begin
        if (r_case_number_4[2]) begin 
                w_refillLine_to_L2Cache_32B = i_DDR_refillLine_32B;
        end
        else if (r_case_number_4[1] | r_case_number_4[3]) begin 
                w_refillLine_to_L2Cache_32B = i_L1Cache_writeBackLine_32B;
        end
        else begin 
                w_refillLine_to_L2Cache_32B = 256'b0;
        end
    end

    always @(posedge w_cfifo1_fire_2[0] or negedge rstn) begin
        if (rstn == 0) begin 
            r_OP_sel1 <= 1'b0;
        end 
        else begin 
            r_OP_sel1 <= ~r_OP_sel1;
        end
    end

  
    // �ж϶� tagSRAM dvSRAM plruSRAM �Ĳ����Ƕ�����д
    // DDR���� dv��01   writeBack���� dv:11
    // ��ͳһ�� plruSRAM ����
    // always @(r_case_number_4[3:0] or r_physical_Addr_34[33:0]) begin 
    always @( *) begin
        if (r_case_number_4[0]) begin   // L1 miss
            w_1_read_or_write_plruSRAM = 1'b0;
            w_1_plruSRAM_in_7 = 7'b0;
            w_1_plruSRAM_addr_7 = r_physical_Addr_34[14:8];

            w_read_or_write_tagSRAM = 1'b0;
            w_tagSRAM_in_19 = 19'b0;

            w_1_read_or_write_dvSRAM = 1'b0;
            w_1_dvSRAM_in_2 = 2'b00;
            
            if (r_DCache_or_ICache_2[1]) begin  // DCache
                w_tagSRAM_addr_10 = {i_miss_Addr_from_DCache_34[14:8], 3'b000};
                w_1_dvSRAM_addr_10 = {i_miss_Addr_from_DCache_34[14:8], 3'b000};
            end
            else begin  // ICache
                w_tagSRAM_addr_10 = {i_miss_Addr_from_ICache_34[14:8], 3'b000};
                w_1_dvSRAM_addr_10 = {i_miss_Addr_from_ICache_34[14:8], 3'b000};
            end
        end
        else if (r_case_number_4[1]) begin  // L1 writeBack
            w_1_read_or_write_plruSRAM = 1'b0;
            w_1_plruSRAM_in_7 = 7'b0;
            w_1_plruSRAM_addr_7 = r_physical_Addr_34[14:8];

            w_read_or_write_tagSRAM = 1'b0;
            w_tagSRAM_in_19 = 19'b0;
            w_tagSRAM_addr_10 = {i_writeBack_Addr_from_DCache_34[14:8], 3'b000};

            w_1_read_or_write_dvSRAM = 1'b0;
            w_1_dvSRAM_in_2 = 2'b00;
            w_1_dvSRAM_addr_10 = {i_writeBack_Addr_from_DCache_34[14:8], 3'b000};
        end
        else if (r_case_number_4[2]) begin  // DDR����
            if (~r_need_writeBack) begin 
                w_1_read_or_write_plruSRAM = 1'b0;
                w_1_plruSRAM_in_7 = 7'b0;
                w_1_plruSRAM_addr_7 = r_physical_Addr_34[14:8];
            end
            else begin 
                w_1_read_or_write_plruSRAM = 1'b1;
                w_1_plruSRAM_in_7 = r_2_plruSRAM_in_7;
                w_1_plruSRAM_addr_7 = w_2_plruSRAM_addr_7;
            end

            w_read_or_write_tagSRAM = 1'b1;

            w_1_read_or_write_dvSRAM = 1'b1;
            w_1_dvSRAM_in_2 = 2'b01;
            
            if (r_DCache_or_ICache_2[1]) begin  // DCache

                if (r_have_empty) begin 
                    w_tagSRAM_addr_10 = {i_miss_Addr_from_DCache_34[14:8], r_empty_way_3};
                    w_tagSRAM_in_19 = i_miss_Addr_from_DCache_34[33:15];
                    w_1_dvSRAM_addr_10 = {i_miss_Addr_from_DCache_34[14:8], r_empty_way_3};
                end
                // else if (r_need_writeBack) begin 
                //     w_tagSRAM_addr_10 = {i_miss_Addr_from_DCache_34[14:8], r_evict_way_3};
                //     w_tagSRAM_in_19 = i_miss_Addr_from_DCache_34[33:15];
                //     w_1_dvSRAM_addr_10 = {i_miss_Addr_from_DCache_34[14:8], r_evict_way_3};
                // end
                else begin 
                    w_tagSRAM_addr_10 = {i_miss_Addr_from_DCache_34[14:8], r_evict_way_3};
                    w_tagSRAM_in_19 = i_miss_Addr_from_DCache_34[33:15];
                    w_1_dvSRAM_addr_10 = {i_miss_Addr_from_DCache_34[14:8], r_evict_way_3};
                end
            end
            else begin  // ICache

                if (r_have_empty) begin 
                    w_tagSRAM_addr_10 = {i_miss_Addr_from_ICache_34[14:8], r_empty_way_3};
                    w_tagSRAM_in_19 = i_miss_Addr_from_ICache_34[33:15];
                    w_1_dvSRAM_addr_10 = {i_miss_Addr_from_ICache_34[14:8], r_empty_way_3};
                end
                // else if (r_need_writeBack) begin 
                //     w_tagSRAM_addr_10 = {i_miss_Addr_from_ICache_34[14:8], r_evict_way_3};
                //     w_tagSRAM_in_19 = i_miss_Addr_from_ICache_34[33:15];
                //     w_1_dvSRAM_addr_10 = {i_miss_Addr_from_ICache_34[14:8], r_evict_way_3};
                // end
                else begin 
                    w_tagSRAM_addr_10 = {i_miss_Addr_from_ICache_34[14:8], r_evict_way_3};
                    w_tagSRAM_in_19 = i_miss_Addr_from_ICache_34[33:15];
                    w_1_dvSRAM_addr_10 = {i_miss_Addr_from_ICache_34[14:8], r_evict_way_3};
                end
            end
        end
        else if (r_case_number_4[3]) begin  // writeBack����
            if (~r_need_writeBack) begin 
                w_1_read_or_write_plruSRAM = 1'b0;
                w_1_plruSRAM_in_7 = 7'b0;
                w_1_plruSRAM_addr_7 = r_physical_Addr_34[14:8];
            end
            else begin 
                w_1_read_or_write_plruSRAM = 1'b1;
                w_1_plruSRAM_in_7 = r_2_plruSRAM_in_7;
                w_1_plruSRAM_addr_7 = w_2_plruSRAM_addr_7;
            end

            w_read_or_write_tagSRAM = 1'b1;
            w_tagSRAM_in_19 = i_writeBack_Addr_from_DCache_34[33:15];
            //w_tagSRAM_addr_10 = {i_writeBack_Addr_from_DCache_34[14:8], r_refill_way_3};

            w_1_read_or_write_dvSRAM = 1'b1;
            w_1_dvSRAM_in_2 = 2'b11;
            //w_1_dvSRAM_addr_10 = {i_writeBack_Addr_from_DCache_34[14:8], r_refill_way_3};

            if (r_hit) begin 
                w_tagSRAM_addr_10 = {i_writeBack_Addr_from_DCache_34[14:8], r_hit_way_3};
                w_1_dvSRAM_addr_10 = {i_writeBack_Addr_from_DCache_34[14:8], r_hit_way_3};
            end
            else begin 
                if (r_have_empty) begin 
                    w_tagSRAM_addr_10 = {i_writeBack_Addr_from_DCache_34[14:8], r_empty_way_3};
                    w_1_dvSRAM_addr_10 = {i_writeBack_Addr_from_DCache_34[14:8], r_empty_way_3};
                end
                else begin 
                    w_tagSRAM_addr_10 = {i_writeBack_Addr_from_DCache_34[14:8], r_evict_way_3};
                    w_1_dvSRAM_addr_10 = {i_writeBack_Addr_from_DCache_34[14:8], r_evict_way_3};
                end
            end
        end
        else begin
            w_1_read_or_write_plruSRAM = 1'b0;
            w_1_plruSRAM_in_7 = 7'b0;
            w_1_plruSRAM_addr_7 = 7'b0;

            w_read_or_write_tagSRAM = 1'b0;
            w_tagSRAM_in_19 = 19'b0;
            w_tagSRAM_addr_10 = 10'b0;

            w_1_read_or_write_dvSRAM = 1'b0;
            w_1_dvSRAM_in_2 = 2'b00;
            w_1_dvSRAM_addr_10 = 10'b0;
        end
    end

    // dvSRAM ģ�鴦��
    // DDR���� dv��01   writeBack���� dv:11
    always @( *) begin 
        if (w_dvSRAM_OP_sel == 1'b1) begin 
            w_read_or_write_dvSRAM = w_1_read_or_write_dvSRAM;
            w_dvSRAM_in_2 = w_1_dvSRAM_in_2;
            w_dvSRAM_addr_10 = w_1_dvSRAM_addr_10;
        end
        else begin 
            w_read_or_write_dvSRAM = r_read_or_write_dvSRAM;
            w_dvSRAM_in_2 = r_dvSRAM_in_2;
            w_dvSRAM_addr_10 = r_dvSRAM_addr_10;
        end
    end

    // plruSRAM ģ�鴦��
    always @( *) begin 
        if (w_plruSRAM_OP_sel == 1'b1) begin 
            w_read_or_write_plruSRAM = w_1_read_or_write_plruSRAM;
            w_plruSRAM_in_7 = w_1_plruSRAM_in_7;
            w_plruSRAM_addr_7 = w_1_plruSRAM_addr_7;
        end
        else begin 
            w_read_or_write_plruSRAM = w_2_read_or_write_plruSRAM;
            w_plruSRAM_in_7 = r_2_plruSRAM_in_7;
            w_plruSRAM_addr_7 = w_2_plruSRAM_addr_7;
        end
    end

    assign w_dvSRAM_OP_sel = r_OP_sel1 ^ r_OP_sel2;
    assign w_plruSRAM_OP_sel = r_OP_sel1 ^ r_OP_sel2;

    //init
    wire w_withInit_tagClk, w_withInit_dvClk, w_withInit_tagWea ,w_withInit_dvWea;
    wire [9:0] w_withInit_tagAddr_10, w_withInit_dvAddr_10;
    wire [18:0] w_withInit_tagDina;
    wire [1:0] w_withInit_dvDina; // 高d 低v

    assign w_withInit_tagClk = init_sign ? init_clk : w_cfifo1_fire_2[1];
    assign w_withInit_dvClk = init_sign ? init_clk : (w_cfifo1_fire_2[1] | w_selector2_fire);
    assign w_withInit_tagWea = init_sign ? init_wea : w_read_or_write_tagSRAM;
    assign w_withInit_dvWea = init_sign ? init_wea : w_read_or_write_dvSRAM;
    assign w_withInit_tagAddr_10 = init_sign ? {init_PA_34[14:8], init_PA_34[17:15]} : w_tagSRAM_addr_10;
    assign w_withInit_dvAddr_10 = init_sign ? {init_PA_34[14:8], init_PA_34[17:15]} : w_dvSRAM_addr_10;
    assign w_withInit_tagDina = init_sign ? init_PA_34[33:15] : w_tagSRAM_in_19;
    assign w_withInit_dvDina = init_sign ? 2'b01 : w_dvSRAM_in_2;

    // tagSRAM ģ��
    L2Cache_tagSRAM u_L2Cache_tagSRAM (
        .clka   (w_withInit_tagClk), 
        .ena    (1'b1),      
        .wea    (w_withInit_tagWea),    
        .addra  (w_withInit_tagAddr_10),  
        .dina   (w_withInit_tagDina),   
        .douta  ({w_tagSRAM_out_way7_19, w_tagSRAM_out_way6_19, w_tagSRAM_out_way5_19, w_tagSRAM_out_way4_19, w_tagSRAM_out_way3_19, w_tagSRAM_out_way2_19, w_tagSRAM_out_way1_19, w_tagSRAM_out_way0_19})
    );


    // dvSRAM ģ��
    L2Cache_dvSRAM u_L2Cache_dvSRAM (
        //.clka   (w_cfifo1_fire_2[1] | w_selector2_fire), 
        .clka   (w_withInit_dvClk),
        .ena    (1'b1),      
        .wea    (w_withInit_dvWea),    
        .addra  (w_withInit_dvAddr_10),  
        .dina   (w_withInit_dvDina),   
        .douta  ({w_dvSRAM_out_way7_2, w_dvSRAM_out_way6_2, w_dvSRAM_out_way5_2, w_dvSRAM_out_way4_2, w_dvSRAM_out_way3_2, w_dvSRAM_out_way2_2, w_dvSRAM_out_way1_2, w_dvSRAM_out_way0_2})
    );


    // plruSRAM ģ��
    L2Cache_plruSRAM u_L2Cache_plruSRAM (
        .clka   (w_cfifo1_fire_2[1] | w_selector2_fire), 
        .ena    (1'b1),      
        .wea    (w_read_or_write_plruSRAM),     
        .addra  (w_plruSRAM_addr_7),  
        .dina   (w_plruSRAM_in_7),   
        .douta  (w_plruSRAM_out_7)
    );

    always @(*) begin 
        if (r_case_number_4[0] | r_case_number_4[2]) begin 
            if (r_DCache_or_ICache_2[0]) begin 
                w_toCompare_tag_19 = i_miss_Addr_from_ICache_34[33:15];
            end
            else begin 
                w_toCompare_tag_19 = i_miss_Addr_from_DCache_34[33:15];
            end
        end
        else if (r_case_number_4[1] | r_case_number_4[3]) begin 
                w_toCompare_tag_19 = i_writeBack_Addr_from_DCache_34[33:15];
        end
        else begin 
            w_toCompare_tag_19 = 19'b0;
        end
    end

    // tag Compare
    (*dont_touch = "true"*)L2Cache_tag_compare u_L2Cache_tag_compare(
        .toCompare_tag_19                (w_toCompare_tag_19),  // PA[33:15] r_physical_Addr_34[33:15]
        .L2Cache_tagSRAM_out_way7_19     (w_tagSRAM_out_way7_19),
        .L2Cache_tagSRAM_out_way6_19     (w_tagSRAM_out_way6_19), 
        .L2Cache_tagSRAM_out_way5_19     (w_tagSRAM_out_way5_19),
        .L2Cache_tagSRAM_out_way4_19     (w_tagSRAM_out_way4_19),
        .L2Cache_tagSRAM_out_way3_19     (w_tagSRAM_out_way3_19), 
        .L2Cache_tagSRAM_out_way2_19     (w_tagSRAM_out_way2_19), 
        .L2Cache_tagSRAM_out_way1_19     (w_tagSRAM_out_way1_19), 
        .L2Cache_tagSRAM_out_way0_19     (w_tagSRAM_out_way0_19),
        
        .L2Cache_dvSRAM_out_way7_2      (w_dvSRAM_out_way7_2), 
        .L2Cache_dvSRAM_out_way6_2      (w_dvSRAM_out_way6_2), 
        .L2Cache_dvSRAM_out_way5_2      (w_dvSRAM_out_way5_2), 
        .L2Cache_dvSRAM_out_way4_2      (w_dvSRAM_out_way4_2),
        .L2Cache_dvSRAM_out_way3_2      (w_dvSRAM_out_way3_2),     
        .L2Cache_dvSRAM_out_way2_2      (w_dvSRAM_out_way2_2), 
        .L2Cache_dvSRAM_out_way1_2      (w_dvSRAM_out_way1_2), 
        .L2Cache_dvSRAM_out_way0_2      (w_dvSRAM_out_way0_2),
        
        .L2Cache_plruSRAM_out_7          (w_plruSRAM_out_7),

        .hit                             (w_hit), // �Ƿ�����
        .hit_way_3                       (w_hit_way_3),  
        
        .have_empty                      (w_have_empty),
        .empty_way_3                     (w_empty_way_3),

        .need_writeBack                  (w_need_writeBack),
        .evict_way_3                     (w_evict_way_3)
    );

    // plru update
    // hit: ����    needWriteBack������
    always @( *) begin 
    //always @( *) begin
        if (r_case_number_4[0] | r_case_number_4[1]) begin 
            w_2_plruSRAM_addr_7 = r_physical_Addr_34[14:8];
            if (r_hit & (~r_need_writeBack)) begin 
                w_2_read_or_write_plruSRAM = 1'b1;
                w_writeBack_tag_19 = 19'b0;
                case (r_hit_way_3)
                    3'b000:begin
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = 1'b1;
                    w_2_plruSRAM_in_7[2] = w_plruSRAM_out_7[2];
                    w_2_plruSRAM_in_7[1] = 1'b1;
                    w_2_plruSRAM_in_7[0] = 1'b1;
                    end
                    3'b001:begin
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = 1'b0;
                    w_2_plruSRAM_in_7[2] = w_plruSRAM_out_7[2];
                    w_2_plruSRAM_in_7[1] = 1'b1;
                    w_2_plruSRAM_in_7[0] = 1'b1;
                    end 
                    3'b010:begin
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = 1'b1;
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = w_plruSRAM_out_7[2];
                    w_2_plruSRAM_in_7[1] = 1'b0;
                    w_2_plruSRAM_in_7[0] = 1'b1;
                    end
                    3'b011:begin
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = 1'b0;
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = w_plruSRAM_out_7[2];
                    w_2_plruSRAM_in_7[1] = 1'b0;
                    w_2_plruSRAM_in_7[0] = 1'b1;
                    end
                    3'b100:begin
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = 1'b1;
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = 1'b1;
                    w_2_plruSRAM_in_7[1] = w_plruSRAM_out_7[1];
                    w_2_plruSRAM_in_7[0] = 1'b0;
                    end
                    3'b101: begin
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = 1'b0;
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = 1'b1;
                    w_2_plruSRAM_in_7[1] = w_plruSRAM_out_7[1];
                    w_2_plruSRAM_in_7[0] = 1'b0;
                    end
                    3'b110: begin
                    w_2_plruSRAM_in_7[6] = 1'b1;
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = 1'b0;
                    w_2_plruSRAM_in_7[1] = w_plruSRAM_out_7[1];
                    w_2_plruSRAM_in_7[0] = 1'b0;
                    end
                    default: begin
                    w_2_plruSRAM_in_7[6] = 1'b0;
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = 1'b0;
                    w_2_plruSRAM_in_7[1] = w_plruSRAM_out_7[1];
                    w_2_plruSRAM_in_7[0] = 1'b0;
                    end
                    //default: w_2_plruSRAM_in_7 = w_plruSRAM_out_7;
                endcase
            end
            else if (r_hit & r_need_writeBack) begin
                if (r_case_number_4[0]) begin 
                    w_2_read_or_write_plruSRAM = 1'b1;
                end 
                else begin 
                    w_2_read_or_write_plruSRAM = 1'b0;
                end
                case (r_hit_way_3)
                    3'b000: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way0_19;  
                    
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = 1'b1;
                    w_2_plruSRAM_in_7[2] = w_plruSRAM_out_7[2];
                    w_2_plruSRAM_in_7[1] = 1'b1;
                    w_2_plruSRAM_in_7[0] = 1'b1;
                    end
                    3'b001: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way1_19; 
                    
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = 1'b0;
                    w_2_plruSRAM_in_7[2] = w_plruSRAM_out_7[2];
                    w_2_plruSRAM_in_7[1] = 1'b1;
                    w_2_plruSRAM_in_7[0] = 1'b1;
                    end
                    3'b010: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way2_19; 
                    
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = 1'b1;
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = w_plruSRAM_out_7[2];
                    w_2_plruSRAM_in_7[1] = 1'b0;
                    w_2_plruSRAM_in_7[0] = 1'b1;
                    end
                   
                    3'b011: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way3_19; 
                    
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = 1'b0;
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = w_plruSRAM_out_7[2];
                    w_2_plruSRAM_in_7[1] = 1'b0;
                    w_2_plruSRAM_in_7[0] = 1'b1;
                    end
                    
                    3'b100: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way4_19; 
                    
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = 1'b1;
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = 1'b1;
                    w_2_plruSRAM_in_7[1] = w_plruSRAM_out_7[1];
                    w_2_plruSRAM_in_7[0] = 1'b0;
                    end
                    3'b101: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way5_19; 
                    
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = 1'b0;
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = 1'b1;
                    w_2_plruSRAM_in_7[1] = w_plruSRAM_out_7[1];
                    w_2_plruSRAM_in_7[0] = 1'b0;
                    end
                    3'b110: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way6_19;   
                    
                    w_2_plruSRAM_in_7[6] = 1'b1;
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = 1'b0;
                    w_2_plruSRAM_in_7[1] = w_plruSRAM_out_7[1];
                    w_2_plruSRAM_in_7[0] = 1'b0;
                    end
                    default: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way7_19; 
                    
                    w_2_plruSRAM_in_7[6] = 1'b0;
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = 1'b0;
                    w_2_plruSRAM_in_7[1] = w_plruSRAM_out_7[1];
                    w_2_plruSRAM_in_7[0] = 1'b0;
                    end
                    // default: begin
                    // w_writeBack_tag_19 = w_writeBack_tag_19;
                    // w_2_plruSRAM_in_7 = w_plruSRAM_out_7;
                    // end
                endcase
            end
            else if ((~r_hit) & r_need_writeBack) begin 
                w_2_read_or_write_plruSRAM = 1'b0;
                case (r_evict_way_3)
                    3'b000: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way0_19;  
                    
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = 1'b1;
                    w_2_plruSRAM_in_7[2] = w_plruSRAM_out_7[2];
                    w_2_plruSRAM_in_7[1] = 1'b1;
                    w_2_plruSRAM_in_7[0] = 1'b1;
                    end
                    3'b001: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way1_19; 
                    
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = 1'b0;
                    w_2_plruSRAM_in_7[2] = w_plruSRAM_out_7[2];
                    w_2_plruSRAM_in_7[1] = 1'b1;
                    w_2_plruSRAM_in_7[0] = 1'b1;
                    end
                    3'b010: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way2_19; 
                    
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = 1'b1;
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = w_plruSRAM_out_7[2];
                    w_2_plruSRAM_in_7[1] = 1'b0;
                    w_2_plruSRAM_in_7[0] = 1'b1;
                    end
                   
                    3'b011: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way3_19; 
                    
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = 1'b0;
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = w_plruSRAM_out_7[2];
                    w_2_plruSRAM_in_7[1] = 1'b0;
                    w_2_plruSRAM_in_7[0] = 1'b1;
                    end
                    
                    3'b100: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way4_19; 
                    
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = 1'b1;
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = 1'b1;
                    w_2_plruSRAM_in_7[1] = w_plruSRAM_out_7[1];
                    w_2_plruSRAM_in_7[0] = 1'b0;
                    end
                    3'b101: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way5_19; 
                    
                    w_2_plruSRAM_in_7[6] = w_plruSRAM_out_7[6];
                    w_2_plruSRAM_in_7[5] = 1'b0;
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = 1'b1;
                    w_2_plruSRAM_in_7[1] = w_plruSRAM_out_7[1];
                    w_2_plruSRAM_in_7[0] = 1'b0;
                    end
                    3'b110: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way6_19;   
                    
                    w_2_plruSRAM_in_7[6] = 1'b1;
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = 1'b0;
                    w_2_plruSRAM_in_7[1] = w_plruSRAM_out_7[1];
                    w_2_plruSRAM_in_7[0] = 1'b0;
                    end
                    default: begin
                    w_writeBack_tag_19 = w_tagSRAM_out_way7_19; 
                    
                    w_2_plruSRAM_in_7[6] = 1'b0;
                    w_2_plruSRAM_in_7[5] = w_plruSRAM_out_7[5];
                    w_2_plruSRAM_in_7[4] = w_plruSRAM_out_7[4];
                    w_2_plruSRAM_in_7[3] = w_plruSRAM_out_7[3];
                    w_2_plruSRAM_in_7[2] = 1'b0;
                    w_2_plruSRAM_in_7[1] = w_plruSRAM_out_7[1];
                    w_2_plruSRAM_in_7[0] = 1'b0;
                    end
                    // default: begin
                    // w_writeBack_tag_19 = w_writeBack_tag_19;
                    // w_2_plruSRAM_in_7 = w_plruSRAM_out_7;
                    // end
                endcase
            end
            else begin 
                w_2_read_or_write_plruSRAM = 1'b0;
                w_2_plruSRAM_in_7 = 7'b0;
                w_writeBack_tag_19 = 19'b0;
            end
        end
        else begin 
            w_2_read_or_write_plruSRAM = 1'b0;
            w_2_plruSRAM_in_7 = 7'b0;
            w_2_plruSRAM_addr_7 = r_physical_Addr_34[14:8];
            w_writeBack_tag_19 = 19'b0; 

        end
    end
    
    wire w_2_cfifo1_delayDrive_selector1;
    assign w_1_cfifo1_delayDrive_selector1 = w_cfifo1_drive_selector1;
    
    (*dont_touch = "true"*)delay8U driveDelay1(
        .inR(w_1_cfifo1_delayDrive_selector1), 
        .outR(w_2_cfifo1_delayDrive_selector1), 
        .rstn(rstn)
    );


    always @(posedge w_selector1_fire or negedge rstn) begin
        if(rstn==0)begin
          r_hit_way_3 <= 3'b0;   r_hit <= 1'b0;
          r_empty_way_3 <= 3'b0; r_have_empty <= 1'b0;
          r_evict_way_3 <= 3'b0; r_need_writeBack <= 1'b0;
        end
        else begin
            if (r_case_number_4[0] | r_case_number_4[1]) begin 
                r_hit_way_3 <= w_hit_way_3;   r_hit <= w_hit;
                r_empty_way_3 <= w_empty_way_3; r_have_empty <= w_have_empty;
                r_evict_way_3 <= w_evict_way_3; r_need_writeBack <= w_need_writeBack;
            end
            else begin 
                r_hit_way_3 <= r_hit_way_3;   r_hit <= r_hit;
                r_empty_way_3 <= r_empty_way_3; r_have_empty <= r_have_empty;
                r_evict_way_3 <= r_evict_way_3; r_need_writeBack <= r_need_writeBack;
            end
        end
    end

    

    // ����selector1�ķ�֧ѡ��
    // always @(w_hit or w_need_writeBack or w_have_empty) begin 
    always @(posedge w_selector1_fire or negedge rstn) begin
         if (rstn == 0) begin 
            r_selector1_valid <= 1'b0;
        end
        else begin 
            // if (r_case_number_4[0] | r_case_number_4[1]) begin 
            //     if (w_have_empty) begin 
            //         r_selector1_valid <= 1'b1;
            //     end
            //     else if (w_hit) begin 
            //         r_selector1_valid <= 1'b0;
            //     end
            //     else begin 
            //         r_selector1_valid <= 1'b0;
            //     end
            // end
            // else begin 
            //     r_selector1_valid <= 1'b0;
            // end
            if (r_case_number_4[0] | r_case_number_4[1]) begin 
                if (w_hit) begin 
                    r_selector1_valid <= 1'b0;
                end
                else begin 
                    if (w_have_empty | (~w_need_writeBack)) begin 
                        r_selector1_valid <= 1'b1;
                    end
                    else begin 
                        r_selector1_valid <= 1'b0;
                    end
                end 
            end
            else begin 
                r_selector1_valid <= 1'b0;
            end
        end
    end

    // assign w_selector1_valid = ((r_case_number_4[0] | r_case_number_4[1]) & w_have_empty) ? 1 : 0;

    //always @(posedge w_selector1_fire or negedge rstn) begin
    always @(posedge w_selector1_fire or negedge rstn) begin
         if (rstn == 0) begin 
            r_2_plruSRAM_in_7 <= 7'b0;
        end
        else begin 
            r_2_plruSRAM_in_7 <= w_2_plruSRAM_in_7;
        end
    end

// selector1
    (*dont_touch = "true"*)cSelector2_cache selector1(
        .rstn            (rstn),
        .i_drive        (w_2_cfifo1_delayDrive_selector1), // w_cfifo1_drive_selector1
        .o_free         (w_cfifo1_free_selector1),

        .o_fire         (w_selector1_fire), // plruSRAM op���� r_refill_way_3 ���ƶ�dataSRAM�Ķ�д

        .valid0         (r_selector1_valid), // ȱʧ ��д��
        .valid1         (~r_selector1_valid),

        // .valid0         (w_selector1_valid), // ȱʧ ��д��
        // .valid1         (~w_selector1_valid),

        .o_driveNext0   (o_driveNext_DDR_miss), // o_driveNext_DDR_miss
        .o_driveNext1   (w_selector1_drive_cfifo2),

        .i_freeNext0    (i_freeNext_DDR_miss),
        .i_freeNext1    (w_selector1_free_cfifo2)
    );



    // (*dont_touch = "true"*)delay8U driveDelay3(
    //     .inR(w_1_driveNext_DDR_miss), 
    //     .outR(w_2_driveNext_DDR_miss), 
    //     .rstn(rstn)
    // );

    //assign o_driveNext_DDR_miss = w_2_driveNext_DDR_miss;





    // ���ƶ�dataSRAM�Ķ�д
    // �� selector2 ���з�֧ѡ��
    always @(posedge w_cfifo2_fire or negedge rstn) begin 
        if (rstn == 0) begin
            r_selector2_valid0 <= 1'b0;
            r_selector2_valid1 <= 1'b0;
            r_selector2_valid2 <= 1'b0;
            r_selector2_valid3 <= 1'b0;
        end
        else begin 
            r_selector2_valid0 <= 1'b0;
            r_selector2_valid1 <= 1'b0;
            r_selector2_valid2 <= 1'b0;
            r_selector2_valid3 <= 1'b0;

            if (r_case_number_4[0]) begin 
                if (r_hit) begin 
                    if (r_DCache_or_ICache_2[0]) begin  // ICache
                        r_selector2_valid1 <= 1'b1;
                    end
                    else begin  // DCache
                        r_selector2_valid0 <= 1'b1;
                    end  
                end
                else begin 
                    r_selector2_valid3 <= 1'b1;
                end
            end
            else if (r_case_number_4[1]) begin 
                if (r_hit) begin 
                    if (r_need_writeBack) begin 
                        r_selector2_valid3 <= 1'b1;
                    end
                    else begin 
                        r_selector2_valid2 <= 1'b1;
                    end
                end
                else begin 
                    r_selector2_valid3 <= 1'b1;
                end
            end
            else if (r_case_number_4[2]) begin 
                if (r_DCache_or_ICache_2[0]) begin  // ICache
                        r_selector2_valid1 <= 1'b1;
                    end
                else begin  // DCache
                    r_selector2_valid0 <= 1'b1;
                end 
            end
            else begin 
                r_selector2_valid2 <= 1'b1;
            end
        end
    end


    always @( *) begin 
        if (r_case_number_4[0]) begin 
            if (r_hit) begin 
                r_read_or_write_dataSRAM = 1'b0;
                r_dataSRAM_addr_10 = {r_physical_Addr_34[14:8], r_hit_way_3};
                //r_dataSRAM_in_32B <= 256'b0;
            end
            else begin 
                r_read_or_write_dataSRAM = 1'b0;
                r_dataSRAM_addr_10 = {r_physical_Addr_34[14:8], r_evict_way_3};
                //r_dataSRAM_in_32B <= 256'b0;
            end
            // else begin 
            //     r_read_or_write_dataSRAM <= 1'b0;
            //     r_dataSRAM_addr_10 <= 10'b0;
            //     //r_dataSRAM_in_32B <= 256'b0;
            // end
        end
        else if (r_case_number_4[1]) begin 
            if (r_hit) begin 
                // r_read_or_write_dataSRAM <= 1'b1;
                // r_dataSRAM_addr_10 <= {r_physical_Addr_34[14:8], r_hit_way_3};
                // //r_dataSRAM_in_32B <= r_refillLine_to_L2Cache_32B;

                if (r_need_writeBack) begin 
                    r_read_or_write_dataSRAM = 1'b0;
                    r_dataSRAM_addr_10 = {r_physical_Addr_34[14:8], r_hit_way_3};
                end
                else begin 
                    r_read_or_write_dataSRAM = 1'b1;
                    r_dataSRAM_addr_10 = {r_physical_Addr_34[14:8], r_hit_way_3};
                end
            end
            else begin 
                r_read_or_write_dataSRAM = 1'b0;
                r_dataSRAM_addr_10 = {r_physical_Addr_34[14:8], r_evict_way_3};
            end
            // else begin 
            //     r_read_or_write_dataSRAM <= 1'b0;
            //     r_dataSRAM_addr_10 <= 10'b0;
            //     //r_dataSRAM_in_32B <= 256'b0;
            // end
        end
        else if (r_case_number_4[2]) begin 
            r_read_or_write_dataSRAM = 1'b1;
            //r_dataSRAM_addr_10 <= {r_physical_Addr_34[14:8], r_refill_way_3};
            r_dataSRAM_addr_10 = w_tagSRAM_addr_10;
            //r_dataSRAM_in_32B <= r_refillLine_to_L2Cache_32B;
        end
        else if (r_case_number_4[3]) begin 
            r_read_or_write_dataSRAM = 1'b1;
            //r_dataSRAM_addr_10 <= {r_physical_Addr_34[14:8], r_refill_way_3};
            r_dataSRAM_addr_10 = w_tagSRAM_addr_10;

        end
        else begin 
            r_read_or_write_dataSRAM = 1'b0;
            //r_dataSRAM_addr_10 <= {r_physical_Addr_34[14:8], r_refill_way_3};
            r_dataSRAM_addr_10 = 10'b0;
        end
    end


    assign w_dataSRAM_in_32B = w_refillLine_to_L2Cache_32B;

    
    always @(posedge w_selector1_fire or negedge rstn) begin 
        if (rstn == 0) begin 
            r_OP_sel2 <= 1'b0;
        end
        else begin 
            r_OP_sel2 <= ~r_OP_sel2;
        end
    end


// cfifo2
    // read or write dataSRAM 
    (*dont_touch = "true"*)cFifo1 cfifo2(
        .rstn        (rstn),

        .i_drive    (w_selector1_drive_cfifo2),
        .o_free     (w_selector1_free_cfifo2),

        .o_driveNext(w_cfifo2_drive_selector2),
        .i_freeNext (w_cfifo2_free_selector2),

        .o_fire_1   (w_cfifo2_fire)
    );

    //init
    wire w_withInit_dataClk, w_withInit_dataWea;
    wire [9:0] w_withInit_dataAddr_10;
    wire [255:0] w_withInit_dataDina_256;
    
    assign w_withInit_dataClk = init_sign ? init_clk : w_cfifo2_fire;
    assign w_withInit_dataWea = init_sign ? init_wea : r_read_or_write_dataSRAM;
    assign w_withInit_dataAddr_10 = init_sign ? {init_PA_34[14:8], init_PA_34[17:15]} : r_dataSRAM_addr_10;
    assign w_withInit_dataDina_256 = init_sign ? init_datain_256 : w_dataSRAM_in_32B;

    // fire
    L2Cache_dataSRAM u_L2Cache_dataSRAM (
        .clka   (w_withInit_dataClk), 
        .ena    (1'b1),      
        .wea    (w_withInit_dataWea),     
        .addra  (w_withInit_dataAddr_10),  
        .dina   (w_withInit_dataDina_256),   
        .douta  ({w_dataSRAM_out_way7_32B, w_dataSRAM_out_way6_32B, w_dataSRAM_out_way5_32B, w_dataSRAM_out_way4_32B, w_dataSRAM_out_way3_32B, w_dataSRAM_out_way2_32B, w_dataSRAM_out_way1_32B, w_dataSRAM_out_way0_32B})
    );


    // ���ڲ���Ҫevict�� L1writeBack ��dv��Ϊ11
    // always @(posedge w_cfifo2_fire or negedge rstn) begin 
    always @(posedge w_cfifo2_fire or negedge rstn) begin
        if (rstn == 0) begin 
            r_read_or_write_dvSRAM <= 1'b0;
            r_dvSRAM_addr_10 <= 10'b0;
            r_dvSRAM_in_2 <= 2'b00;

        end
        else begin 

            if (r_case_number_4[1]) begin 
                if (r_hit) begin 
                    if (r_need_writeBack) begin 
                        r_read_or_write_dvSRAM <= 1'b0;
                        r_dvSRAM_addr_10 <= {i_writeBack_Addr_from_DCache_34[14:8], r_hit_way_3};
                        r_dvSRAM_in_2 <= 2'b00;
                    end
                    else begin 
                        r_read_or_write_dvSRAM <= 1'b1;
                        r_dvSRAM_addr_10 <= {i_writeBack_Addr_from_DCache_34[14:8], r_hit_way_3};
                        r_dvSRAM_in_2 <= 2'b11;
                    end
                end
                else begin 
                    r_read_or_write_dvSRAM <= 1'b0;
                    r_dvSRAM_addr_10 <= {i_writeBack_Addr_from_DCache_34[14:8], 3'b0};
                    r_dvSRAM_in_2 <= 2'b00;
                end
            end
            else if (r_case_number_4[0]) begin 
                r_read_or_write_dvSRAM <= 1'b0;
                r_dvSRAM_in_2 <= 2'b00;

                if (r_DCache_or_ICache_2[1]) begin 
                    r_dvSRAM_addr_10 <= {i_miss_Addr_from_DCache_34[14:8], 3'b0};
                end
                else begin 
                    r_dvSRAM_addr_10 <= {i_miss_Addr_from_ICache_34[14:8], 3'b0};
                end
            end
            else begin 
                r_read_or_write_dvSRAM <= 1'b0;
                r_dvSRAM_addr_10 <= 10'b0;
                r_dvSRAM_in_2 <= 2'b00;
            end
        end
    end

    
    // ����dataSRAM �����Ľ��
    //always @(posedge w_selector2_fire or negedge rstn) begin
    always @( *) begin
        if (r_case_number_4[0]) begin 
            if (r_hit) begin 
                case (r_hit_way_3) 
                    3'b000: begin 
                        w_result_data_32B = w_dataSRAM_out_way0_32B;
                    end
                    3'b001: begin 
                        w_result_data_32B = w_dataSRAM_out_way1_32B;
                    end
                    3'b010: begin 
                        w_result_data_32B = w_dataSRAM_out_way2_32B;
                    end
                    3'b011: begin 
                        w_result_data_32B = w_dataSRAM_out_way3_32B;
                    end
                    3'b100: begin 
                        w_result_data_32B = w_dataSRAM_out_way4_32B;
                    end
                    3'b101: begin 
                        w_result_data_32B = w_dataSRAM_out_way5_32B;
                    end
                    3'b110: begin 
                        w_result_data_32B = w_dataSRAM_out_way6_32B;
                    end
                    default: begin 
                        w_result_data_32B = w_dataSRAM_out_way7_32B;
                    end
                    // default: w_result_data_32B = 256'b0;
                endcase
            end
            else if (r_need_writeBack) begin 
                case (r_evict_way_3) 
                    3'b000: begin 
                        w_result_data_32B = w_dataSRAM_out_way0_32B;
                    end
                    3'b001: begin 
                        w_result_data_32B = w_dataSRAM_out_way1_32B;
                    end
                    3'b010: begin 
                        w_result_data_32B = w_dataSRAM_out_way2_32B;
                    end
                    3'b011: begin 
                        w_result_data_32B = w_dataSRAM_out_way3_32B;
                    end
                    3'b100: begin 
                        w_result_data_32B = w_dataSRAM_out_way4_32B;
                    end
                    3'b101: begin 
                        w_result_data_32B = w_dataSRAM_out_way5_32B;
                    end
                    3'b110: begin 
                        w_result_data_32B = w_dataSRAM_out_way6_32B;
                    end
                    default: begin 
                        w_result_data_32B = w_dataSRAM_out_way7_32B;
                    end
                    // default: w_result_data_32B = 256'b0;
                endcase
            end
            else begin 
                w_result_data_32B = 256'b0;
            end
        end
        else if (r_case_number_4[1]) begin 
            if (r_hit) begin 
                if (r_need_writeBack) begin 
                    case (r_hit_way_3) 
                        3'b000: begin 
                            w_result_data_32B = w_dataSRAM_out_way0_32B;
                        end
                        3'b001: begin 
                            w_result_data_32B = w_dataSRAM_out_way1_32B;
                        end
                        3'b010: begin 
                            w_result_data_32B = w_dataSRAM_out_way2_32B;
                        end
                        3'b011: begin 
                            w_result_data_32B = w_dataSRAM_out_way3_32B;
                        end
                        3'b100: begin 
                            w_result_data_32B = w_dataSRAM_out_way4_32B;
                        end
                        3'b101: begin 
                            w_result_data_32B = w_dataSRAM_out_way5_32B;
                        end
                        3'b110: begin 
                            w_result_data_32B = w_dataSRAM_out_way6_32B;
                        end
                        default: begin 
                            w_result_data_32B = w_dataSRAM_out_way7_32B;
                        end
                        //default: w_result_data_32B = 256'b0;
                    endcase
                end
                else begin 
                    w_result_data_32B = 256'b0;
                end
            end
            else begin 
                if (r_need_writeBack) begin 
                    case (r_evict_way_3) 
                        3'b000: begin 
                            w_result_data_32B = w_dataSRAM_out_way0_32B;
                        end
                        3'b001: begin 
                            w_result_data_32B = w_dataSRAM_out_way1_32B;
                        end
                        3'b010: begin 
                            w_result_data_32B = w_dataSRAM_out_way2_32B;
                        end
                        3'b011: begin 
                            w_result_data_32B = w_dataSRAM_out_way3_32B;
                        end
                        3'b100: begin 
                            w_result_data_32B = w_dataSRAM_out_way4_32B;
                        end
                        3'b101: begin 
                            w_result_data_32B = w_dataSRAM_out_way5_32B;
                        end
                        3'b110: begin 
                            w_result_data_32B = w_dataSRAM_out_way6_32B;
                        end
                        default: begin 
                            w_result_data_32B = w_dataSRAM_out_way7_32B;
                        end
                        //default: w_result_data_32B = 256'b0;
                    endcase
                end
                else begin 
                    w_result_data_32B = 256'b0;
                end
            end
        end
        else if (r_case_number_4[2]) begin 
            //w_result_data_32B = w_refillLine_to_L2Cache_32B;

            if (r_have_empty) begin 
                case (r_empty_way_3) 
                    3'b000: begin 
                        w_result_data_32B = w_dataSRAM_out_way0_32B;
                    end
                    3'b001: begin 
                        w_result_data_32B = w_dataSRAM_out_way1_32B;
                    end
                    3'b010: begin 
                        w_result_data_32B = w_dataSRAM_out_way2_32B;
                    end
                    3'b011: begin 
                        w_result_data_32B = w_dataSRAM_out_way3_32B;
                    end
                    3'b100: begin 
                        w_result_data_32B = w_dataSRAM_out_way4_32B;
                    end
                    3'b101: begin 
                        w_result_data_32B = w_dataSRAM_out_way5_32B;
                    end
                    3'b110: begin 
                        w_result_data_32B = w_dataSRAM_out_way6_32B;
                    end
                    default: begin 
                        w_result_data_32B = w_dataSRAM_out_way7_32B;
                    end
                    // default: w_result_data_32B = 256'b0;
                endcase
            end
            else begin 
                case (r_evict_way_3) 
                    3'b000: begin 
                        w_result_data_32B = w_dataSRAM_out_way0_32B;
                    end
                    3'b001: begin 
                        w_result_data_32B = w_dataSRAM_out_way1_32B;
                    end
                    3'b010: begin 
                        w_result_data_32B = w_dataSRAM_out_way2_32B;
                    end
                    3'b011: begin 
                        w_result_data_32B = w_dataSRAM_out_way3_32B;
                    end
                    3'b100: begin 
                        w_result_data_32B = w_dataSRAM_out_way4_32B;
                    end
                    3'b101: begin 
                        w_result_data_32B = w_dataSRAM_out_way5_32B;
                    end
                    3'b110: begin 
                        w_result_data_32B = w_dataSRAM_out_way6_32B;
                    end
                    default: begin 
                        w_result_data_32B = w_dataSRAM_out_way7_32B;
                    end
                    //default: w_result_data_32B = 256'b0;
                endcase
            end
            
        end
        else begin 
            w_result_data_32B = 256'b0;
        end
    end



    always @( *) begin 
        if (r_DCache_or_ICache_2[0]) begin  // ICache
            w_miss_addr_to_DDR_34 = i_miss_Addr_from_ICache_34;
        end
        else begin  // DCache
            w_miss_addr_to_DDR_34 = i_miss_Addr_from_DCache_34;
        end
    end

    // ����ģ�����������
    assign o_DCache_or_ICache_2 = r_DCache_or_ICache_2;
    assign o_refillLine_to_L1Cache_32B = w_result_data_32B;
    assign o_writeBackLine_to_DDR_32B = w_result_data_32B;
    assign o_miss_Addr_to_DDR_34 = w_miss_addr_to_DDR_34;
    assign o_writeBack_Addr_to_DDR_34 = w_writeBack_Addr_to_DDR_34;
    
    always @( *) begin 
        if (r_case_number_4[0]) begin 
            if (r_need_writeBack) begin 
                w_writeBack_Addr_to_DDR_34 = {w_writeBack_tag_19, r_physical_Addr_34[14:8], r_evict_way_3, 5'b0};
            end
            else begin 
                w_writeBack_Addr_to_DDR_34 = 34'b0;
            end
        end
        else if (r_case_number_4[1]) begin 
            if (r_hit) begin 
                if (r_need_writeBack) begin 
                    w_writeBack_Addr_to_DDR_34 = {w_writeBack_tag_19, r_physical_Addr_34[14:8], r_hit_way_3, 5'b0};
                end
                else begin 
                    w_writeBack_Addr_to_DDR_34 = 34'b0;
                end
            end
            else begin 
                w_writeBack_Addr_to_DDR_34 = {w_writeBack_tag_19, r_physical_Addr_34[14:8], r_evict_way_3, 5'b0};
            end
        end
        else begin 
            w_writeBack_Addr_to_DDR_34 = 34'b0;
        end
    end



    //assign w_1_cfifo2_delayDrive_selector2 = w_cfifo2_drive_selector2;

    // (*dont_touch = "true"*)delay8U driveDelay2(
    //     .inR(w_1_cfifo2_delayDrive_selector2), 
    //     .outR(w_2_cfifo2_delayDrive_selector2), 
    //     .rstn(rstn)
    // );

// selector2
    (*dont_touch = "true"*)cSelector4_cache selector2(
        .rstn            (rstn),
        .i_drive        (w_cfifo2_drive_selector2), //w_cfifo2_drive_selector2
        .o_free         (w_cfifo2_free_selector2),

        .o_fire         (w_selector2_fire),

        .valid0         (r_selector2_valid0), // Dcache
        .valid1         (r_selector2_valid1), // ICache
        .valid2         (r_selector2_valid2), // writeBack��� �ص�mutex1
        .valid3         (r_selector2_valid3), // DDR

        .o_driveNext0   (o_driveNext_DCache),
        .o_driveNext1   (o_driveNext_ICache),
        .o_driveNext2   (w_selector2_drive_mutex1),
        .o_driveNext3   (o_driveNext_DDR_writeBack),

        .i_freeNext0    (i_freeNext_DCache),
        .i_freeNext1    (i_freeNext_ICache),
        .i_freeNext2    (w_selector2_free_mutex1),
        .i_freeNext3    (i_freeNext_DDR_writeBack)
    );


endmodule
