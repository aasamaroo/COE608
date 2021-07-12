library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity reset_circuit is
port(
reset : in std_logic;
clk : in std_logic;
enable_PD : out std_logic :='1';
clr_PC : out std_logic
);
end reset_circuit;

architecture Behavior of reset_circuit is
type clkNum is (clk0, clk1, clk2, clk3);
signal present_clk: clkNum;
begin
	process(clk)begin
		if rising_edge(clk) then
			if reset = '1' then	
				clr_PC <= '1';
				enable_PD <= '0';
				present_clk <= clk0;
			elsif present_clk <= clk0 then
				present_clk <= clk1;
			elsif present_clk <= clk1 then 
				present_clk <= clk2;
			elsif present_clk <= clk2 then 
				present_clk <= clk3;
			elsif present_clk <= clk3 then 
				clr_PC <= '0';
				enable_PD <= '1';
			end if;
			end if;
			end process;
		end Behavior;