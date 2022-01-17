----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2021 08:21:39 PM
-- Design Name: 
-- Module Name: MainControl - Behavioral
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

entity MainControl is
    Port (  pachet : in std_logic_vector(1 downto 0);
            sel : out std_logic_vector( 1 downto 0);
            aluen1 : out std_logic;
            aluen2 : out std_logic;
            aluen3 : out std_logic;
            aluen4 : out std_logic     
            );
end MainControl;

architecture Behavioral of MainControl is

begin


process(pachet) 
    begin
    case(pachet) is
        when "00" => -- pe 8 biti
            aluen4 <= '1';
            sel <="00";
            aluen1 <= 'X';
            aluen2 <= 'X';
            aluen3 <= 'X';
        when "01" => -- 16 biti
            aluen3 <= '1';
            sel <= "01";
            aluen1 <= 'X';
            aluen2 <= 'X';
            aluen4 <= 'X';
        when "10" => -- 32 biti
            aluen2 <= '1';
            sel <= "10";
            aluen1 <= 'X';
            aluen3 <= 'X';
            aluen4 <= 'X';  
        when "11" => --64 de biti 
            aluen1 <= '1';
            sel <="11";
            aluen2 <= 'X';
            aluen3 <= 'X';
            aluen4 <= 'X';
        when others => 
            sel <= "XX";
            aluen1 <= 'X';
            aluen2 <= 'X';
            aluen3 <= 'X';
            aluen4 <= 'X';
        end case;
    end process;

            


end Behavioral;
