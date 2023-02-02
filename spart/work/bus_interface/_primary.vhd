library verilog;
use verilog.vl_types.all;
entity bus_interface is
    port(
        trans_buff      : out    vl_logic_vector(7 downto 0);
        baud_gen        : out    vl_logic_vector(7 downto 0);
        trans_load      : out    vl_logic;
        baud_load       : out    vl_logic;
        RDA             : out    vl_logic;
        TBR             : out    vl_logic;
        DATABUS         : inout  vl_logic_vector(7 downto 0);
        rec_buff        : in     vl_logic_vector(7 downto 0);
        IOADDR          : in     vl_logic_vector(1 downto 0);
        rec_data_avail  : in     vl_logic;
        trans_buff_rdy  : in     vl_logic;
        IOCS            : in     vl_logic;
        IORW            : in     vl_logic
    );
end bus_interface;
