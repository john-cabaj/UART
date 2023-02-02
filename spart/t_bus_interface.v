module t_bus_interface();
  
  wire [7:0] trans_buff, DATABUS;
  reg [7:0] rec_buff;
  reg [1:0] IOADDR;
  reg RDA, TBR, IOCS, IORW, rec_buff_rdy;
  
  assign DATABUS = IORW ? 8'bz : 8'b1110_1111;
  bus_interface bus_int(.trans_buff(trans_buff), .DATABUS(DATABUS), .IOADDR(IOADDR), .rec_buff(rec_buff), .RDA(RDA), .TBR(TBR), .IOCS(IOCS), .IORW(IORW), .rec_buff_rdy(rec_buff_rdy));
  
  
  initial begin
    rec_buff = 8'b1011_1110;
    RDA = 1'b1;
    TBR = 1'b1;
    IOADDR = 2'b01;
    IOCS = 1'b1;
    IORW = 1'b1;
    #1
    $display("time=%t, databus=%b, trans_buff=%b", $time, DATABUS, trans_buff);
    #5
    IOADDR = 2'b00;
    IOCS = 1'b1;
    IORW = 1'b1;
    #1
    $display("time=%t, databus=%b, trans_buff=%b", $time, DATABUS, trans_buff);
    #5
    IOADDR = 2'b00;
    IOCS = 1'b1;
    IORW = 1'b0;
    #1
    $display("time=%t, databus=%b, trans_buff=%b", $time, DATABUS, trans_buff);
  end
  
endmodule

