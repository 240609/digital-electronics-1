----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2023 11:37:36 AM
-- Design Name: 
-- Module Name: morseovka - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder is
--  Port ( );
    Port ( blank : in STD_LOGIC;
           morse : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end decoder;

architecture Behavioral of decoder is

begin

p_7seg_decoder : process (blank, morse) is

  begin

    if (blank = '1') then
      seg <= "1111111";     -- Blanking display
    else

      case morse is

        when "10111" =>

          seg <= "0000010"; -- A

        when "111010101" =>

          seg <= "1100000"; -- B

        when "11101011101" =>

          seg <= "1110010"; -- C
          
        when "1110101" =>

          seg <= "1000010"; -- D

        when "1" =>

          seg <= "0110000"; -- E
          
        when "101011101" =>

          seg <= "0111000"; -- F
        
        when "111011101" =>

          seg <= "0100001"; -- G
        
        when "1010101" =>

          seg <= "1101000"; -- H


        when "101" =>

          seg <= "0111011"; -- I

        when "1011101110111" =>

          seg <= "0100111"; -- J
        
        when "111010111" =>

          seg <= "0101000"; -- K
          
        when "101110101" =>

          seg <= "1110001"; -- L
          
        when "1110111" =>

          seg <= "0101010"; -- M
          
        when "11101" =>

          seg <= "1101010"; -- N


        when "11101110111" =>

          seg <= "1100010"; -- O

        when "10111011101" =>

          seg <= "0011000"; -- P
        
        when "1110111010111" =>

          seg <= "0001100"; -- Q
        
        when "1011101" =>

          seg <= "1111010"; -- R
          
        when "10101" =>

          seg <= "0100101"; -- S
          
        when "111" =>

          seg <= "1110000"; -- T
          
        when "1010111" =>

          seg <= "1100011"; -- U


        when "101010111" =>

          seg <= "1010101"; -- V

        when "101110111" =>

          seg <= "1010100"; -- W
          
        when "11101010111" =>

          seg <= "1101011"; -- X
        
        when "1110101110111" =>

          seg <= "1000100"; -- Y
          
        when "11101110101" =>

          seg <= "0010011"; -- Z
          
        when "1110111011101110111" =>

          seg <= "0000001"; -- 0
          
        when "10111011101110111" =>

          seg <= "1001111"; -- 1


        when "101011101110111" =>

          seg <= "0010010"; -- 2

        when "1010101110111" =>

          seg <= "0000110"; -- 3
          
        when "10101010111" =>

          seg <= "1001100"; -- 4
        
        when "101010101" =>

          seg <= "0100100"; -- 5
          
        when "11101010101" =>

          seg <= "0100000"; -- 6
          
         when "1110111010101" =>

          seg <= "0001111"; -- 7
        
        when "111011101110101" =>

          seg <= "0000000"; -- 8
          
        when "11101110111011101" =>

          seg <= "0000100"; -- 9          
   
      end case;

    end if;

  end process p_7seg_decoder;

end Behavioral;
