library verilog;
use verilog.vl_types.all;
entity receiver is
    port(
        rec_buff        : out    vl_logic_vector(7 downto 0);
        RDA             : out    vl_logic;
        IOADDR          : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        RxD             : in     vl_logic;
        IOCS            : in     vl_logic;
        IORW            : in     vl_logic;
        rxEnable        : in     vl_logic;
        txEnable        : in     vl_logic
    );
end receiver;
