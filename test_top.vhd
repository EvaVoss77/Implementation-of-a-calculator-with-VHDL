LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
 
ENTITY test_top IS
END test_top;
 
ARCHITECTURE behavior OF test_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TP
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         cont1 : IN  std_logic;
         cont2 : IN  std_logic;
         f : OUT  std_logic_vector(4 downto 0);
         error : OUT  std_logic
        );
    END COMPONENT;
    

   -- Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal cont1 : std_logic := '0';
   signal cont2 : std_logic := '0';

   -- Outputs
   signal f : std_logic_vector(4 downto 0);
   signal error : std_logic;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
   uut: TP PORT MAP (
          a => a,
          b => b,
          cont1 => cont1,
          cont2 => cont2,
          f => f,
          error => error
        );


   -- Stimulus process
   stim_proc: process
   begin      
      -- Test cases
      -- 5 + 2
      a <= "0101";
      b <= "0010";
      cont1 <= '0';
      cont2 <= '0';
      wait for 1 ns;
      assert f = "00111" report "Failed test case: 5 + 2" severity failure;
      
      -- 4 - 5
      a <= "0100";
      b <= "0101";
      cont1 <= '0';
      cont2 <= '1';
      wait for 1 ns;
      assert f = "10001" report "Failed test case: 4 - 5" severity failure;
      
      -- (-2) * 3
      a <= "1010";
      b <= "0011";
      cont1 <= '0';
      cont2 <= '1';
      wait for 1 ns;
      assert f = "10101" report "Failed test case: (-2) * 3" severity failure;
      
      -- 3 * 2
      a <= "0011";
      b <= "0010";
      cont1 <= '1';
      cont2 <= '0';
      wait for 1 ns;
      assert f = "00110" report "Failed test case: 3 * 2" severity failure;
      
      -- (-4) * (-3)
      a <= "1100";
      b <= "1011";
      cont1 <= '1';
      cont2 <= '0';
      wait for 1 ns;
      assert f = "01100" report "Failed test case: (-4) * (-3)" severity failure;
      
      -- 1 = 7
      a <= "0001";
      b <= "0111";
      cont1 <= '1';
      cont2 <= '1';
      wait for 1 ns;
      assert f = "11111" report "Failed test case: 1 = 7" severity failure;
      
      -- 6 = 6
      a <= "0110";
      b <= "0110";
      cont1 <= '1';
      cont2 <= '1';
      wait for 1 ns;
      assert f = "00000" report "Failed test case: 6 = 6" severity failure;
      
      -- 7 * 4
      a <= "0111";
      b <= "0100";
      cont1 <= '1';
      cont2 <= '0';
      wait for 1 ns;
      assert f = "01100" report "Failed test case: 7 * 4" severity failure;
   end process;
END;