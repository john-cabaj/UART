library verilog;
use verilog.vl_types.all;
entity multiplexer is
    port(
        data            : out    vl_logic_vector(7 downto 0);
        rec_buff        : in     vl_logic_vector(7 downto 0);
        IOADDR          : in     vl_logic_vector(1 downto 0);
        RDA             : in     vl_logic;
        TBR             : in     vl_logic
    );
end multiplexer;
