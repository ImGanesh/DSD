library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity FSM_Exam is

port (
	clk_i, reset_i : in std_logic;
	X,Y,Z : in std_logic_vector(7 downto 0);
	F : out std_logic_vector(7 downto 0)
	);
	
end entity FSM_Exam;

architecture state_of_fsm of FSM_Exam is 

type state is (A, B, C, D);
signal state_reg : state;
signal state_next : state := A;


begin

process(clk_i, reset_i)



	begin
		if(clk_i'event and clk_i='1') then
			if(reset_i='1') then
				state_reg <= A;
			else
				state_reg <= state_next;
			end if;
		end if;
end process;

process(state_reg, X, Y, Z, clk_i)

variable count : integer :=0;

	begin
		
		case state_reg is 
		
			when A => 
				F <= x"10";
				if(X=Y) then
					state_next <= B;
				elsif(X=Z) then
					state_next <= C;
				else
					state_next <= A;
				end if;
					
			when B =>
				F <= x"25";
				state_next <= D;
			
			when C =>
				F <= x"15";
				state_next <= D;
				
			when D =>
				F <= x"01";
				if(clk_i'event and clk_i='1') then
					if(count = 4) then
						count := 0;
						state_next <= A;
					else 
						count := count + 1;
					end if;
				end if;
				
				
		end case;
		
end process;


end architecture state_of_fsm;
