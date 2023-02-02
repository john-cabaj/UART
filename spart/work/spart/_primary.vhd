library verilog;
use verilog.vl_types.all;
entity spart is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        iocs            : in     vl_logic;
        iorw            : in     vl_logic;
        rda             : out    vl_logic;
        tbr             : out    vl_logic;
        ioaddr          : in     vl_logic_vector(1 downto 0);
        databus         : inout  vl_logic_vector(7 downto 0);
        txd             : out    vl_logic;
        rxd             : in     vl_logic;
        r_buff          : out    vl_logic_vector(7 downto 0)
    );
end spart;
