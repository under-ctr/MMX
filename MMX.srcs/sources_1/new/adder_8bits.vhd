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

entity adder_8bits is
      Port (    A : in STD_LOGIC_VECTOR (7 downto 0);
                B : in STD_LOGIC_VECTOR (7 downto 0);
                Cin : in STD_LOGIC;
                S : out STD_LOGIC_VECTOR (7 downto 0);
                Cout : out STD_LOGIC
 );
end adder_8bits;

architecture Behavioral of adder_8bits is
component adder is
    port(   A:in std_logic;    
            B:in std_logic;
            Cin:in std_logic; 
            sum: out std_logic;
            Cout: out std_logic);
end component;


signal c1,c2,c3,c4,c5,c6,c7,c0: STD_LOGIC;


begin


M1: adder port map( A(0), B(0), Cin,S(0), c1);
M2: adder port map( A(1), B(1), c1, S(1), c2);
M3: adder port map( A(2), B(2), c2, S(2), c3);
M4: adder port map( A(3), B(3), c3, S(3), c4);
M5: adder port map( A(4), B(4), c4, S(4), c5);
M6: adder port map( A(5), B(5), c5, S(5), c6);
M7: adder port map( A(6), B(6), c6, S(6), c7);
M8: adder port map( A(7), B(7), c7, S(7), c0);   


end Behavioral;
