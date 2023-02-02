`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:   
// Design Name: 
// Module Name:    top_level 
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
module top_level_full(
    input clk,         // 100mhz clock
    input clk1,
    input rst,         
    input rst1,        // Asynchronous reset, tied to dip switch 0
    output txd,        
    output txd1,       // RS232 Transmit Data
	 output LED_0,
	 output LED_1,
	 output LED_2,
	 output LED_3,
    input rxd,         
    input rxd1,        // RS232 Recieve Data
    input [1:0] br_cfg // Baud Rate Configuration, Tied to dip switches 2 and 3
    );
	
	wire iocs;
	wire iocs1;
	wire iorw;
	wire iorw1;
	wire rda;
	wire rda1;
	wire tbr;
	wire tbr1;
	wire [1:0] ioaddr;
	wire [1:0] ioaddr1;
	wire [7:0] databus, r_buff;
	wire [7:0] databus1, r_buff1;
	//wire [2:0] state;
	
	assign LED_0 = ~r_buff[0];
	assign LED_1 = ~r_buff[1];
	assign LED_2 = ~r_buff[2];
	assign LED_3 = ~r_buff[3];
	
	// Instantiate your SPART here
	spart spart0( .clk(clk),
                 .rst(rst),
					  .iocs(iocs),
					  .iorw(iorw),
					  .rda(rda),
					  .tbr(tbr),
					  .ioaddr(ioaddr),
					  .databus(databus),
					  .txd(txd),
					  .rxd(txd1),
					  .r_buff(r_buff)
					);
					
	spart spart1( .clk(clk1),
                 .rst(rst1),
					  .iocs(iocs1),
					  .iorw(iorw1),
					  .rda(rda1),
					  .tbr(tbr1),
					  .ioaddr(ioaddr1),
					  .databus(databus1),
					  .txd(txd1),
					  .rxd(txd),
					  .r_buff(r_buff1)
					);

	// Instantiate your driver here
	driver driver0( .clk(clk),
	                .rst(rst),
						 .br_cfg(br_cfg),
						 .iocs(iocs),
						 .iorw(iorw),
						 .rda(rda),
						 .tbr(tbr),
						 .ioaddr(ioaddr),
						 .databus(databus),
						 .state_value(state)
					 );
					 
	// Instantiate your driver here
	driver_out drivertrans( .clk(clk1),
	                .rst(rst1),
						 .br_cfg(br_cfg),
						 .iocs(iocs1),
						 .iorw(iorw1),
						 .rda(rda1),
						 .tbr(tbr1),
						 .ioaddr(ioaddr1),
						 .databus(databus1),
						 .state_value(state1)
					 );
					 
endmodule


