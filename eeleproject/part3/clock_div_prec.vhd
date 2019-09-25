library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_div_prec is 
	port (Clock_in	: in std_logic;
			Reset		: in std_logic;
			Sel		: in std_logic_vector (1 downto 0);
			Clock_out: out std_logic);
end entity;
			
architecture clock_div_prec_arch of clock_div_prec is
	signal max			: integer;
	signal CNT_int	 	: integer;
	signal CLK_int		: std_logic;

	begin 
		MAX_SELECT : process (Sel)
		begin
			if (Sel = "00") then 
				max <= 25000000;
			elsif (Sel = "01") then 
				max <= 2500000;
			elsif (Sel = "10") then 
				max <= 250000;
			elsif (Sel = "11") then 
				max <= 25000;
			end if;
		end process;
		
		COUNTER : process (Clock_in, Reset)
		  begin
		if (Reset = '0') then 
			CNT_int <= 0;
		elsif (rising_edge(Clock_in)) then 
			
			if (CNT_int >= max) then 
				CNT_int <= 0;
				if(CLK_int = '1') then 
					CLK_int <= '0';
				else
					CLK_int <= '1';
				end if;
			else
				CNT_int <= CNT_int + 1;
			end if;
		  
		end if;
   end process;
	Clock_out <= CLK_int;
end architecture;