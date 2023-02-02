library verilog;
use verilog.vl_types.all;
entity four_one_Mux is
    port(
        A               : in     vl_logic_vector(15 downto 0);
        B               : in     vl_logic_vector(15 downto 0);
        C               : in     vl_logic_vector(15 downto 0);
        D               : in     vl_logic_vector(15 downto 0);
        S               : in     vl_logic_vector(1 downto 0);
        \Out\           : out    vl_logic_vector(15 downto 0)
    );
end four_one_Mux;
