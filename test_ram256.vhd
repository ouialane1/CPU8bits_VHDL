
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY test_ram256 IS
END test_ram256;
 
ARCHITECTURE behavior OF test_ram256 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         data : INOUT  std_logic_vector(7 downto 0);
         s : IN  std_logic;
         e : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal s : std_logic := '0';
   signal e : std_logic := '0';
   signal clk : std_logic := '0';

	--BiDirs
   signal data : std_logic_vector(7 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM PORT MAP (
          a => a,
          data => data,
          s => s,
          e => e,
          clk => clk
        );

   -- Clock process definitions
  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
    -- hold reset state for 100 ns.
      wait for 1000 ns;	
			a<= "00000000";
			data <= "11111111";
			s<='0';
			e <= '1';
      wait for 20 ns ;
			a<= "00000000";
			data<= "11111111";
			s<='1';
      wait for 20 ns ;
			a<= "00000001";
			data <= "10101010";
			s<='1';
			
      wait for 20 ns ;
			a<= "00000000";
			s<='1';
			e <= '1';
      wait for 20 ns ;
			a<= "00000001";
			s<='1';
		
      wait for 20 ms ;

      wait;
   end process;

END;
