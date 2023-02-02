module t_receiver();
    
    wire [7:0] rec_buff;
    wire RDA;
    reg [1:0] IOADDR;
    reg clk, rst, RxD, IOCS, IORW;
    
    receiver rx(.rec_buff(rec_buff), .RDA(RDA), .IOADDR(IOADDR), .clk(clk), .rst(rst), .RxD(RxD), .IOCS(IOCS), .IORW(IORW), .rxEnable(rxEnable), .txEnable(txEnable));
    
    reg [7:0] baud_gen;
    reg baud_load;
    reg [15:0] temp;

    baud_generator bg(.baud_gen(baud_gen), .baud_load(baud_load), .clk(clk), .rst(rst), .IOADDR(IOADDR), .txEnable(txEnable), .rxEnable(rxEnable));

    initial begin
       rst = 1'b1;
       clk = 1'b0;
       forever #5 clk = ~clk;
    end
   
    initial begin
       #1
       rst = 1'b0;
       baud_load = 1'b1;
       IOADDR = 2'b10;
       temp = 16'd650;
       baud_gen = temp[7:0];
       #10
       IOADDR = 2'b11;
       baud_gen = temp[15:8];
       #10
       baud_load = 1'b0;
       RxD = 1'b0;
       #99034
       RxD = 1'b1;
       #104160
       RxD = 1'b0;
       #104160
       RxD = 1'b1;
       #104160
       RxD = 1'b0;
       #104160
       RxD = 1'b1;
       #104160
       RxD = 1'b0;
       #104160
       RxD = 1'b1;
       #104160
       RxD = 1'b0;
    end
   
endmodule
