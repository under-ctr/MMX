----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2021 07:14:11 PM
-- Design Name: 
-- Module Name: Main - Behavioral
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

entity Main is
    Port (  clk : in STD_LOGIC;
            instr : in STD_LOGIC_VECTOR(10 downto 0);
            o : out std_logic_vector(63 downto 0) 
            );
end Main;

architecture Behavioral of Main is

 component MainControl is
     Port ( pachet : in std_logic_vector(1 downto 0);
            sel : out std_logic_vector( 1 downto 0);
            aluen1 : out std_logic;
            aluen2 : out std_logic;
            aluen3 : out std_logic;
            aluen4 : out std_logic     
             );
 end component;
 
 component REG_FILE is
   Port (   clk : in STD_LOGIC;
           
            RD1 : out std_logic_vector(63 downto 0);
            RD2 : out std_logic_vector(63 downto 0);
            RA1 : in std_logic_vector(2 downto 0);
            RA2 : in std_logic_vector(2 downto 0);
            WD : in std_logic_vector(63 downto 0); 
            WA : in std_logic_vector(2 downto 0)
            );
 
 end component;
 
 component mux15_1 is
   Port(    o : out  std_logic_vector(63 downto 0);
            alu64 : in std_logic_vector(63 downto 0);
            alu32 : in std_logic_vector(63 downto 0);
            alu16 : in std_logic_vector(63 downto 0);
            alu8 : in std_logic_vector(63 downto 0);
            sel : in std_logic_vector( 1 downto 0)
          );
 end component;
 
 
 component alu64 is
    Port (  RD1 : in STD_LOGIC_VECTOR (63 downto 0);
            RD2 : in STD_LOGIC_VECTOR (63 downto 0);
            aluen1 : in std_logic;
            aluctrl : in std_logic_vector(2 downto 0);
            alures : out STD_LOGIC_VECTOR(63 downto 0)
                );
 end component;

 component alu32 is
 Port (     RD1 : in STD_LOGIC_VECTOR (31 downto 0);
            RD2 : in STD_LOGIC_VECTOR (31 downto 0);
            aluen2 : in std_logic;
            aluctrl : in std_logic_vector(2 downto 0); --instr
            alures : out STD_LOGIC_VECTOR(31 downto 0)
);
 end component;
 
component alu16 is
  Port (    RD1 : in STD_LOGIC_VECTOR (15 downto 0);
            RD2 : in STD_LOGIC_VECTOR (15 downto 0);
            aluen3 : in std_logic;
            aluctrl : in std_logic_vector(2 downto 0);
            alures : out STD_LOGIC_VECTOR(15 downto 0)
 );
 end component;
 

 component alu8 is
  Port (    RD1 : in STD_LOGIC_VECTOR (7 downto 0);
            RD2 : in STD_LOGIC_VECTOR (7 downto 0);
            aluen4 : in std_logic;
            aluctrl : in std_logic_vector(2 downto 0);
            alures : out STD_LOGIC_VECTOR(7 downto 0)
            );
 end component;

signal  RD1 :  std_logic_vector(63 downto 0);
signal  RD2 :  std_logic_vector(63 downto 0);
signal  WD :  std_logic_vector(63 downto 0); 
 
signal alures64 : std_logic_vector(63 downto 0);
signal alures32_1 : std_logic_vector(31 downto 0);
signal alures32_2 : std_logic_vector(31 downto 0);
signal alures16_1 : std_logic_vector(15 downto 0);
signal alures16_2 : std_logic_vector(15 downto 0);
signal alures16_3 : std_logic_vector(15 downto 0);
signal alures16_4 : std_logic_vector(15 downto 0);
signal alures8_1 : std_logic_vector(7 downto 0);
signal alures8_2 : std_logic_vector(7 downto 0);
signal alures8_3 : std_logic_vector(7 downto 0);
signal alures8_4 : std_logic_vector(7 downto 0);
signal alures8_5 : std_logic_vector(7 downto 0);
signal alures8_6 : std_logic_vector(7 downto 0);
signal alures8_7 : std_logic_vector(7 downto 0);
signal alures8_8 : std_logic_vector(7 downto 0);

signal alures32 : std_logic_vector(63 downto 0);
signal alures16 : std_logic_vector(63 downto 0);
signal alures8 : std_logic_vector(63 downto 0);
signal aluen1 : std_logic;
signal aluen2 : std_logic;
signal aluen3 : std_logic;
signal aluen4 : std_logic;
signal sel : std_logic_vector(1 downto 0);


begin



semnale: MainControl port map(instr(10 downto 9), sel, aluen1, aluen2, aluen3, aluen4);
rgistru: REG_FILE port map(clk,RD1, RD2, instr(2 downto 0), instr(5 downto 3), WD, instr(5 downto 3));

ALU64Biti: alu64 port map(RD1, RD2,aluen1,instr(8 downto 6), alures64);
ALU32Biti1: alu32 port map(RD1(63 downto 32), RD2(63 downto 32), aluen2, instr(8 downto 6), alures32_1);
ALU32Biti2: alu32 port map(RD1(31 downto 0), RD2(31 downto 0), aluen2, instr(8 downto 6), alures32_2);
alures32 <= alures32_1 & alures32_2;

ALU16Biti1: alu16 port map(RD1(63 downto 48), RD2(63 downto 48), aluen3, instr(8 downto 6), alures16_1);
ALU16Biti2: alu16 port map(RD1(47 downto 32), RD2(47 downto 32), aluen3, instr(8 downto 6), alures16_2);
ALU16Biti3: alu16 port map(RD1(31 downto 16), RD2(31 downto 16), aluen3, instr(8 downto 6), alures16_3);
ALU16Biti4: alu16 port map(RD1(15 downto 0), RD2(15 downto 0), aluen3, instr(8 downto 6), alures16_4);
alures16 <= alures16_1 & alures16_2 & alures16_3 & alures16_4;

ALU8Biti1: alu8 port map(RD1(63 downto 56), RD2(63 downto 56), aluen4, instr(8 downto 6), alures8_1);
ALU8Biti2: alu8 port map(RD1(55 downto 48), RD2(55 downto 48), aluen4, instr(8 downto 6), alures8_2);
ALU8Biti3: alu8 port map(RD1(47 downto 40), RD2(47 downto 40), aluen4, instr(8 downto 6), alures8_3);
ALU8Biti4: alu8 port map(RD1(39 downto 32), RD2(39 downto 32), aluen4, instr(8 downto 6), alures8_4);
ALU8Biti5: alu8 port map(RD1(31 downto 24), RD2(31 downto 24), aluen4, instr(8 downto 6), alures8_5);
ALU8Biti6: alu8 port map(RD1(23 downto 16), RD2(23 downto 16), aluen4, instr(8 downto 6), alures8_6);
ALU8Biti7: alu8 port map(RD1(15 downto 8), RD2(15 downto 8), aluen4, instr(8 downto 6), alures8_7);
ALU8Biti8: alu8 port map(RD1(7 downto 0), RD2(7 downto 0), aluen4, instr(8 downto 6), alures8_8);
alures8 <= alures8_1 & alures8_2 & alures8_3 & alures8_4 & alures8_5 & alures8_6 & alures8_7 & alures8_8; 

mux4to1: mux15_1 port map(WD, alures64, alures32, alures16, alures8,sel);
o <= WD;

end Behavioral;