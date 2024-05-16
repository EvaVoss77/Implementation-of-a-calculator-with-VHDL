library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparador is
    generic(N: integer:=4); 
    port(
        x1, x2: in std_logic_vector(N-1 downto 0);   -- Input values
        g: out std_logic_vector(N downto 0)          -- Result to output
    );
end comparador;

architecture tarea_comp of comparador is
    signal cero: std_logic_vector(N downto 0):= (others =>'0'); -- Vector of zeros
begin
    
    -- Perform comparison of each bit
    g <= cero when x1=x2 else        
          not(cero);

end tarea_comp;
