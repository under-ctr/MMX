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

entity adder_16bits is
      Port (    A : in STD_LOGIC_VECTOR (15 downto 0);
                B : in STD_LOGIC_VECTOR (15 downto 0);
                Cin : in STD_LOGIC;
                S : out STD_LOGIC_VECTOR (15 downto 0);
                Cout : out STD_LOGIC
 );
end adder_16bits;

architecture Behavioral of adder_16bits is
component adder  is
      port(   A:in std_logic;    
          B:in std_logic;
          Cin:in std_logic; 
          sum: out std_logic;
          Cout: out std_logic);
end component;


signal c1,c2,c3,c4,c5,c6,c7,c0: STD_LOGIC;
signal c8,c9,c10,c11,c12,c13,c14,c15: STD_LOGIC;
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
M16: adder port map( A(15), B(15), c15, S(15), c0);

end Behavioral;
