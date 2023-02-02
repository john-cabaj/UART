library verilog;
use verilog.vl_types.all;
entity rx is
    port(
        rec_buff        : out    vl_logic_vector(7 downto 0);
        RDA             : out    vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        RxD             : in     vl_logic;
        rxEnable        : in     vl_logic;
        start           : in     vl_logic;
        read            : in     vl_logic;
        enable          : in     vl_logic
    );
end rx;
