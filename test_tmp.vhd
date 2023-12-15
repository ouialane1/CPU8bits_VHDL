
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_tmp IS
END test_tmp;
 
ARCHITECTURE behavior OF test_tmp IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TMP
    PORT(
         i : IN  std_logic_vector(7 downto 0);
         o : OUT  std_logic_vector(7 downto 0);
         set : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic_vector(7 downto 0) := (others => '0');
   signal set : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal o : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TMP PORT MAP (
          i => i,
          o => o,
          set => set,
          clk => clk
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	
			i <= "11100011";
			set <= '1';
      wait for 5 ns;
			i <= "11111111";
			set <= '0';
      wait for 5 ns;
			i <= "11111111";
			set <= '1';
      wait for 5 ns;

   

      
   end process;

END;
