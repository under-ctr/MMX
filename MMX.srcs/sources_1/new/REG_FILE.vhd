----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2021 06:22:22 PM
-- Design Name: 
-- Module Name: REG_FILE - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity REG_FILE is
  Port ( clk : in STD_LOGIC;
         
         RD1 : out std_logic_vector(63 downto 0);
         RD2 : out std_logic_vector(63 downto 0);
         RA1 : in std_logic_vector(2 downto 0);
         RA2 : in std_logic_vector(2 downto 0);
         WD : in std_logic_vector(63 downto 0); 
         WA : in std_logic_vector(2 downto 0));

end REG_FILE;

architecture Behavioral of REG_FILE is
type reg_array is array (0 to 7) of std_logic_vector (63 downto 0);
--valorile registrilor  mmx de la mm0 pana la mm7 
signal mem : reg_array :=(
    "0000000100000000100000001100000100000010000000000001000001100001", --000
    "0000001001110000000000100001001000000000000000000000010001100001",--001
    "0000100100100000000000000000100000000000000000000000000000000011",--010
    "0000100100100000000000000000100000000000000000000000000000000010",--011
    "0000000000000000000000000000000000000000000000000000000010000000",--100 =
    "0000000000000000000000000000100000000000000000000000000010100000",--101 = 
    "0000000000000000000000000000010000000000000000000000000000000111",--110
    "0000000000000000000000000000000000000000000000000000000000001000", --111
    others=> "0000000000000000000000000000000000000000000000000000000000000000"
    );

begin
    RD1<=mem(conv_integer(RA1));
    RD2<=mem(conv_integer(RA2));
    
process(clk) 
   begin
   if rising_edge(clk)  then 
            mem(conv_integer(WA))<=WD;
   end if;
end process;


end Behavioral;
