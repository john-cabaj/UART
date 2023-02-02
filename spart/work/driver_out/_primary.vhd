library verilog;
use verilog.vl_types.all;
entity driver_out is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        br_cfg          : in     vl_logic_vector(1 downto 0);
        iocs            : out    vl_logic;
        iorw            : out    vl_logic;
        rda             : in     vl_logic;
        tbr             : in     vl_logic;
        ioaddr          : out    vl_logic_vector(1 downto 0);
        databus         : inout  vl_logic_vector(7 downto 0);
        state_value     : out    vl_logic_vector(2 downto 0)
    );
end driver_out;
