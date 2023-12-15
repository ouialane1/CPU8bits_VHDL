
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY test_bus1 IS
END test_bus1;
 
ARCHITECTURE behavior OF test_bus1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BUS1
    PORT(
         i : IN  std_logic_vector(7 downto 0);
         o : OUT  std_logic_vector(7 downto 0);
         bus11 : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs 
   signal i : std_logic_vector(7 downto 0) ;
   signal bus11 : std_logic ;

   signal clk : std_logic ;

 	--Outputs
   signal o : std_logic_vector(7 downto 0);


 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BUS1 PORT MAP (
          i => i,
          o => o,
          bus11 => bus11,
          clk => clk
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			i<= "11111111";
			bus11<= '0';
      wait for 100 ns ;
			bus11<= '1';

       

      wait for 100 ns;
   end process;

END;
