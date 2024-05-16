--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:37:42 08/23/2022
-- Design Name:   
-- Module Name:   Z:/TP/test_sum.vhd
-- Project Name:  TP
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sum
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
-- USE ieee.numeric_std.ALL;
 
ENTITY test_sum IS
END test_sum;
 
ARCHITECTURE behavior OF test_sum IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sum
    PORT(
         x1 : IN  std_logic_vector(3 downto 0);
         x2 : IN  std_logic_vector(3 downto 0);
         g : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   -- Inputs
   signal x1 : std_logic_vector(3 downto 0) := (others => '0');
   signal x2 : std_logic_vector(3 downto 0) := (others => '0');

   -- Outputs
   signal g : std_logic_vector(4 downto 0);

BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: sum PORT MAP (
          x1 => x1,
          x2 => x2,
          g => g
        );

   -- Stimulus process
   stim_proc: process
   begin      
        -- 5+2
        -- 1) generate test vector and stimulate the design
        x1 <= "1101";  -- = 13
        x2 <= "1111";  -- = -1

        -- 2) wait for propagation time 
        wait for 1 ns;

        -- 3) The monitor checks if the output is correct
        assert g = "00111" report "Output is incorrect" severity failure;
   end process;

END;