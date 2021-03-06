--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:43:03 02/24/2015
-- Design Name:   
-- Module Name:   D:/UofC/Third Year/ENEL 453/lab 3/lab3_Hilborn_Kopp_prelab2/lab3_Hilborn_Kopp_bk_prelab/tb_bouncing_box.vhd
-- Project Name:  lab3_Hilborn_Kopp
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: bouncing_box
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_bouncing_box IS
END tb_bouncing_box;
 
ARCHITECTURE behavior OF tb_bouncing_box IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bouncing_box
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         scanlineX : IN  std_logic_vector(10 downto 0);
         scanlineY : IN  std_logic_vector(10 downto 0);
         kHz : IN  std_logic;
         red : OUT  std_logic_vector(2 downto 0);
         blue : OUT  std_logic_vector(1 downto 0);
         green : OUT  std_logic_vector(2 downto 0);
         boxcolor : IN  std_logic_vector(7 downto 0);
         boxWidth : IN  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal scanlineX : std_logic_vector(10 downto 0) := (others => '0');
   signal scanlineY : std_logic_vector(10 downto 0) := (others => '0');
   signal kHz : std_logic := '0';
   signal boxcolor : std_logic_vector(7 downto 0) := (others => '0');
   signal boxWidth : std_logic_vector(9 downto 0) := (others => '0');

 	--Outputs
   signal red : std_logic_vector(2 downto 0);
   signal blue : std_logic_vector(1 downto 0);
   signal green : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bouncing_box PORT MAP (
          clk => clk,
          reset => reset,
          scanlineX => scanlineX,
          scanlineY => scanlineY,
          kHz => kHz,
          red => red,
          blue => blue,
          green => green,
          boxcolor => boxcolor,
          boxWidth => boxWidth
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   
	khzclk_process :process
   begin
		khz <= '0';
		wait for clk_period*25000;
		khz <= '1';
		wait for clk_period*25000;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1';
      wait for 100 ns;	
		reset <= '0';

      wait for clk_period*10;

      -- insert stimulus here 
		boxWidth <= "0000000010";
		wait for 100 us;
		boxWidth <= "0000001010";

      wait;
   end process;
 
END;
