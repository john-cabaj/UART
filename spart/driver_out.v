`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    driver 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module driver_out(
    input clk,
    input rst,
    input [1:0] br_cfg,
    output reg iocs,
    output reg iorw,
    input rda,
    input tbr,
    output reg [1:0] ioaddr,
    inout [7:0] databus,
	 output [2:0] state_value
    );
   
    reg [7:0] temp_data;
    reg [7:0] write_data;
    reg [7:0] read_data;
    reg correct;
    reg [2:0] state, next_state;
    wire [15:0] baud_count;
    
    
    assign baud_count = (br_cfg == 2'b00) ? 16'd1301 : 
                        (br_cfg == 2'b01) ? 16'd650 : 
                        (br_cfg == 2'b10) ? 16'd325 : 16'd162;
    
    localparam LOAD_LOW = 3'd0, LOAD_HIGH = 3'd1, WAIT = 3'd2, READ = 3'd3, WRITE = 3'd4;
    
    assign databus = (!iorw) ? temp_data : 8'bzzzzzzzz;    
	 assign state_value = state;
	 
    always@(posedge clk, posedge rst) begin
       if(rst) begin
           state <= LOAD_LOW;
       end 
       else begin
           state <= next_state;
       end
    end
    
    always@(*) begin
        correct = 1'b0;
        case(state)
           LOAD_LOW: begin
              write_data = 8'b10101010;
              iocs = 1'b1;
              next_state = LOAD_HIGH;
              iorw = 1'b0;
              ioaddr = 2'b10;
              temp_data = baud_count[7:0];
           end    
           LOAD_HIGH: begin
              iocs = 1'b1;
              next_state = WRITE;
              iorw = 1'b0;
              ioaddr = 2'b11;
              temp_data = baud_count[15:8]; 
           end
           WAIT: begin
              iorw = 1'b1;
              ioaddr = 2'b11;
              if(rda) begin
                 iocs = 1'b1;
                 next_state = READ;
              end 
              else begin
                 iocs = 1'b1;
                 next_state = WAIT; 
              end
           end
           READ: begin
              temp_data = databus;
              read_data = temp_data;
              if(write_data == read_data) begin
                  correct = 1'b1;
                  write_data = write_data + 8'd1;
              end
              iorw = 1'b1; 
              ioaddr = 2'b00;
              iocs = 1'b1;
              if(tbr) begin
                 next_state = WRITE;
              end
              else begin
                  next_state = READ;
              end
           end
           WRITE: begin
               temp_data = write_data;
               iocs = 1'b1;
               iorw = 1'b0;
               ioaddr = 2'b00;
               next_state = WAIT; 
           end
       endcase
    end
endmodule


