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

entity alu16 is
 Port (     RD1 : in STD_LOGIC_VECTOR (15 downto 0);
            RD2 : in STD_LOGIC_VECTOR (15 downto 0);
            aluen3 : in std_logic;
            aluctrl : in std_logic_vector(2 downto 0);
            alures : out STD_LOGIC_VECTOR(15 downto 0)
);
end alu16;

architecture Behavioral of alu16 is
component adder_16bits is
   Port (       A : in STD_LOGIC_VECTOR (15 downto 0);
                B : in STD_LOGIC_VECTOR (15 downto 0);
                Cin : in STD_LOGIC;
                S : out STD_LOGIC_VECTOR (15 downto 0);
                Cout : out STD_LOGIC
 );
end component;


signal SigAluOut : STD_LOGIC_VECTOR(15 downto 0);
signal comp : std_logic_vector(15 downto 0);
signal Si : std_logic_vector(15 downto 0);
signal co: STD_LOGIC;
signal Dif : std_logic_vector(15 downto 0);
signal b0: STD_LOGIC;
signal notRD2 :  std_logic_vector(15 downto 0);
begin
 --SigAluOut <= RD1;
 notRD2 <= (not RD2);
 comp <= RD1 - RD2;
 Add: adder_16bits port map(RD1, RD2,'0', Si, co );
 Sub: adder_16bits port map(RD1, notRD2, '1',Dif, b0);
 process(aluctrl, RD1, RD2, aluen3, SigAluOut, comp,Si, Dif)
 begin
 if(aluen3 = '1') then
    case aluctrl  is
       when "000" => SigAluOut <= Si;-- PADD
       when "001" => SigAluOut <= Dif; -- PSUBB
       when "010" => 
            if( comp = "0000000000000000") then 
                SigAluOut <= "1111111111111111";
            else
                SigAluOut <= "0000000000000000"; 
            end if;                                    
       when  others => SigAluOut <= RD1; 
    end case;
 end if;

end process;
 alures<= SigAluOut;


end Behavioral;
