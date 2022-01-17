----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2021 04:26:46 PM
-- Design Name: 
-- Module Name: mux15_1 - Behavioral
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

entity mux15_1 is
  Port ( o : out  std_logic_vector(63 downto 0);
        alu64 : in std_logic_vector(63 downto 0);
        alu32 : in std_logic_vector(63 downto 0);
        alu16 : in std_logic_vector(63 downto 0);
        alu8 : in std_logic_vector(63 downto 0);
        sel : in std_logic_vector( 1 downto 0)
         );
end mux15_1;

architecture Behavioral of mux15_1 is

begin
process(alu64, alu32, alu16, alu8, sel)
begin
    if(sel = "00") then
        o <= alu8;
    elsif (sel = "01") then
        o <= alu16;
    elsif(sel ="10") then 
        o <= alu32;
    else 
        o <= alu64;
   end if;

end process;


end Behavioral;
