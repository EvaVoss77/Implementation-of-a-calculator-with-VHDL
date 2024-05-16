library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TP is
    generic(N: integer:=4); 
    port(
        a, b: in std_logic_vector(N-1 downto 0);  -- Input values 
        cont1, cont2: in std_logic;                -- Control signals defining the operation
        f: out std_logic_vector(N downto 0);       -- Result output
        error: out std_logic                       -- Error indicator
    );
end TP;

architecture top of TP is
    signal g_sum, g_rest, g_mult, g_comp: std_logic_vector(N downto 0);
    signal e_mult: std_logic;
begin

    -- Perform all operations

    suma: entity work.sum(tarea_sum)
        port map(x1=>a , x2=>b, g=>g_sum);

    rest: entity work.resta(Behavioral)  -- Adjusted from tarea_rest
        port map(x1=>a , x2=>b, g=>g_rest);

    mult: entity work.multiplicador(Behavioral)  -- Adjusted from tarea_mult
              port map(x1=>a , x2=>b, g=>g_mult, e=>e_mult);
        
    comp: entity work.comparador(Behavioral)  -- Adjusted from tarea_comp
        port map(x1=>a , x2=>b, g=>g_comp);

    -- Selection block 
    selec: entity work.seleccion(Behavioral)
        port map(c1=>cont1, c2=>cont2, g=>f, e_mult=>e_mult, error=>error,
        g_sum=>g_sum, g_rest=>g_rest, g_mult=>g_mult, g_comp=>g_comp);

end top;