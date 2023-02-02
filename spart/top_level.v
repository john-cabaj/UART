`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 	UW-Madison, ECE 554
// Engineer: 	John Cabaj, Nate Williams, Paul McBride
// 
// Create Date:   September 15, 2013
// Design Name: 	SPART
// Module Name:    top_level 
// Project Name: 		Mini-Project 1 - SPART
// Target Devices: 	Xilinx Vertex II FPGA
// Tool versions: 
// Description: 		Implements a serial Special Purpose Asynchronous Receiver/Transmitter and driver
//
// Dependencies: 
//
// Revision: 			1.0
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top_level(
    input clk,         // 100mhz clock
    input rst,         // Asynchronous reset, tied to dip switch 0
    output txd,        // RS232 Transmit Data
	 output LED_0,		
	 output LED_1,		  // intantiating LEDS
	 output LED_2,			
	 output LED_3,
    input rxd,         // RS232 Recieve Data
    input [1:0] br_cfg // Baud Rate Configuration, Tied to dip switches 2 and 3
    );
	
	//signals to be routed to modules
	wire iocs;
	wire iorw;
	wire rda;
	wire tbr;
	wire [1:0] ioaddr;
	wire [7:0] databus;
	
	//output signals to the LEDs
	assign LED_0 = ~txd;
	assign LED_1 = ~rxd;
	assign LED_2 = ~iorw;
	assign LED_3 = ~iocs;
	
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
					  .rxd(rxd)
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
						 .databus(databus)
					 );
					 
endmodule
