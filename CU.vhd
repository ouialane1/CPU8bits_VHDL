library ieee;
use ieee.std_logic_1164.ALL;

ENTITY ControlUnit IS
PORT(
    clk, mclk : IN STD_LOGIC;
    enable : IN STD_LOGIC;
    statusC, statusZ : IN STD_LOGIC;
    INST : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    A_Mux, B_Mux : OUT STD_LOGIC;
    IM_MUX1, REG_Mux : OUT STD_LOGIC;
    IM_MUX2, DATA_Mux : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    ALU_op : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    inc_PC, ld_PC : OUT STD_LOGIC;
    clr_IR : OUT STD_LOGIC;
    ld_IR : OUT STD_LOGIC;
    clr_A, clr_B, clr_C, clr_Z : OUT STD_LOGIC;
    ld_A, ld_B, ld_C, ld_Z : OUT STD_LOGIC;
    T : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    wen, en : OUT STD_LOGIC);
END ControlUnit;

ARCHITECTURE description OF ControlUnit IS
    TYPE STATETYPE IS (state_0, state_1, state_2);
    SIGNAL present_state: STATETYPE;
BEGIN
-------- OPERATION DECODER ---------
PROCESS (present_state, INST, statusC, statusZ, enable)
    BEGIN
-------- YOU FILL IN WHAT GOES IN HERE (DON'T FORGET TO CHECK FOR ENABLE)
-------- OUTPUT ASSIGNMENTS
                                    -- STATE T0
        IF (enable = '1') THEN
            IF (present_state = state_0) THEN --IR <= M[INST]
                clr_IR <= '0';
                ld_IR <= '1';
                ld_PC <= '0';
                inc_PC <= '0';
                clr_A <= '0';
                ld_A <= '0';
                clr_B <= '0';
                ld_B <= '0';
                clr_C <= '0';
                ld_C <= '0';
                clr_Z <= '0';
                ld_Z <= '0';
                ALU_op <= "000";
                A_Mux <= 'X';
                B_Mux <= 'X';
                REG_Mux <= 'X';
                DATA_Mux <= "00";
                IM_MUX1 <= '0';
                IM_MUX2 <= "00";
                                    -- STATE T1


                                                -- STATE T2
            ELSIF(present_state = state_1) THEN

            if (INST(31 DOWNTO 28)="0000") then --LDAI
                            clr_IR <= '0';
                            ld_IR <= '0';
                            --ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '1';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '0';
                            clr_Z <= '0';
                            ld_Z <= '0';
                            ALU_op <= "000";
                            A_Mux <= '1';
                            REG_Mux <= 'X';
                            DATA_Mux <= "00";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "00";
                            elsif (INST(31 DOWNTO 28)="0001") then
                    --LDBI
                            B_Mux <= '1';
                            clr_IR <= '0';
                            ld_IR <= '0';
                            --ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '0';
                            clr_B <= '0';
                            ld_B <= '1';
                            clr_C <= '0';
                            ld_C <= '0';
                            clr_Z <= '0';
                            ld_Z <= '0';
                            ALU_op <= "000";
                            A_Mux <= '0';
                            B_Mux <= '1';
                            B_Mux <= '1';
                            REG_Mux <= '0';
                            DATA_Mux <= "00";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "00";
                            elsif (INST(31 DOWNTO 28)="0010") then --STA
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';

                            clr_A <= '0';
                            ld_A <= '0';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '0';
                            clr_Z <= '0';
                            ld_Z <= '0';
                            ALU_op <= "000";                            
                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "00";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "00";
                            elsif (INST(31 DOWNTO 28)="0011") then --STB
                            clr_IR <= '0';
                            ld_IR <= '0';
                            --ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '0';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '0';
                            clr_Z <= '0';
                            ld_Z <= '0';
                            ALU_op <= "000";                            
                            A_Mux <= '0';
                            REG_Mux <= '1';
                            DATA_Mux <= "00";
                            IM_MUX1 <= '0';
    IM_MUX2 <= "00";
                        end if;
                        inc_PC <= '1';
                        ld_PC <= '1';
            ELSIF(present_state = state_2) THEN
                B_Mux <= '1';
                inc_PC <= '0';
                CASE INST(31 DOWNTO 24) IS
                    WHEN "01110000" => --ADD
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '1';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '1';
                            clr_Z <= '0';
                            ld_Z <= '1';
                            ALU_op <= "010";
                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "10";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "00";
                        WHEN "01110001" => --ADDI
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '1';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '1';
                            clr_Z <= '0';
                            ld_Z <= '1';
                            ALU_op <= "010";
                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "10";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "01";
                        WHEN "01110010" => --SUB
    clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '1';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '1';
                            clr_Z <= '0';
                            ld_Z <= '1';
                            ALU_op <= "110";
                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "10";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "00";
                        WHEN "01110011" => --INCA
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '1';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '1';
                            clr_Z <= '0';
                            ld_Z <= '1';
                            ALU_op <= "010";
                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "10";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "10";
            WHEN "01110100" => --ROL
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '1';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '1';
                            clr_Z <= '0';
                            ld_Z <= '1';
                            ALU_op <= "100";
                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "10";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "00";
                        WHEN "01110101" => --CLRA
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '1';
                            ld_A <= '0';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '0';
                            clr_Z <= '0';
                            ld_Z <= '0';
                            ALU_op <= "000";
                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "00";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "00";
                        WHEN "01110110" => --CLRB
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '0';
                            clr_B <= '1';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '0';
                            clr_Z <= '0';
                            ld_Z <= '0';
                            ALU_op <= "000";

                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "00";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "00";
                        WHEN "01110111" => --CLRC
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '0';
                            clr_B <= '0';
                            ld_B <= '0';
            clr_C <= '1';
                            ld_C <= '0';
                            clr_Z <= '0';
                            ld_Z <= '0';
                            ALU_op <= "000";

                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "00";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "00";
                        WHEN "01111000" => --CLRZ
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '0';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '0';
                            clr_Z <= '1';
                            ld_Z <= '0';
                            ALU_op <= "000";

                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "00";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "00";
                        WHEN "01111001" => --ANDI
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '1';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '1';
                            clr_Z <= '0';
                            ld_Z <= '1';
                            ALU_op <= "000";
                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "10";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "01";
                    WHEN "01111011" => --AND
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '1';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '1';
                            clr_Z <= '0';
                            ld_Z <= '1';
                            ALU_op <= "000";
                            A_Mux <= '0';
            REG_Mux <= '0';
                            DATA_Mux <= "10";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "00";
                        WHEN "01111010" => --Checks for zero flag
                            IF (statusZ = '1') THEN
                                clr_IR <= '0';
                                ld_IR <= '0';
                                ld_PC <= '0';
                                inc_PC <= '1';
                                clr_A <= '0';
                                ld_A <= '0';
                                clr_B <= '0';
                                ld_B <= '0';
                                clr_C <= '0';
                                ld_C <= '0';
                                clr_Z <= '0';
                                ld_Z <= '0';
                                ALU_op <= "000";
                                A_Mux <= '0';
                                REG_Mux <= '0';
                                DATA_Mux <= "00";
                                IM_MUX1 <= '0';
                                IM_MUX2 <= "00";
                            END IF;
                        WHEN "01111100" => --Checks for carry flag
                            IF (statusC = '1') THEN
                                clr_IR <= '0';
                                ld_IR <= '0';
                                ld_PC <= '0';
                                inc_PC <= '1';
                                clr_A <= '0';
                                ld_A <= '0';
                                clr_B <= '0';
                                ld_B <= '0';
                                clr_C <= '0';
                                ld_C <= '0';
                                clr_Z <= '0';
                                ld_Z <= '0';
                                ALU_op <= "000";

                                A_Mux <= '0';
                                REG_Mux <= '0';
                                DATA_Mux <= "00";
                                IM_MUX1 <= '0';
                                IM_MUX2 <= "00";
                            END IF;
                        WHEN "01111101" => --ORI
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '1';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '1';
                            clr_Z <= '0';
                            ld_Z <= '1';
                            ALU_op <= "001";

                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "10";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "01";
                        WHEN "01111110" => --DECA
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '1';
            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '1';
                            clr_Z <= '0';
                            ld_Z <= '1';
                            ALU_op <= "110";

                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "10";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "10";
                        WHEN "01111111" => --ROR
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '1';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '1';
                            clr_Z <= '0';
                            ld_Z <= '1';
                            ALU_op <= "111";

                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "10";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "00";
                    WHEN OTHERS =>
                            NULL;
                END CASE;

                    CASE INST(31 DOWNTO 28) IS
                        WHEN "0100" => --LUI
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '1';
                            clr_B <= '1';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '0';
                            clr_Z <= '0';
                            ld_Z <= '0';
                            ALU_op <= "001";

                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "10";
                            IM_MUX1 <= '1';
                            IM_MUX2 <= "00";
                        WHEN "0101" => --JMP
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '1';
                            clr_A <= '0';
                            ld_A <= '0';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '0';
                            clr_Z <= '0';
                            ld_Z <= '0';
                            ALU_op <= "000";

                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "00";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "00";
                        WHEN "0110" => --BEQ
                            IF (statusZ = '1') THEN
        clr_IR <= '0';
                                ld_IR <= '0';
                                ld_PC <= '1';
                                clr_A <= '0';
                                ld_A <= '0';
                                clr_B <= '0';
                                ld_B <= '0';
                                clr_C <= '0';
                                ld_C <= '0';
                                clr_Z <= '0';
                                ld_Z <= '0';
                                ALU_op <= "000";

                                A_Mux <= '0';
                                REG_Mux <= '0';
                                DATA_Mux <= "00";
                                IM_MUX1 <= '0';
                                IM_MUX2 <= "00";
                            ELSE
                                clr_IR <= '0';
                                ld_IR <= '0';
                                ld_PC <= '0';
                                clr_A <= '0';
                                ld_A <= '0';
                                clr_B <= '0';
                                ld_B <= '0';
                                clr_C <= '0';
                                ld_C <= '0';
                                clr_Z <= '0';
                                ld_Z <= '0';
                                ALU_op <= "000";

                                A_Mux <= '0';
                                REG_Mux <= '0';
                                DATA_Mux <= "00";
                                IM_MUX1 <= '0';
                                IM_MUX2 <= "00";
                            END IF;
                        WHEN "1000" => --BNE
                            IF (statusZ = '0') THEN
                                clr_IR <= '0';
                                ld_IR <= '0';
                                ld_PC <= '1';
                                clr_A <= '0';
                                ld_A <= '0';
                                clr_B <= '0';
                                ld_B <= '0';
                                clr_C <= '0';
                                ld_C <= '0';
                                clr_Z <= '0';
                                ld_Z <= '0';
                                ALU_op <= "000";
                                A_Mux <= '0';
                                REG_Mux <= '0';
                                DATA_Mux <= "00";
                                IM_MUX1 <= '0';
                                IM_MUX2 <= "00";
                            ELSE
                                clr_IR <= '0';
                                ld_IR <= '0';
                                ld_PC <= '0';
                                clr_A <= '0';
                                ld_A <= '0';
                                clr_B <= '0';
                                ld_B <= '0';
                                clr_C <= '0';
                                ld_C <= '0';
                                clr_Z <= '0';
                                ld_Z <= '0';
                                ALU_op <= "000";

                                A_Mux <= '0';
                                REG_Mux <= '0';
                                DATA_Mux <= "00";
                                IM_MUX1 <= '0';
                                IM_MUX2 <= "00";
                            END IF;
                        WHEN "1001" => --LDA
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '1';
                            clr_B <= '0';
                            ld_B <= '0';
                            clr_C <= '0';
                            ld_C <= '0';
                            clr_Z <= '0';
                            ld_Z <= '0';
                            ALU_op <= "000";
                            A_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "01";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "00";
                    WHEN "1010" => --LDB
                            clr_IR <= '0';
                            ld_IR <= '0';
                            ld_PC <= '0';
                            clr_A <= '0';
                            ld_A <= '0';
                            clr_B <= '0';
                            ld_B <= '1';
                            clr_C <= '0';
                            ld_C <= '0';
                            clr_Z <= '0';
                            ld_Z <= '0';
                            ALU_op <= "000";
                            A_Mux <= '0';
                            B_Mux <= '0';
                            REG_Mux <= '0';
                            DATA_Mux <= "01";
                            IM_MUX1 <= '0';
                            IM_MUX2 <= "00";
                        WHEN OTHERS =>
                            NULL;
                END CASE;
                ld_IR <= '0';
            END IF;
        END IF;
END process;
-------- STATE MACHINE ---------
PROCESS (clk, enable)
    begin
        IF (clk'EVENT AND clk='1' AND enable='1') THEN
            CASE present_state IS
                WHEN state_0 =>
                    T <= "010";
                    present_state <= state_1;
                WHEN state_1 =>
                    T <= "100";
                    present_state <= state_2;
                WHEN state_2 =>
                    T <= "001";
                    present_state <= state_0;
            END CASE;
        ELSIF (clk='1' AND clk'EVENT) THEN
            T <= "001";
            present_state <= state_0;
        END IF;
END process;
-------- DATA MEMORY INSTRUCTIONS ---------
PROCESS (mclk, clk, INST)
BEGIN
    IF(mclk'EVENT and mclk = '0') THEN
        IF(present_state = state_1 AND clk = '0') THEN
            CASE INST(31 DOWNTO 28) IS
            -- LDA and LDB Signals
                WHEN "1001" =>
                    en <= '1';
                    wen <= '0';
                WHEN "1010" =>
                    en <= '1';
                    wen <= '0';
            -- STA and STB Signals
                WHEN "0010" =>
                    en <= '1';
                    wen <= '1';
                WHEN "0011" =>
                    en <= '1';
                    wen <= '1';
            -- Default Case Signals
                WHEN OTHERS =>
                    en <= '0';
                    wen <= '0';
            END CASE;
        ELSIF(present_state = state_2 AND clk = '1') THEN
            -- LDA and LDB
            -- STA and STB
            CASE INST(31 DOWNTO 28) IS
            -- LDA and LDB Signals
                WHEN "1001" =>
                    en <= '1';
                    wen <= '0';
                WHEN "1010" =>
                    en <= '1';
                    wen <= '0';
            -- STA and STB Signals
                WHEN "0010" =>
                    en <= '1';
                    wen <= '1';
                WHEN "0011" =>
                    en <= '1';
                    wen <= '1';
    -- Default Case
            WHEN OTHERS =>
                    en  <= '0';
                    wen <= '0';
            END CASE;
        ELSIF(present_state = state_1) THEN -- or alternatively just an ELSE statement
-- fill in
                    en  <= '0';
                    wen <= '0';
        END IF;
    END IF;
END process;
END description;

