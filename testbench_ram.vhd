
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY testbench_ram IS
END testbench_ram;
 
ARCHITECTURE behavior OF testbench_ram IS 
 
    
 
    COMPONENT RAM
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         data : INOUT  std_logic_vector(7 downto 0);
         s : IN  std_logic;
			e : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   signal a : std_logic_vector(7 downto 0) ;
   signal data : std_logic_vector(7 downto 0) ;
   signal s : std_logic ;
	signal e : std_logic ;
   signal clk : std_logic ;


 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM PORT MAP (
          a => a,
          data=> data,
          s => s,
			 e => e,
          clk => clk
        );


   -- Stimulus process
   stim_proc: process
   begin		
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



      -- insert stimulus here 

      wait;
   end process;

END;
