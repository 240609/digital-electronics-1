----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2023 12:03:24 PM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           SW : in STD_LOGIC;
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC);
end top;

----------------------------------------------------------
-- Architecture body for top level
----------------------------------------------------------

architecture behavioral of top is

  -- 4-bit counter @ 250 ms
  signal sig_en_250ms : std_logic;                    --! Clock enable signal for Counter0
  signal sig_cnt_4bit : std_logic_vector(3 downto 0); --! Counter0
  
  signal sig_en_10ms :  std_logic;                   
  signal sig_cnt_16bit : std_logic_vector(11 downto 0);

begin

  --------------------------------------------------------
  -- Instance (copy) of clock_enable entity
-- entity clock_enable is
 -- generic (
  --  g_MAX : natural := 5 --! Number of clk pulses to generate one enable signal period
 -- );                       -- Note that there IS a semicolon between generic and port sections
 -- port (
  --  clk : in    std_logic; --! Main clock
   -- rst : in    std_logic; --! High-active synchronous reset
   -- ce  : out   std_logic  --! Clock enable pulse signal
 -- );
-- end entity clock_enable;
  --------------------------------------------------------
  clk_en0 : entity work.clock_enable
      generic map(
          g_MAX => 25000000
      )
      port map(
          clk => CLK100MHZ,
          rst => BTNC,
          ce  => sig_en_250ms
      );

  --------------------------------------------------------
  -- Instance (copy) of cnt_up_down entity
  
 -- entity cnt_up_down is
 -- generic (
 --   g_CNT_WIDTH : natural := 4 --! Default number of counter bits
 -- );
 -- port (
 --   clk    : in    std_logic; --! Main clock
 --   rst    : in    std_logic; --! Synchronous reset
 --   en     : in    std_logic; --! Enable input
 --   cnt_up : in    std_logic; --! Direction of the counter
 --   cnt    : out   std_logic_vector(g_CNT_WIDTH - 1 downto 0)
 -- );
-- end entity cnt_up_down;

  --------------------------------------------------------
  bin_cnt0 : entity work.cnt_up_down
     generic map(
          -- WRITE YOUR CODE HERE
          g_CNT_WIDTH => 4
      )
      port map(
          -- WRITE YOUR CODE HERE
          en       => sig_en_250ms,
          clk      => CLK100MHZ,
          rst      => BTNC,
          cnt_up   => SW,
          cnt      => sig_cnt_4bit
      );

  --------------------------------------------------------
  -- Instance (copy) of hex_7seg entity
  
  -- entity hex_7seg is
  --  Port ( blank : in STD_LOGIC;
  --         hex : in STD_LOGIC_VECTOR (3 downto 0);
  --         seg : out STD_LOGIC_VECTOR (6 downto 0));
  -- end hex_7seg;

  --------------------------------------------------------
  hex2seg : entity work.hex_7seg
      port map(
          blank  => BTNC,
          hex    => sig_cnt_4bit,
          seg(6) => CA,
          seg(5) => CB,
          seg(4) => CC,
          seg(3) => CD,
          seg(2) => CE,
          seg(1) => CF,
          seg(0) => CG
      );

  --------------------------------------------------------
  -- Other settings
  --------------------------------------------------------
  -- Connect one common anode to 3.3V
  AN <= b"1111_1110";

end architecture behavioral;
