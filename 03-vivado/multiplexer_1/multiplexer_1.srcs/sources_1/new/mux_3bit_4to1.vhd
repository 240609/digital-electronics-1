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
        a           : in  std_logic_vector(4 - 1 downto 0);
        b           : in  std_logic_vector(4 - 1 downto 0);-- COMPLETE THE ENTITY DECLARATION
        c           : in  std_logic_vector(4 - 1 downto 0);
        d           : in  std_logic_vector(4 - 1 downto 0);
        B_greater_A_o : out std_logic; -- B is greater than A
        B_equals_A_o  : out std_logic; -- B is equals than A
        B_less_A_o    : out std_logic  -- B is less than A
    );
end entity mux_3bit_4to1;

------------------------------------------------------------
-- Architecture body for 2-bit binary comparator
------------------------------------------------------------
architecture Behavioral of mux_3bit_4to1 is

y_o <= a_i when (addr_i = "000" and en_i = '1') else
       b_i when (addr_i = "001" and en_i = '1') else
       c_i when (addr_i = "010" and en_i = '1') else
       d_i;                 -- All other combinations

begin

   p_label : process (a)
begin
    if (a = '0') then
        q <= '0';
    else
        q <= '1';
    end if;
end process p_label;

end architecture Behavioral;