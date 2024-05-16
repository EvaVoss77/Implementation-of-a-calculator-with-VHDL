LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- USE ieee.numeric_std.ALL;
 
ENTITY test_multiplicador IS
END test_multiplicador;
 
ARCHITECTURE behavior OF test_multiplicador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplicador
    PORT(
         x1 : IN  std_logic_vector(3 downto 0);
         x2 : IN  std_logic_vector(3 downto 0);
         g : OUT  std_logic_vector(4 downto 0);
         e : OUT  std_logic  -- Added missing port declaration
        );
    END COMPONENT;
    

   -- Inputs
   signal x1 : std_logic_vector(3 downto 0) := (others => '0');
   signal x2 : std_logic_vector(3 downto 0) := (others => '0');

   -- Outputs
   signal g : std_logic_vector(4 downto 0);
   signal e : std_logic;  -- Added missing signal declaration

BEGIN
 
    -- Instantiate the Unit Under Test (UUT)
   uut: multiplicador PORT MAP (
          x1 => x1,
          x2 => x2,
          g => g,
          e => e  -- Added missing port association
        );

   -- Stimulus process
   stim_proc: process
   begin      
        -- 5*2
        -- 1) generate test vector and stimulate the design
        x1 <= "0111"; -- = 7
        x2 <= "0010"; -- = 2
                         --   14
        -- 2) wait for propagation time 
        wait for 1 ns;
        -- 3) The monitor checks if the output is correct
        assert g = "01110" report "Output is incorrect" severity failure;
   end process;

END;