library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity mod9counter is
	port(clk : in std_logic;
		op : out std_logic_vector(3 downto 0));
end entity;

architecture mod9_counter of mod9counter is
	signal count : std_logic_vector(3 downto 0) := "0000";
	signal reset : std_logic := '0';
begin
	process(clk)
		begin
			if(clk'event and clk = '1') then
				if(reset = '1') then
					count <= "0000";
					reset <= '0';
				else
					if(count = "1000") then
						reset <= '1';
					end if;
					count <= count + 1;
				end if;
			end if;
			--op <= count;
		end process;
	op <= count;
end architecture;