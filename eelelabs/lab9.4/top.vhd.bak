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
signal BCD0_int	: integer range 0 to 9;
signal BCD1_int	: integer range 0 to 9;
signal BCD2_int	: integer range 0 to 9;
signal BCD3_int	: integer range 0 to 9;
signal BCD4_int	: integer range 0 to 9;
signal BCD5_int	: integer range 0 to 9;
signal BCD0	: std_logic_vector (3 downto 0);
signal BCD1	: std_logic_vector (3 downto 0);
signal BCD2	: std_logic_vector (3 downto 0);
signal BCD3	: std_logic_vector (3 downto 0);
signal BCD4	: std_logic_vector (3 downto 0);
signal BCD5	: std_logic_vector (3 downto 0);


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

component clock_div_prec  
	port (Clock_in	: in std_logic;
			Reset		: in std_logic;
			Sel		: in std_logic_vector (1 downto 0);
			Clock_out: out std_logic);
end component;

begin

LEDR(0) <= Clock_div;
GPIO_1(0) <= Clock_div;

	C0	: char_decoder port map (BIN_IN => BCD0, HEX_OUT => HEX0);
	C1	: char_decoder port map (BIN_IN => BCD1, HEX_OUT => HEX1);
	C2	: char_decoder port map (BIN_IN => BCD2, HEX_OUT => HEX2);
	C3	: char_decoder port map (BIN_IN => BCD3, HEX_OUT => HEX3);
	C4	: char_decoder port map (BIN_IN => BCD4, HEX_OUT => HEX4);
	C5	: char_decoder port map (BIN_IN => BCD5, HEX_OUT => HEX5);
	
   --24 bit counter process
	
	FU	: clock_div_prec port map (Clock_In => Clock_50, Reset => Reset, Sel => SW (1 downto 0), Clock_Out => Clock_div);
	COUNTER : process (Clock_div, Reset)
	   begin
		  if(Reset = '0') then 
				CNT_uns <= "000000000000000000000000";
		  elsif(rising_edge(Clock_div)) then 
				CNT_uns <= CNT_uns + 1;
		  end if;
	
	end process;
	
CNT <= std_logic_vector(CNT_uns);

BCD0_PROC : process (Clock_div, Reset)
	begin 
		if (Reset = '0') then 
			BCD0_int <= 0;
		elsif (rising_edge(Clock_div)) then 
			if(BCD0_int = 9) then 
				BCD0_int <= 0;
			else
				BCD0_int <= BCD0_int + 1;
			end if;
		end if;
end process;
BCD0 <= std_logic_vector(to_unsigned(BCD0_int,4));
-----------------------------------------------------
BCD1_PROC : process (Clock_div, Reset)
	begin 
		if (Reset = '0') then 
			BCD1_int <= 0;
		elsif (rising_edge(Clock_div)) then 

			if((BCD1_int = 9) and (BCD0_int = 9))then 
				BCD1_int <= 0;
			elsif(BCD0_int = 9) then 
				BCD1_int <= BCD1_int + 1;
			end if;
		end if;
end process;
BCD1 <= std_logic_vector(to_unsigned(BCD1_int,4));
-----------------------------------------------------------------
BCD2_PROC : process (Clock_div, Reset)
	begin 
		if (Reset = '0') then 
			BCD2_int <= 0;
		elsif (rising_edge(Clock_div)) then 

			if((BCD2_int = 9) and (BCD1_int = 9) and (BCD0_int = 9))then 
				BCD2_int <= 0;
			elsif((BCD1_int = 9) and (BCD0_int = 9))then 
				BCD2_int <= BCD2_int + 1;
			end if;
		end if;
end process;

BCD2 <= std_logic_vector(to_unsigned(BCD2_int,4));

-----------------------------------------------------------------
BCD3_PROC : process (Clock_div, Reset)
	begin 
		if (Reset = '0') then 
			BCD3_int <= 0;
		elsif (rising_edge(Clock_div)) then 

			if((BCD3_int = 9) and (BCD2_int = 9) and (BCD1_int = 9) and (BCD0_int = 9))then 
				BCD3_int <= 0;
			elsif((BCD2_int = 9) and (BCD1_int = 9) and (BCD0_int = 9))then 
				BCD3_int <= BCD3_int + 1;
			end if;
		end if;
end process;

BCD3 <= std_logic_vector(to_unsigned(BCD3_int,4));

-----------------------------------------------------------------
BCD4_PROC : process (Clock_div, Reset)
	begin 
		if (Reset = '0') then 
			BCD4_int <= 0;
		elsif (rising_edge(Clock_div)) then 

			if((BCD4_int = 9) and (BCD3_int = 9) and (BCD2_int = 9) and (BCD1_int = 9) and (BCD0_int = 9))then 
				BCD4_int <= 0;
			elsif((BCD3_int = 9) and (BCD2_int = 9) and (BCD1_int = 9) and (BCD0_int = 9))then 
				BCD4_int <= BCD4_int + 1;
			end if;
		end if;
end process;

BCD4 <= std_logic_vector(to_unsigned(BCD4_int,4));


-----------------------------------------------------------------
BCD5_PROC : process (Clock_div, Reset)
	begin 
		if (Reset = '0') then 
			BCD5_int <= 0;
		elsif (rising_edge(Clock_div)) then 

			if((BCD5_int = 9) and (BCD4_int = 9) and (BCD3_int = 9) and (BCD2_int = 9) and (BCD1_int = 9) and (BCD0_int = 9))then 
				BCD5_int <= 0;
			elsif((BCD4_int = 9) and (BCD3_int = 9) and (BCD2_int = 9) and (BCD1_int = 9) and (BCD0_int = 9))then 
				BCD5_int <= BCD5_int + 1;
			end if;
		end if;
end process;

BCD5 <= std_logic_vector(to_unsigned(BCD5_int,4));

----------------------------------------------------------------------------------------------------------

end architecture;

	