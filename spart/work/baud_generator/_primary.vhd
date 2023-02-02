library verilog;
use verilog.vl_types.all;
entity baud_generator is
    port(
        baud_gen        : in     vl_logic_vector(7 downto 0);
        baud_load       : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        IOADDR          : in     vl_logic_vector(1 downto 0);
        txEnable        : out    vl_logic;
        rxEnable        : out    vl_logic
    );
end baud_generator;
