module L2Cache_tag_compare(
    input [18:0] toCompare_tag_19,  // PA[33:15]
    input [18:0] L2Cache_tagSRAM_out_way7_19, L2Cache_tagSRAM_out_way6_19, L2Cache_tagSRAM_out_way5_19, L2Cache_tagSRAM_out_way4_19,
    input [18:0] L2Cache_tagSRAM_out_way3_19, L2Cache_tagSRAM_out_way2_19, L2Cache_tagSRAM_out_way1_19, L2Cache_tagSRAM_out_way0_19,
    
    input [1:0] L2Cache_dvSRAM_out_way7_2, L2Cache_dvSRAM_out_way6_2, L2Cache_dvSRAM_out_way5_2, L2Cache_dvSRAM_out_way4_2,
    input [1:0] L2Cache_dvSRAM_out_way3_2, L2Cache_dvSRAM_out_way2_2, L2Cache_dvSRAM_out_way1_2, L2Cache_dvSRAM_out_way0_2,

    input [6:0] L2Cache_plruSRAM_out_7,

    output hit,
    output reg need_writeBack,
    output have_empty,
    //output reg have_empty,
    output reg [2:0] empty_way_3,
    output reg [2:0] hit_way_3,
    output reg [2:0] evict_way_3
); 

    wire [7:0] way_hit_8;

    assign way_hit_8[0] = (((toCompare_tag_19 - L2Cache_tagSRAM_out_way0_19) == 19'b0) && L2Cache_dvSRAM_out_way0_2[0]) ? 1 : 0;
    assign way_hit_8[1] = (((toCompare_tag_19 - L2Cache_tagSRAM_out_way1_19) == 19'b0) && L2Cache_dvSRAM_out_way1_2[0]) ? 1 : 0;
    assign way_hit_8[2] = (((toCompare_tag_19 - L2Cache_tagSRAM_out_way2_19) == 19'b0) && L2Cache_dvSRAM_out_way2_2[0]) ? 1 : 0;
    assign way_hit_8[3] = (((toCompare_tag_19 - L2Cache_tagSRAM_out_way3_19) == 19'b0) && L2Cache_dvSRAM_out_way3_2[0]) ? 1 : 0;
    assign way_hit_8[4] = (((toCompare_tag_19 - L2Cache_tagSRAM_out_way4_19) == 19'b0) && L2Cache_dvSRAM_out_way4_2[0]) ? 1 : 0;
    assign way_hit_8[5] = (((toCompare_tag_19 - L2Cache_tagSRAM_out_way5_19) == 19'b0) && L2Cache_dvSRAM_out_way5_2[0]) ? 1 : 0;
    assign way_hit_8[6] = (((toCompare_tag_19 - L2Cache_tagSRAM_out_way6_19) == 19'b0) && L2Cache_dvSRAM_out_way6_2[0]) ? 1 : 0;
    assign way_hit_8[7] = (((toCompare_tag_19 - L2Cache_tagSRAM_out_way7_19) == 19'b0) && L2Cache_dvSRAM_out_way7_2[0]) ? 1 : 0;

    assign hit = way_hit_8[0] | way_hit_8[1] | way_hit_8[2] | way_hit_8[3] | way_hit_8[4] | way_hit_8[5] | way_hit_8[6] | way_hit_8[7];
    //assign need_writeBack = ((~hit) & (L2Cache_dvSRAM_out_way7_v & L2Cache_dvSRAM_out_way6_v & L2Cache_dvSRAM_out_way5_v & L2Cache_dvSRAM_out_way4_v & L2Cache_dvSRAM_out_way3_v & L2Cache_dvSRAM_out_way2_v & L2Cache_dvSRAM_out_way1_v & L2Cache_dvSRAM_out_way0_v));
    assign have_empty = ~(L2Cache_dvSRAM_out_way7_2[0] & L2Cache_dvSRAM_out_way6_2[0] & L2Cache_dvSRAM_out_way5_2[0] & L2Cache_dvSRAM_out_way4_2[0] & L2Cache_dvSRAM_out_way3_2[0] & L2Cache_dvSRAM_out_way2_2[0] & L2Cache_dvSRAM_out_way1_2[0] & L2Cache_dvSRAM_out_way0_2[0]);



    always @( *) begin 
        if (hit == 1'b1) begin 
            case (way_hit_8)
                8'b00000001: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way0_2[1];
                end
                8'b00000010: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way1_2[1];
                end
                8'b00000100: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way2_2[1];
                end
                8'b00001000: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way3_2[1];
                end
                8'b00010000: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way4_2[1];
                end
                8'b00100000: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way5_2[1];
                end
                8'b01000000: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way6_2[1];
                end
                8'b10000000: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way7_2[1];
                end
                default: need_writeBack = 1'b0;
            endcase
        end
        else if (~have_empty) begin 
            case (evict_way_3)
                3'b000: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way0_2[1];
                end
                3'b001: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way1_2[1];
                end
                3'b010: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way2_2[1];
                end
                3'b011: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way3_2[1];
                end
                3'b100: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way4_2[1];
                end
                3'b101: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way5_2[1];
                end
                3'b110: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way6_2[1];
                end
                3'b111: begin 
                    need_writeBack = L2Cache_dvSRAM_out_way7_2[1];
                end
                default: need_writeBack = 1'b0;
            endcase
        end
        else begin 
            need_writeBack = 1'b0;
        end
    end

    
    always @( *) begin 
        // if (hit == 1'b1) begin 
            case (way_hit_8)
                8'b00000001: begin 
                    hit_way_3 = 3'b000;
                end
                8'b00000010: begin 
                    hit_way_3 = 3'b001;
                end
                8'b00000100: begin 
                    hit_way_3 = 3'b010;
                end
                8'b00001000: begin 
                    hit_way_3 = 3'b011;
                end
                8'b00010000: begin 
                    hit_way_3 = 3'b100;
                end
                8'b00100000: begin 
                    hit_way_3 = 3'b101;
                end
                8'b01000000: begin 
                    hit_way_3 = 3'b110;
                end
                8'b10000000: begin 
                    hit_way_3 = 3'b111;
                end
                default: hit_way_3 = 3'b000;
            endcase
        // end
        // else begin 
        //     hit_way_3 = 3'b000;
        // end
    end



    always @( *) begin 
        // if (have_empty) begin 
            case ({L2Cache_dvSRAM_out_way0_2[0], L2Cache_dvSRAM_out_way1_2[0], L2Cache_dvSRAM_out_way2_2[0], L2Cache_dvSRAM_out_way3_2[0], L2Cache_dvSRAM_out_way4_2[0], L2Cache_dvSRAM_out_way5_2[0], L2Cache_dvSRAM_out_way6_2[0], L2Cache_dvSRAM_out_way7_2[0]})
                8'b00000000: begin 
                    empty_way_3 = 3'b000;
                end
                8'b10000000: begin 
                    empty_way_3 = 3'b001;
                end
                8'b11000000: begin 
                    empty_way_3 = 3'b010;
                end
                8'b11100000: begin 
                    empty_way_3 = 3'b011;
                end
                8'b11110000: begin 
                    empty_way_3 = 3'b100;
                end
                8'b11111000: begin 
                    empty_way_3 = 3'b101;
                end
                8'b11111100: begin 
                    empty_way_3 = 3'b110;
                end
                8'b11111110: begin 
                    empty_way_3 = 3'b111;
                end
                default: empty_way_3 = 3'b000;
            endcase
        // end
        // else begin 
        //     empty_way_3 = 3'b000;
        // end
    end


    always @( *) begin
        // if (need_writeBack) begin 
            casez (L2Cache_plruSRAM_out_7[6:0])
                7'b???0?00: evict_way_3 = 3'b000;
                7'b???1?00: evict_way_3 = 3'b001;
                7'b??0??10: evict_way_3 = 3'b010;
                7'b??1??10: evict_way_3 = 3'b011;
                7'b?0??0?1: evict_way_3 = 3'b100;
                7'b?1??0?1: evict_way_3 = 3'b101;
                7'b0???1?1: evict_way_3 = 3'b110;
                7'b1???1?1: evict_way_3 = 3'b111;
                default: evict_way_3 = 3'b0;
            endcase
        // end
        // else begin 
        //     evict_way_3 = 3'b0;
        // end
    end


endmodule