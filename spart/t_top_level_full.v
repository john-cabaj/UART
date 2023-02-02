module t_top_level_full();
    
wire txd, txd1;    
reg [1:0] br_cfg;    
reg clk, clk1, rst, rst1, rxd, rxd1; 
    
top_level_full t(.clk(clk), .clk1(clk1), .rst(rst), .rst1(rst1), .txd(txd), .txd1(txd1), .rxd(rxd), .rxd1(rxd1), .br_cfg(br_cfg));    

initial begin
   rst = 1'b1;
   clk = 1'b0;
   forever begin
      #5 clk = ~clk;
   end
end

initial begin
   rst1 = 1'b1;
   #2
   clk1 = 1'b0;
   forever begin
      #5 clk1 = ~clk1; 
   end
end

initial begin
   #1
   rst = 1'b0;
   rst1 = 1'b0;
   br_cfg = 2'b01;
end

endmodule

