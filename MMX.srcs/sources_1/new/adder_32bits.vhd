----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/11/2021 05:25:13 PM
-- Design Name: 
-- Module Name: adder_8bits - Behavioral
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

entity adder_32bits is
      Port (    A : in STD_LOGIC_VECTOR (31 downto 0);
                B : in STD_LOGIC_VECTOR (31 downto 0);
                Cin : in STD_LOGIC;
                S : out STD_LOGIC_VECTOR (31 downto 0);
                Cout : out STD_LOGIC
 );
end adder_32bits;

architecture Behavioral of adder_32bits is
component adder  is
      port(   A:in std_logic;    
          B:in std_logic;
          Cin:in std_logic; 
          sum: out std_logic;
          Cout: out std_logic);
end component;


signal c1,c2,c3,c4,c5,c6,c7,c0: STD_LOGIC;
signal c8,c9,c10,c11,c12,c13,c14,c15: STD_LOGIC;
signal c16,c17,c18,c19,c20,c21,c22,c23: STD_LOGIC;
signal c24,c25,c26,c31,c27,c28,c29,c30: STD_LOGIC;
signal Si : std_logic_vector(15 downto 0);
--signal op:  std_logic_vector(7 downto 0);
--signal aux:  std_logic_vector(7 downto 0);

begin

--Add: adder_8bits port map(A(15 downto 8), B(15 downto 8), c0,Si(15 downto 8), c1); 
--Add2: adder_8bits port map(A(7 downto 0), B(7 downto 0), '0',Si(7 downto 0), c0);   
M1: adder port map( A(0), B(0), Cin,S(0), c1);
M2: adder port map( A(1), B(1), c1, S(1), c2);
M3: adder port map( A(2), B(2), c2, S(2), c3);
M4: adder port map( A(3), B(3), c3, S(3), c4);
M5: adder port map( A(4), B(4), c4, S(4), c5);
M6: adder port map( A(5), B(5), c5, S(5), c6);
M7: adder port map( A(6), B(6), c6, S(6), c7);
M8: adder port map( A(7), B(7), c7, S(7), c8);   
M9: adder port map( A(8), B(8), c8,S(8), c9);
M10: adder port map( A(9), B(9), c9, S(9), c10);
M11: adder port map( A(10), B(10), c10, S(10), c11);
M12: adder port map( A(11), B(11), c11, S(11), c12);
M13: adder port map( A(12), B(12), c12, S(12), c13);
M14: adder port map( A(13), B(13), c13, S(13), c14);
M15: adder port map( A(14), B(14), c14, S(14), c15);
M16: adder port map( A(15), B(15), c15, S(15), c16);
M17: adder port map( A(16), B(16), c16,S(16), c17);
M18: adder port map( A(17), B(17), c17, S(17), c18);
M19: adder port map( A(18), B(18), c18, S(18), c19);
M20: adder port map( A(19), B(19), c19, S(19), c20);
M21: adder port map( A(20), B(20), c20, S(20), c21);
M22: adder port map( A(21), B(21), c21, S(21), c22);
M23: adder port map( A(22), B(22), c22, S(22), c23);
M24: adder port map( A(23), B(23), c23, S(23), c24);   
M25: adder port map( A(24), B(24), c24,S(24), c25);
M26: adder port map( A(25), B(25), c25, S(25), c26);
M27: adder port map( A(26), B(26), c26, S(26), c27);
M28: adder port map( A(27), B(27), c27, S(27), c28);
M29: adder port map( A(28), B(28), c28, S(28), c29);
M30: adder port map( A(29), B(29), c29, S(29), c30);
M31: adder port map( A(30), B(30), c30, S(30), c31);
M32: adder port map( A(31), B(31), c31, S(31), c0);

end Behavioral;
