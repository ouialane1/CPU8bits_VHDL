library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity RAM is
port(
 a: in std_logic_vector(7 downto 0); 
 data: inout std_logic_vector(7 downto 0);
 s: in std_logic; 
 e: in std_logic;
 clk: in std_logic
);
end RAM;
architecture Behavioral of RAM is
type ram_array is array (0 to 256 ) of std_logic_vector (7 downto 0);
signal ram_data: ram_array ; 
begin
process(clk)
begin
 if rising_edge(clk) then
	if e= '0' then 
		data <="00000000";	
	elsif(s='1') then 
		ram_data(to_integer(unsigned(a))) <= data ;
		data <=ram_data(to_integer(unsigned(a)));
	end if;
 end if;
end process;
end Behavioral;
