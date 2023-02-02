module t_top_level();
        
    wire txd;    
    reg [1:0] br_cfg;    
    reg clk, rst, rxd;    
        
    top_level t(.clk(clk), .rst(rst), .txd(txd), .rxd(rxd), .br_cfg(br_cfg));
    
    initial begin
       rst = 1'b1;
       clk = 1'b0;
       forever #5 clk = ~clk;
    end
   
    initial begin
       #1
       rst = 1'b0;
       br_cfg = 2'b01;
       rxd = 1'b1;
       #97674
       rxd = 1'b0;
       #104160
       rxd = 1'b1;
       #104160
       rxd = 1'b0;
       #104160
       rxd = 1'b1; 
       #104160
       rxd = 1'b0; 
       #104160
       rxd = 1'b1; 
       #104160
       rxd = 1'b0;
       #104160
       rxd = 1'b1; 
       #104160
       rxd = 1'b0;
       #104160
       rxd = 1'b1; 
       
       #104160
       rxd = 1'b0;
       #104160
       rxd = 1'b1;
       #104160
       rxd = 1'b1;
       #104160
       rxd = 1'b1; 
       #104160
       rxd = 1'b1; 
       #104160
       rxd = 1'b0; 
       #104160
       rxd = 1'b0;
       #104160
       rxd = 1'b0; 
       #104160
       rxd = 1'b0;
       #104160
       rxd = 1'b1; 
    end
endmodule
