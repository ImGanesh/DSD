/*
code to check the delta cycle concept. 
Set the initial values as shown in signal declaration
at t=0 on the wave window, press on expand delta mode, and then press expand time at active cursor option.
zoom in and check the delta cycle response at a,b and c.

*/

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;

entity check_delta is

end entity check_delta;

architecture rtl1 of check_delta is 

signal a: integer := 1;
signal b: integer := 2;
signal c: integer := 1;

begin

a <= b+c*2;
b <= c;
c <= 2;

end rtl1;