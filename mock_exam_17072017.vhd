library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
entity whatdoido is
port (
		a,b: in std_logic_vector(7 downto 0);
		agtb: out std_logic;
		altb: out std_logic;
		aeqb: out std_logic
);
end whatdoido;

architecture two of whatdoido is
signal diff,atmp,btmp : std_logic_vector(8 downto 0);
begin

--process(b)
--begin

		atmp <= a(7) & a;
		btmp <= b(7)& b;
		diff <= std_logic_vector(signed(atmp) - signed(btmp));
		agtb <= not diff(8);
		altb <= diff(8);
		aeqb <= not ( diff(8) or diff(7) or diff(6) or diff(5) or diff(4) or diff(3) or diff(2)
			or diff(1) or diff(0) );		
--end process;
end two;