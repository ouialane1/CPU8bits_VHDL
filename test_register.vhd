
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_register IS
END test_register;
 
ARCHITECTURE behavior OF test_register IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_a
    PORT(
         reg_input : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         set : IN  std_logic;
         e : IN  std_logic;
         reg_output : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reg_input : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal set : std_logic := '0';
   signal e : std_logic := '0';

 	--Outputs
   signal reg_output : std_logic_vector(7 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_a PORT MAP (
          reg_input => reg_input,
          clk => clk,
          set => set,
          e => e,
          reg_output => reg_output
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;
			reg_input <= "11111111";
			set <='0';
			e <='0';

      wait for 10 ns ;
			reg_input <= "11111111";
			set <='1';
			e <='0';

      wait for 10 ns ;
			reg_input <= "11111111";
			set <='1';
			e <='1';

      wait for 10 ns ;
			reg_input <= "11110000";
			set <='0';
			e <='1';

      wait for 20 ns ;
			reg_input <= "11110000";
			set <='1';
			e <='1';

      wait for 20 ns ;



   end process;

END;
