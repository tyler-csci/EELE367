library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add_n_sub_8bit is 
port (A,B 	: in std_logic_vector(7 downto 0);
      ADDn_SUB	: in std_logic;
      Sum_Diff	: out std_logic_vector(7 downto 0);
      Cout_Bout	: out std_logic;
      Vout	: out std_logic);
end entity;


architecture add_n_sub_8bit_arch of add_n_sub_8bit is 
	
signal B_In, Temp_SUM_DIFF : std_logic_vector (7 downto 0);
signal C, C_Comp : std_logic_vector (6 downto 0);
signal Carry : std_logic;

component full_adder is
port (A   : in  std_logic;
      B   : in  std_logic;
      Cin  : in  std_logic;
      Sum  : out std_logic;
      Cout : out std_logic);
end component;
		
begin
--Addition
A0 : full_adder port map(A(0), B_In(0), '0', Temp_SUM_DIFF(0), C(0));
A1 : full_adder port map(A(1), B_In(1), C(0), Temp_SUM_DIFF(1), C(1));
A2 : full_adder port map(A(2), B_In(2), C(1),Temp_SUM_DIFF(2), C(2));
A3 : full_adder port map(A(3), B_In(3), C(2), Temp_SUM_DIFF(3), C(3));
A4 : full_adder port map(A(4), B_In(4), C(3), Temp_SUM_DIFF(4), C(4));
A5 : full_adder port map(A(5), B_In(5), C(4), Temp_SUM_DIFF(5), C(5));
A6 : full_adder port map(A(6), B_In(6), C(5), Temp_SUM_DIFF(6), C(6));
A7 : full_adder port map(A(7), B_In(7), C(6), Temp_SUM_DIFF(7), Cout_Bout);
	   
process (A, B)
begin
   if ADDn_SUB = '0' then
     B_In <= B;
   else
     --Convert B to 2's Complement because subtraction
     B_In <= std_logic_vector(unsigned(Not B)+1);
			
   end if;
end process;

process (Temp_SUM_DIFF)
begin
   if (A(7) = '0' and B(7) = '0' and Temp_SUM_DIFF(7) = '1' and ADDn_SUB = '0') or
      (A(7) = '1' and B(7) = '1' and Temp_SUM_DIFF(7) = '0' and ADDn_SUB = '0') or
      (A(7) = '1' and B(7) = '0' and Temp_SUM_DIFF(7) = '0' and ADDn_SUB = '1') or
      (A(7) = '0' and B(7) = '1' and Temp_SUM_DIFF(7) = '1' and ADDn_SUB = '1') then
	  Vout <= '1';
   else
	  Vout <= '0';
   end if;

end process;

Sum_Diff <= Temp_SUM_DIFF;

end architecture;
