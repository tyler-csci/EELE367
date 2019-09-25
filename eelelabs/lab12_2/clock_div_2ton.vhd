library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_div_2ton is
	port (Clock_In	: in std_logic;
			Reset		: in std_logic;
			Sel		: in std_logic_vector (1 downto 0);
			Clock_Out: out std_logic);
			
end entity;

architecture clock_div_2ton_arch of clock_div_2ton is

signal CNT : std_logic_vector(37 downto 0);
signal CNTn: std_logic_vector(37 downto 0);
signal Clock_div	: std_logic;


component dflipflop is
	port (Clock	: in std_logic;
			Reset	: in std_logic;
			D		: in std_logic;
			Q, Qn	: out std_logic);
			
end component;

begin


	DFF0	: dflipflop port map (Clock => Clock_In, Reset => Reset, D =>  CNTn(0), Q => CNT(0), Qn => CNTn(0));
	DFF1	: dflipflop port map (Clock => CNTn(0), Reset => Reset, D => CNTn(1), Q => CNT(1), Qn => CNTn(1));
	DFF2	: dflipflop port map (Clock => CNTn(1), Reset => Reset, D => CNTn(2), Q => CNT(2), Qn => CNTn(2));
	DFF3	: dflipflop port map (Clock => CNTn(2), Reset => Reset, D => CNTn(3), Q => CNT(3), Qn => CNTn(3));
	DFF4	: dflipflop port map (Clock => CNTn(3), Reset => Reset, D => CNTn(4), Q => CNT(4), Qn => CNTn(4));
	DFF5	: dflipflop port map (Clock => CNTn(4), Reset => Reset, D => CNTn(5), Q => CNT(5), Qn => CNTn(5));
	DFF6	: dflipflop port map (Clock => CNTn(5), Reset => Reset, D => CNTn(6), Q => CNT(6), Qn => CNTn(6));
	DFF7	: dflipflop port map (Clock => CNTn(6), Reset => Reset, D => CNTn(7), Q => CNT(7), Qn => CNTn(7));
	DFF8	: dflipflop port map (Clock => CNTn(7), Reset => Reset, D => CNTn(8), Q => CNT(8), Qn => CNTn(8));
	DFF9	: dflipflop port map (Clock => CNTn(8), Reset => Reset, D => CNTn(9), Q => CNT(9), Qn => CNTn(9));
	DFF10	: dflipflop port map (Clock => CNTn(9), Reset => Reset, D => CNTn(10), Q => CNT(10), Qn => CNTn(10));
	DFF11	: dflipflop port map (Clock => CNTn(10), Reset => Reset, D => CNTn(11), Q => CNT(11), Qn => CNTn(11));
	DFF12	: dflipflop port map (Clock => CNTn(11), Reset => Reset, D => CNTn(12), Q => CNT(12), Qn => CNTn(12));
	DFF13	: dflipflop port map (Clock => CNTn(12), Reset => Reset, D => CNTn(13), Q => CNT(13), Qn => CNTn(13));
	DFF14	: dflipflop port map (Clock => CNTn(13), Reset => Reset, D => CNTn(14), Q => CNT(14), Qn => CNTn(14));
	DFF15	: dflipflop port map (Clock => CNTn(14), Reset => Reset, D => CNTn(15), Q => CNT(15), Qn => CNTn(15));
	
	DFF16	: dflipflop port map (Clock => CNTn(15), Reset => Reset, D => CNTn(16), Q => CNT(16), Qn => CNTn(16));
	DFF17	: dflipflop port map (Clock => CNTn(16), Reset => Reset, D => CNTn(17), Q => CNT(17), Qn => CNTn(17));
	DFF18	: dflipflop port map (Clock => CNTn(17), Reset => Reset, D => CNTn(18), Q => CNT(18), Qn => CNTn(18));
	DFF19	: dflipflop port map (Clock => CNTn(18), Reset => Reset, D => CNTn(19), Q => CNT(19), Qn => CNTn(19));
	DFF20	: dflipflop port map (Clock => CNTn(19), Reset => Reset, D => CNTn(20), Q => CNT(20), Qn => CNTn(20));
	DFF21	: dflipflop port map (Clock => CNTn(20), Reset => Reset, D => CNTn(21), Q => CNT(21), Qn => CNTn(21));
	DFF22	: dflipflop port map (Clock => CNTn(21), Reset => Reset, D => CNTn(22), Q => CNT(22), Qn => CNTn(22));
	DFF23	: dflipflop port map (Clock => CNTn(22), Reset => Reset, D => CNTn(23), Q => CNT(23), Qn => CNTn(23));
	DFF24	: dflipflop port map (Clock => CNTn(23), Reset => Reset, D => CNTn(24), Q => CNT(24), Qn => CNTn(24));
	DFF25	: dflipflop port map (Clock => CNTn(24), Reset => Reset, D => CNTn(25), Q => CNT(25), Qn => CNTn(25));
	DFF26	: dflipflop port map (Clock => CNTn(25), Reset => Reset, D => CNTn(26), Q => CNT(26), Qn => CNTn(26));
	DFF27	: dflipflop port map (Clock => CNTn(26), Reset => Reset, D => CNTn(27), Q => CNT(27), Qn => CNTn(27));
	DFF28	: dflipflop port map (Clock => CNTn(27), Reset => Reset, D => CNTn(28), Q => CNT(28), Qn => CNTn(28));
	DFF29	: dflipflop port map (Clock => CNTn(28), Reset => Reset, D => CNTn(29), Q => CNT(29), Qn => CNTn(29));
	DFF30	: dflipflop port map (Clock => CNTn(29), Reset => Reset, D => CNTn(30), Q => CNT(30), Qn => CNTn(30));
	DFF31	: dflipflop port map (Clock => CNTn(30), Reset => Reset, D => CNTn(31), Q => CNT(31), Qn => CNTn(31));
	
	DFF32	: dflipflop port map (Clock => CNTn(31), Reset => Reset, D => CNTn(32), Q => CNT(32), Qn => CNTn(32));
	DFF33	: dflipflop port map (Clock => CNTn(32), Reset => Reset, D => CNTn(33), Q => CNT(33), Qn => CNTn(33));
	DFF34	: dflipflop port map (Clock => CNTn(33), Reset => Reset, D => CNTn(34), Q => CNT(34), Qn => CNTn(34));
	DFF35	: dflipflop port map (Clock => CNTn(34), Reset => Reset, D => CNTn(35), Q => CNT(35), Qn => CNTn(35));
	DFF36	: dflipflop port map (Clock => CNTn(35), Reset => Reset, D => CNTn(36), Q => CNT(36), Qn => CNTn(36));
	DFF37	: dflipflop port map (Clock => CNTn(36), Reset => Reset, D => CNTn(37), Q => CNT(37), Qn => CNTn(37));
	
	
	process (Sel)
	begin
	
			if (Sel = "00") then 
					Clock_div <= CNT(0);
			elsif (Sel = "01") then 
					Clock_div <= CNT(17);
			elsif (Sel = "10") then 
					Clock_div <= CNT(23);
			elsif (Sel = "11") then 
					Clock_div <= CNT(25);	
			end if;
	end process;	
	
	Clock_Out <= Clock_div;
	
end architecture;
	