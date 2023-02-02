library verilog;
use verilog.vl_types.all;
entity transmitter is
    port(
        TxD             : out    vl_logic;
        TBR             : out    vl_logic;
        trans_buff      : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        BRGEN           : in     vl_logic;
        trans_load      : in     vl_logic
    );
end transmitter;
