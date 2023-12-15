--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:57:12 01/15/2023
-- Design Name:   
-- Module Name:   C:/test/regester/memoire.vhd
-- Project Name:  regester
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memory
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY memoire IS
END memoire;
 
ARCHITECTURE behavior OF memoire IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memory
    PORT(
         i : IN  std_logic_vector(7 downto 0);
         o : OUT  std_logic_vector(7 downto 0);
         set,clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic_vector(7 downto 0) := (others => '0');
   signal set : std_logic := '0';
	signal clk : std_logic ;

 	--Outputs
   signal o : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memory PORT MAP (
          i => i,
          o => o,
          set => set,
			 clk => clk
        );

   -- Clock process definitions
 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 1000 ns;	
	  i <= "11111111";
	  set <= '1';
 
      wait for 100 ns;
		i <= "11111111";
	   set <= '0';
      wait for 100 ns;
		i <= "10001111";
	   set <= '0';

      wait for 100 ns ;
		i <= "10001111";
	   set <= '1';

      

      wait for 100 ns;

      -- insert stimulus here 

   end process;

END;
