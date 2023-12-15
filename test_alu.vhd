
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_alu IS
END test_alu;
 
ARCHITECTURE behavior OF test_alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         IN_A : IN  std_logic_vector(7 downto 0);
         IN_B : IN  std_logic_vector(7 downto 0);
         SEL : IN  std_logic_vector(2 downto 0);
         IN_CARRY : IN  std_logic;
         clk : IN  std_logic;
         OUT_ALU : OUT  std_logic_vector(7 downto 0);
         OUT_CARRY : OUT  std_logic;
         FLAG_EQUAL : OUT  std_logic;
         FLAG_A_LARGER : OUT  std_logic;
         ZERO : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal IN_A : std_logic_vector(7 downto 0) := (others => '0');
   signal IN_B : std_logic_vector(7 downto 0) := (others => '0');
   signal SEL : std_logic_vector(2 downto 0) := (others => '0');
   signal IN_CARRY : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal OUT_ALU : std_logic_vector(7 downto 0);
   signal OUT_CARRY : std_logic;
   signal FLAG_EQUAL : std_logic;
   signal FLAG_A_LARGER : std_logic;
   signal ZERO : std_logic;


 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          IN_A => IN_A,
          IN_B => IN_B,
          SEL => SEL,
          IN_CARRY => IN_CARRY,
          clk => clk,
          OUT_ALU => OUT_ALU,
          OUT_CARRY => OUT_CARRY,
          FLAG_EQUAL => FLAG_EQUAL,
          FLAG_A_LARGER => FLAG_A_LARGER,
          ZERO => ZERO
        );
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 1000 ns;	
			IN_A <="00000011";
			IN_B <= "00000010";
			SEL <= "000";

      wait for 100 ns ;
			SEL <= "001";

      wait for 100ns;
		SEL <= "010";


      wait for 100 ns;
		SEL <= "011";
		wait for 100 ns;
		SEL <= "100";
		wait for 100 ns;
		SEL <= "101";
		wait for 100 ns;
		SEL <= "110";
		wait for 100 ns;
		SEL <= "111";


      -- insert stimulus here 

      wait;
   end process;

END;
