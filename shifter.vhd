library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity shifter is

port( a_sh : in std_logic_vector(3 downto 0);
      b_sh : in signed(3 downto 0);
      sel_sh : in std_logic_vector(1 downto 0);
      c_sh : out std_logic_vector(3 downto 0));

end entity shifter;

architecture behav_shifter of shifter is


begin
	process(a_sh,b_sh)
		begin
		
		CASE b_sh is
			when "1111" => c_sh <= a_sh(3 downto 3) & a_sh(3 downto 1);
			when "1110" => c_sh <= a_sh(3 downto 3) & a_sh(3 downto 3) & a_sh(2 downto 1);
			when "1101" => c_sh <= a_sh(3 downto 3) & a_sh(3 downto 3) & a_sh(3 downto 3) & a_sh(2 downto 2);
			when "1100" | "1011" | "1010" | "1001" | "1000" => c_sh <= a_sh(3 downto 3) & a_sh(3 downto 3) & a_sh(3 downto 3) & a_sh(3 downto 3);
			when "0000" => c_sh <= a_sh;
			when "0001" => c_sh <= a_sh(2 downto 0) & '0';
			when "0010" => c_sh <= a_sh(1 downto 0) & '0' & '0';
			when "0011" => c_sh <= a_sh(0 downto 0) & '0' & '0' & '0';
			when "0100" | "0101" | "0110" | "0111" => c_sh <= "0000";
			when others => c_sh <="0000";
			
		end CASE;
		
	end process;
	


end architecture behav_shifter;
			
				

