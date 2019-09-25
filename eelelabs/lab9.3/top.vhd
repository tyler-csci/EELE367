library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity top is
	port (Clock_50	: in std_logic;
			Reset		: in std_logic;
			SW			: in std_logic_vector (3 downto 0);
	      LEDR		: out std_logic_vector (9 downto 0);
			HEX0  	: out std_logic_vector (6 downto 0);
			HEX1  	: out std_logic_vector (6 downto 0);
			HEX2  	: out std_logic_vector (6 downto 0);
			HEX3  	: out std_logic_vector (6 downto 0);
			HEX4  	: out std_logic_vector (6 downto 0);
			HEX5  	: out std_logic_vector (6 downto 0);
			GPIO_1	: out std_logic_vector (7 downto 0));
			
end entity;

architecture top_arch of top is

signal CNT : std_logic_vector(38 downto 15);
signal CNT_uns : unsigned(38 downto 15);
signal Clock_div	: std_logic;

--instantiate clock_div_2ton
component clock_div_2ton 
	port (Clock_In	: in std_logic;
			Reset		: in std_logic;
			Sel		: in std_logic_vector (1 downto 0);
			Clock_Out: out std_logic);		
end component;


--instantiate char_decoder
component char_decoder
   port (BIN_IN	: in std_logic_vector (3 downto 0);
		   HEX_OUT	: out std_logic_vector (6 downto 0));
end component;

begin

LEDR <= CNT(24 downto 15);
GPIO_1 <= CNT(22 downto 15);

	C0	: char_decoder port map (BIN_IN => CNT(18 downto 15), HEX_OUT => HEX0);
	C1	: char_decoder port map (BIN_IN => CNT(22 downto 19), HEX_OUT => HEX1);
	C2	: char_decoder port map (BIN_IN => CNT(26 downto 23), HEX_OUT => HEX2);
	C3	: char_decoder port map (BIN_IN => CNT(30 downto 27), HEX_OUT => HEX3);
	C4	: char_decoder port map (BIN_IN => CNT(34 downto 31), HEX_OUT => HEX4);
	C5	: char_decoder port map (BIN_IN => CNT(38 downto 35), HEX_OUT => HEX5);
	
   --24 bit counter process
	
	FU	: clock_div_2ton port map (Clock_In => Clock_50, Reset => Reset, Sel => SW (1 downto 0), Clock_Out => Clock_div);
	
	COUNTER : process (Clock_div, Reset)
	   begin
		  if(Reset = '0') then 
				CNT_uns <= "000000000000000000000000";
		  elsif(rising_edge(Clock_div)) then 
				CNT_uns <= CNT_uns + 1;
		  end if;
	
	end process;
	
CNT <= std_logic_vector(CNT_uns);

end architecture;

	