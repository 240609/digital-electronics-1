------------------------------------------------------------
--
-- Example of 2-bit binary comparator using the when/else
-- assignments.
-- EDA Playground
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for 2-bit binary comparator
------------------------------------------------------------
entity mux_3bit_4to1 is
    port(
        b_i           : in  std_logic_vector(4 - 1 downto 0);
        a_i           : in  std_logic_vector(4 - 1 downto 0);-- COMPLETE THE ENTITY DECLARATION
        B_greater_A_o : out std_logic; -- B is greater than A
        B_equals_A_o  : out std_logic; -- B is equals than A
        B_less_A_o    : out std_logic  -- B is less than A
    );
end entity mux_3bit_4to1;

------------------------------------------------------------
-- Architecture body for 2-bit binary comparator
------------------------------------------------------------
architecture Behavioral of mux_3bit_4to1 is
begin
    B_greater_A_o <= '1' when (b_i > a_i) else '0'; -- WRITE "GREATER" ASSIGNMENT HERE
    B_equals_A_o  <= '1' when (b_i = a_i) else '0'; -- WRITE "EQUALS" ASSIGNMENT HERE
    B_less_A_o    <= '1' when (b_i < a_i) else '0';

end architecture Behavioral;
