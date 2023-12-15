

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity BUS1 is
port( i : in std_logic_vector(7 downto 0);
		o: out std_logic_vector(7 downto 0);
		bus11,clk : in std_logic);
end BUS1;

architecture Behavioral of BUS1 is

begin
process(clk,i,bus11)
begin 
	if rising_edge(clk) then
		if bus11='0' then 
			o <= i;
		else 	
			o<= "00000001";
		end if;
	end if;
end process;	

end Behavioral;

