library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seleccion is
    generic(N: integer :=4);
    port(
        c1, c2: in std_logic;
        e_mult: in std_logic;
        g_sum, g_rest, g_mult, g_comp: in std_logic_vector(N downto 0);
        g: out std_logic_vector(N downto 0);
        error: out std_logic
    );
end seleccion;

architecture Behavioral of seleccion is
    signal cont: std_logic_vector(1 downto 0); -- Control signal to select output
begin
    
    -- Select the final result based on the values of c1 and c2 
    cont(1) <= c1;
    cont(0) <= c2;
    
    -- Assign output g based on control signal
    g <= g_sum when cont = "00" else
         g_rest when cont = "01" else
         g_mult when cont = "10" else
         g_comp;
         
    -- Assign error output based on control signal
    error <= e_mult when cont = "10" else
             '0';

end Behavioral;