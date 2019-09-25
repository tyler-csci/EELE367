library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity top is
	port (SW			: in std_logic_vector (7 downto 0);
	      LEDR		: out std_logic_vector (9 downto 0);
			HEX0  	: out std_logic_vector (6 downto 0);
			HEX1  	: out std_logic_vector (6 downto 0);
			HEX2  	: out std_logic_vector (6 downto 0);
			HEX3  	: out std_logic_vector (6 downto 0);
			HEX4  	: out std_logic_vector (6 downto 0);
			HEX5  	: out std_logic_vector (6 downto 0));

end entity;

architecture top_arch of top is

--char_decoder
component twos_comp_decoder is 
port (TWOS_COMP_IN	: in std_logic_vector(3 downto 0);
		MAG_OUT			: out std_logic_vector(6 downto 0);
		SIGN_OUT			: out std_logic_vector(6 downto 0));
end component;

signal A, B : signed(3 downto 0);
signal sum : signed(4 downto 0);
signal total : std_logic_vector(3 downto 0);
signal V		: std_logic;
signal carry : std_logic_vector(0 downto 0);

begin

LEDR(7 downto 0) <= SW(7 downto 0);
LEDR(9) <= V;

total <= std_logic_vector(sum(3 downto 0));
carry <= std_logic_vector(sum(4 downto 4));


sum <= signed('0' & SW(3 downto 0)) + signed('0' & SW(7 downto 4));


	C0	: twos_comp_decoder port map (SW(3 downto 0), HEX0, HEX1); 
	C1	: twos_comp_decoder port map (SW(7 downto 4), HEX2,  HEX3); 
	C2	: twos_comp_decoder port map (total, HEX4,  HEX5); 
	--C3	: char_decoder port map (BIN_IN => "1111", HEX_OUT => HEX3); --"1111111"
	--C4	: char_decoder port map (BIN_IN => total(3 downto 0), HEX_OUT => HEX4); 
	--C5	: char_decoder port map (BIN_IN => "000" & carry(0 downto 0), HEX_OUT => HEX5);
	
--process for overflow 
	--if/then or case statement 
	--A(3), B(3), sum(3)
	process (SW(3), SW(7), sum(3))
	begin 
		--positive + positive = negative, NO GOOD
		if (SW(3) = '0' and SW(3) = '0' and sum(3) = '1') then 
			V <= '1';
		--neg+neg = pos, NO GOOD 
		elsif (SW(3) = '1' and SW(3) = '1' and sum(3) = '0') then 
			V <= '1';
		else 
			V <= '0';
		end if;
	end process;

end architecture;

	