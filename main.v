`timescale 1ns / 1ps
`default_nettype none

module main	(
	input wire CLOCK_50,            //On Board 50 MHz
	input wire [9:0] SW,            // On board Switches
	input wire [3:0] KEY,           // On board push buttons
	output wire [6:0] HEX0,         // HEX displays
	output wire [6:0] HEX1,         
	output wire [6:0] HEX2,         
	output wire [6:0] HEX3,         
	output wire [6:0] HEX4,         
	output wire [6:0] HEX5,         
	output wire [9:0] LEDR,         // LEDs
	output wire [7:0] x,            // VGA pixel coordinates
	output wire [6:0] y,
	output wire [2:0] colour,       // VGA pixel colour (0-7)
	output wire plot,               // Pixel drawn when this is pulsed
	output wire vga_resetn          // VGA resets to black when this is pulsed (NOT CURRENTLY AVAILABLE)
);    

	//Write code in here!
	wire [7:0]ALUoutw;
	hex_decoder h1(.c(ALUoutw[3:0]),.display(HEX4));
	hex_decoder h2(.c(ALUoutw[7:4]),.display(HEX5));
	hex_decoder h3(.c(SW[7:4]),.display(HEX0));
	hex_decoder h4(.c(SW[3:0]),.display(HEX2));
	hex_decoder h5(.c(4'b1010),.display(HEX1));
	hex_decoder h6(.c(4'b1011),.display(HEX3));
	assign LEDR[0] = ALUoutw[0];
	assign LEDR[1] = ALUoutw[1];
	assign LEDR[2] = ALUoutw[2];
	assign LEDR[3] = ALUoutw[3];
	assign LEDR[4] = ALUoutw[4];
	assign LEDR[5] = ALUoutw[5];
	assign LEDR[6] = ALUoutw[6];
	assign LEDR[7] = ALUoutw[7];
	
	
	part3 u2(.A(SW[7:4]),.B(SW[3:0]),.Function(KEY[2:0]),.ALUout(ALUoutw[7:0]));
	
endmodule