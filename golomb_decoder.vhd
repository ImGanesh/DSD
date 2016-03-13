library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity decoder is
generic (
	k_bits_g : natural := 3;
	limit_bits_g : natural := 12;
	qmax_c : natural := 3;
	QbppMax : natural := 8
	);

port (
	clk_i : in std_logic;
	k_i_nat : in natural range 0 to 2**k_bits_g;
	cw : in std_logic_vector(limit_bits_g - 1 downto 0);
	e_hat_o : out std_logic_vector(QbppMax downto 0);
	e_hat_valid_o : out std_logic;
	decoded : out natural range 0 to limit_bits_g
	);
end entity decoder;

architecture golomb_decoder of decoder is

signal temp: std_logic_vector(2 downto 0) := "100";
signal temp2 : std_logic_vector(3 downto 0) := "1000";
signal temp3 : std_logic_vector(1 downto 0) := "01";

begin

process(clk_i)
	begin
		if(clk_i'EVENT and clk_i ='1') then
			if (cw(limit_bits_g -1) = '1') then	
				e_hat_o <=  cw(limit_bits_g-1-1 downto limit_bits_g-1-3);
			elsif (cw(limit_bits_g -1 downto limit_bits_g - 1 - 1) = "01") then
				e_hat_o <=  std_logic_vector(unsigned(temp) + unsigned(cw(limit_bits_g-1-2 downto limit_bits_g-1-3)));
			elsif (cw(limit_bits_g -1 downto limit_bits_g - 1 - 2) = "001") then
				e_hat_o <= std_logic_vector(unsigned(temp2) + unsigned(cw(limit_bits_g-1-3 downto limit_bits_g-1-3)));
			elsif (cw(limit_bits_g -1 downto limit_bits_g - 1 - 3) = "000") then
				e_hat_o <= std_logic_vector(unsigned(temp3) + unsigned(cw(QbppMax downto 0)));
			end if;
		end if;
end process;


end architecture golomb_decoder;