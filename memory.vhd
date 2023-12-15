----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:45:06 01/15/2023 
-- Design Name: 
-- Module Name:    memory - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TMP is
port( signal i : in std_logic_vector(7 downto 0);
		signal o : out std_logic_vector(7 downto 0);
		signal set, clk : in std_logic );
end TMP;

architecture Behavioral of TMP is

begin
process(clk) is 
begin 
 if rising_edge(clk) then 
	if set ='1' then 
		o <=i;
	end if ;
 end if ;
 end process;

end Behavioral;

