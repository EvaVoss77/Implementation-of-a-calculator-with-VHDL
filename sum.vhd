library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sum is
    generic(N: integer:=4); 
    port(
        x1, x2: in std_logic_vector(N-1 downto 0);    -- Input values
        g: out std_logic_vector(N downto 0)          -- Result to output
    );
end sum;

architecture tarea_sum of sum is
    signal mod1, mod2: unsigned(N-1 downto 0); -- Modulus of x1 and x2
    signal s1, s2: std_logic;        -- Signs of x1 and x2
    signal modulo: unsigned(N-1 downto 0); -- It will store the sum of the moduli
begin
    -- Separate the problem into modulus and sign
    s1 <= x1(N-1);
    s2 <= x2(N-1);
    
    mod1 <= unsigned('0' & x1(N-2 downto 0));
    mod2 <= unsigned('0' & x2(N-2 downto 0));
    
    -- Perform the corresponding operation based on the sign of x1 and x2
    modulo <= mod1 + mod2 when s1 = s2 else 
              mod1 - mod2 when mod1 > mod2 else
              mod2 - mod1;
    
    -- Convert to std_logic_vector and apply the corresponding sign
    g <= std_logic_vector(s1 & modulo) when s1 = s2 else
         std_logic_vector(s1 & modulo) when mod1 > mod2 else
         std_logic_vector(s2 & modulo);

end tarea_sum;