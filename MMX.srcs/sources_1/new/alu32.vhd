----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2021 06:20:40 PM
-- Design Name: 
-- Module Name: alu32 - Behavioral
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

entity alu32 is
 Port (     RD1 : in STD_LOGIC_VECTOR (31 downto 0);
            RD2 : in STD_LOGIC_VECTOR (31 downto 0);
            aluen2 : in std_logic;
            aluctrl : in std_logic_vector(2 downto 0);
            alures : out STD_LOGIC_VECTOR(31 downto 0)
);
end alu32;

architecture Behavioral of alu32 is
component adder_32bits is
     Port (    A : in STD_LOGIC_VECTOR (31 downto 0);
              B : in STD_LOGIC_VECTOR (31 downto 0);
              Cin : in STD_LOGIC;
              S : out STD_LOGIC_VECTOR (31 downto 0);
              Cout : out STD_LOGIC
);
end component;
signal Si : std_logic_vector(31 downto 0);
signal co: STD_LOGIC;
signal Dif : std_logic_vector(31 downto 0);
signal b0: STD_LOGIC;
signal notRD2 :  std_logic_vector(31 downto 0);

signal SigAluOut : STD_LOGIC_VECTOR(31 downto 0);
signal comp : std_logic_vector(31 downto 0);
begin
notRD2 <= (not RD2);
 Add: adder_32bits port map(RD1, RD2,'0', Si, co );
 Sub: adder_32bits port map(RD1, notRD2, '1',Dif, b0);
 --SigAluOut <= RD1;
 comp <= RD1 - RD2;
 process(aluctrl, RD1, RD2, aluen2, SigAluOut, Si, Dif)
 begin
 if(aluen2 = '1') then
    case aluctrl  is
       when "000" => SigAluOut <= Si;-- PADD
       when "001" => SigAluOut <= Dif; -- PSUBB
       when "010" => 
            if( comp = "00000000000000000000000000000000") then 
                SigAluOut <= "11111111111111111111111111111111";
            else
                SigAluOut <= "00000000000000000000000000000000"; 
            end if;                                    
       when  others => SigAluOut <= RD1; 
    end case;
 end if;
 
end process;
alures<= SigAluOut; 

end Behavioral;
