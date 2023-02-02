`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 	UW-Madison ECE 554
// Engineer: 	John Cabaj, Nate Williams, Paul McBride
// 
// Create Date:    September 15, 2013
// Design Name: 	 SPART
// Module Name:    driver 
// Project Name: 		Mini-Project 1 - SPART
// Target Devices: 	Xilinx Vertex II FPGA
// Tool versions: 
// Description: 		Implements a driver to control SPART operation
//
// Dependencies: 
//
// Revision: 		1.0
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module driver(
    input clk,						// 100 MHz clock
    input rst,						// Asynchronous reset, tied to dip switch 0
    input [1:0] br_cfg,			// baud rate input
    output reg iocs,				// chip select
    output reg iorw,				// read/write
    input rda,						// received data available
    input tbr,						//	transmit buffer ready
    output reg [1:0] ioaddr,	// io addr
    inout [7:0] databus			// databus
    );
   
    reg [7:0] temp_data, data_read;		// outputs and inputs from databus
    reg [2:0] state, next_state;			// state and next state
    wire [15:0] baud_count;			   // value loaded into baud generator
    
	 // assign baud generator counter
    assign baud_count = (br_cfg == 2'b00) ? 16'd1301 : 
                        (br_cfg == 2'b01) ? 16'd650 : 
                        (br_cfg == 2'b10) ? 16'd325 : 16'd162;
    
	 // state variables
    localparam LOAD_LOW = 3'd0, LOAD_HIGH = 3'd1, WAIT = 3'd2, READ = 3'd3, WRITE = 3'd4;
    
	 // output to databus
    assign databus = (!iorw) ? temp_data : 8'bzzzzzzzz;    
	 
	 // sequential logic
    always@(posedge clk, posedge rst) begin
       if(rst) begin
           state <= LOAD_LOW;
           data_read <= 8'b00000000;
       end 
       else begin
           state <= next_state;			// proceed to next state
			  
			  // save data read from databus
           if(state == READ) begin
               data_read <= databus;
           end
       end
    end
    
	 // next state and combinational logic
	 // determine next state and output signals
    always@(*) begin
        temp_data = 8'bxxxxxxxx;
        case(state)
           LOAD_LOW: begin
              iocs = 1'b1;
              next_state = LOAD_HIGH;
              iorw = 1'b0;
              ioaddr = 2'b10;
              temp_data = baud_count[7:0];
           end    
           LOAD_HIGH: begin
              iocs = 1'b1;
              next_state = WAIT;
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
               iocs = 1'b1;
               iorw = 1'b0;
               ioaddr = 2'b00;
               next_state = WAIT;
					temp_data = data_read;
           end
			  default: begin
					iocs = 1'bx;
					iorw = 1'bx;
					ioaddr = 2'bxx;
					next_state = 3'bxxx;
			  end
       endcase
    end
endmodule
