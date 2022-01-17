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

entity alu8 is
 Port (     RD1 : in STD_LOGIC_VECTOR (7 downto 0);
            RD2 : in STD_LOGIC_VECTOR (7 downto 0);
            aluen4 : in std_logic;
            aluctrl : in std_logic_vector(2 downto 0);
            alures : out STD_LOGIC_VECTOR(7 downto 0)
);
end alu8;

architecture Behavioral of alu8 is

component adder_8bits  is
    port(       A : in STD_LOGIC_VECTOR (7 downto 0);
                B : in STD_LOGIC_VECTOR (7 downto 0);
                Cin : in STD_LOGIC;
                S : out STD_LOGIC_VECTOR (7 downto 0);
                Cout : out STD_LOGIC);
end component;
signal cary : std_logic_vector(7 downto 0);
signal SigAluOut : STD_LOGIC_VECTOR(7 downto 0);
signal comp : std_logic_vector(7 downto 0);
signal Si : std_logic_vector(7 downto 0);
signal op:  std_logic_vector(7 downto 0);
signal c1,c2,c3,c4,c5,c6,c7,c0: STD_LOGIC;
signal Dif : std_logic_vector(7 downto 0);
signal b0: STD_LOGIC;
signal notRD2 :  std_logic_vector(7 downto 0);
--signal op : std_logic_vector(7 downto 0);
--signal aux : std_logic_vector(7 downto 0);

begin
 --SigAluOut <= RD1;
comp <= RD1 - RD2;
notRD2 <= (not RD2);

 
--aux <= RD2 xor op;
 
--a0:adder port map(RD1(0),RD2(0),nul,sum(0),cary(0));
--a1:adder port map(RD1(1),RD2(1),cary(0),sum(1),cary(1));
---a2:adder port map(RD1(2),RD2(2),cary(1),sum(2),cary(2));
--a3:adder port map(RD1(3),RD2(3),cary(2),sum(3),cary(3));
--a4:adder port map(RD1(4),RD2(4),cary(3),sum(4),cary(4));
--a5:adder port map(RD1(5),RD2(5),cary(4),sum(5),cary(5));
---a6:adder port map(RD1(6),RD2(6),cary(5),sum(6),cary(6));
--a7:adder port map(RD1(7),RD2(7),cary(6),sum(7),cary(7)); -- nu trebe carry la final 

--M1: adder port map( RD1(0), RD2(0), '0', S(0), c1);
--M2: adder port map( RD1(1), RD2(1), c1, S(1), c2);
--M3: adder port map( RD1(2), RD2(2), c2, S(2), c3);
--M4: adder port map( RD1(3), RD2(3), c3, S(3), c4);
--M5: adder port map( RD1(4), RD2(4), c4, S(4), c5);
--M6: adder port map( RD1(5), RD2(5), c5, S(5), c6);
--M7: adder port map( RD1(6), RD2(6), c6, S(6), c7);
--M8: adder port map( RD1(7), RD2(7), c7, S(7), c0);   
Add: adder_8bits port map(RD1, RD2, '0',Si, c0);    
Sub: adder_8bits port map(RD1, notRD2, '1',Dif, b0);
 
 process(aluctrl, aluen4,SigAluOut,comp, RD1, RD2, Si, Dif )
 begin
 if(aluen4 = '1') then
    case aluctrl  is
        when "000" => 
            SigAluOut <=Si; --Padd
        when "001" => 
            SigAluOut <= Dif; -- PSUBB
        when "010" => 
            if( comp = "00000000") then 
                SigAluOut <= "11111111";
            else
                SigAluOut <= "00000000"; 
            end if;                                    
        when  others => SigAluOut <= RD1; 
    end case;
 end if;

end process;
alures<= SigAluOut; 
--alures<= Si;
end Behavioral;
