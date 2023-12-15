
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ALU is
 port( IN_A,IN_B : in std_logic_vector(7 downto 0);
			SEL : in std_logic_vector(2 downto 0);
			IN_CARRY,clk : in std_logic;
			OUT_ALU : out std_logic_vector(7 downto 0);
			OUT_CARRY : out std_logic;
			FLAG_EQUAL : out std_logic;
			FLAG_A_LARGER : out std_logic;
			ZERO : out std_logic);
end ALU;

architecture Behavioral of ALU is
 component add is
    port ( A : in  STD_LOGIC_Vector (7 downto 0);
           B : in STD_LOGIC_Vector (7 downto 0);
           Cin : in  STD_LOGIC;
           S : out STD_LOGIC_Vector (7 downto 0);
           Cout : out  STD_LOGIC);
 end component;
Signal K,S : std_logic_vector(7 downto 0);
Signal  Coutn : std_logic;
begin
 add1 : add port map(A=>IN_A , B=>IN_B , Cin=>IN_CARRY , S=>S , Cout=>Coutn );
process(clk, IN_A, IN_B, SEL) 
begin
 if rising_edge(clk) then
	case SEL is 
	 when "000" =>
		K <= S;
		OUT_ALU <= K;
		OUT_CARRY <= Coutn;
		ZERO <= not(K(0) or K(1) or K(2) or K(3) or K(4) or K(5) or K(6) or K(7));
	 when "001" =>
			K(0) <=  IN_CARRY;
			for i in 0 to 6 loop
				K(i+1) <= IN_A(i);
			end loop;
			OUT_ALU <= K;
			OUT_CARRY <= IN_A(7);
		   ZERO <= not(K(0) or K(1) or K(2) or K(3) or K(4) or K(5) or K(6) or K(7)); 
	 when "010" =>
			K(7) <=  IN_CARRY;
			for i in 1 to 7 loop
				K(i-1) <= IN_A(i);
			end loop;
			OUT_CARRY <= IN_A(0);
			OUT_ALU <= K;
			ZERO <= not(K(0) or K(1) or K(2) or K(3) or K(4) or K(5) or K(6) or K(7));
	 when "011" =>
			K <= not(IN_A);
			OUT_ALU <= K;		
		ZERO <= not(K(0) or K(1) or K(2) or K(3) or K(4) or K(5) or K(6) or K(7));
	 when "100" =>
			K <= IN_A and IN_B;
			OUT_ALU <= K;
			ZERO <= not(K(0) or K(1) or K(2) or K(3) or K(4) or K(5) or K(6) or K(7));
	 when "101" =>
			K<= IN_A or IN_B;
			OUT_ALU <= K;
			ZERO <= not(K(0) or K(1) or K(2) or K(3) or K(4) or K(5) or K(6) or K(7));
	 when "110" =>	
			K <= IN_A xor IN_B;
			OUT_ALU <= K;
			ZERO <= not(K(0) or K(1) or K(2) or K(3) or K(4) or K(5) or K(6) or K(7));
	 when others =>	
			if (IN_A > IN_B) then
				FLAG_A_LARGER <= '1';
				FLAG_EQUAL <= '0';
			elsif ( IN_A = IN_B) then
				FLAG_EQUAL <= '1';
			else 
				FLAG_A_LARGER <= '0';
				FLAG_EQUAL <= '0';
			end if;
	end case;
 end if;
end process;
end Behavioral;

