module t_transmitter();
    
    wire TxD, TBR;
    reg [7:0] trans_buff;
    reg [1:0] IOADDR;
    reg clk, rst, IOCS, IORW, BRGEN, trans_load;
    
    transmitter tx(.TxD(TxD), .TBR(TBR), .trans_buff(trans_buff), .IOADDR(IOADDR), .clk(clk), .rst(rst), .IOCS(IOCS), .IORW(IORW), .BRGEN(BRGEN), .trans_load(trans_load));

   initial begin
    rst = 1'b1;
    clk = 1'b0;
    forever #5 clk = ~clk;
   end

   initial begin
    #1
    rst = 1'b0;
    trans_load = 1'b1;
    trans_buff = 8'b1010_1010;
    IOADDR = 2'bxx;
    IORW = 1'bx;
    BRGEN = 1'bx;
    #5
    trans_load = 1'b0;
    $display("time=%t TxD=%b", $time, TxD);
    #100
    $stop;
   end

endmodule
