----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2021 09:11:31 PM
-- Design Name: 
-- Module Name: alu64 - Behavioral
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

entity alu64 is
        Port (  RD1 : in STD_LOGIC_VECTOR (63 downto 0);
                RD2 : in STD_LOGIC_VECTOR (63 downto 0);
                aluen1 : in std_logic;
                aluctrl : in std_logic_vector(2 downto 0);
                alures : out STD_LOGIC_VECTOR(63 downto 0)
 );
end alu64;

architecture Behavioral of alu64 is

signal SigAluOut : STD_LOGIC_VECTOR(63 downto 0);

begin
 --SigAluOut <= RD1;
 process(aluctrl, RD1, RD2, aluen1)
 begin
 if(aluen1 = '1') then
    case aluctrl  is
       when "011" => SigAluOut <= RD1 and RD2;-- PAND
       when "100" => SigAluOut <= RD1 or RD2; -- POR
       when "101" => SigAluOut <= RD1 xor RD2;    --PXOR                       
       when  others => SigAluOut <= RD1; 
    end case;
 end if;

end process;

alures<= SigAluOut; 

end Behavioral;
