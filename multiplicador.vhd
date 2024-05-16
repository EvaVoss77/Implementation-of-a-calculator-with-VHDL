library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
--use UNISIM.VComponents.all;

entity multiplicador is
    generic (N: integer := 4);
    port(
        x1, x2: in std_logic_vector(N-1 downto 0);
        g: out std_logic_vector(N downto 0);
        e: out std_logic
    );
end multiplicador;

architecture tarea_mult of multiplicador is
    signal mod1, mod2: unsigned(N-1 downto 0); -- Modulus of x1 and x2
    signal s1, s2: std_logic;        -- Signs of x1 and x2
    signal modulo: std_logic_vector(2*N-1 downto 0); -- It will store the sum of the moduli
    signal error: std_logic;
begin
    s1 <= x1(N-1);
    s2 <= x2(N-1);
    
    mod1 <= unsigned('0' & x1(N-2 downto 0));
    mod2 <= unsigned('0' & x2(N-2 downto 0));
    
    modulo <= std_logic_vector(mod2 * mod1);
    
    -- Determine error
    error <= '1' when unsigned(modulo(2*N-1 downto N+1)) /= "0000" else
                '0';

    -- Set output g based on signs
    g <= ('0' & modulo(N downto 1)) when s1=s2 else 
          ('1' & modulo(N downto 1));
          
    -- Set output e based on error
    e <= '1' when unsigned(modulo(2*N-1 downto N+1)) /= "000" else
            '0';

end tarea_mult;