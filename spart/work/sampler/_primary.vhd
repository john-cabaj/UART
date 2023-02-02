library verilog;
use verilog.vl_types.all;
entity sampler is
    port(
        start           : out    vl_logic;
        enable          : out    vl_logic;
        RxD             : in     vl_logic;
        rxEnable        : in     vl_logic;
        txEnable        : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end sampler;
