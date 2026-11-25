library ieee;
use ieee.std_logic_1164.all;

entity adder_4bit is
	port(
	A:	in std_logic_vector (3 downto 0);
	B: 	in std_logic_vector (3 downto 0);
	C_in:	in std_logic;
	C_out:	out std_logic;
	SUM:	out std_logic_vector (3 downto 0);
	GG:  	out std_logic;
	PG:	out std_logic
	    );
    end adder_4bit;

architecture structure of adder_4bit is
	signal G:	std_logic_vector (4 downto 1);
	signal P:	std_logic_vector (4 downto 1);
	signal Ci:	std_logic_vector (4 downto 1);
	signal Co:	std_logic_vector (4 downto 1);

begin
-- for propagation and generation
	G(1) <= A(0) and B(0);
	P(1) <= A(0) or B(0);

	G(2) <= A(1) and B(1);
	P(2) <= A(1) or B(1);

	G(3) <= A(2) and B(2);
	P(3) <= A(2) or B(2);

	G(4) <= A(3) and B(3);
	P(4) <= A(3) or B(3);

	-- for Carry Calculatio
	Ci(1) <= C_in;

	Co(1) <= G(1) or (P(1) and Ci(1));

	Co(2) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and Ci(1));

	Co(3) <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and Ci(1));

	Co(4) <= G(4) or (P(4) and G(3)) or (P(4) and P(3) and G(2)) or (P(4) and P(3) and P(2) and G(1)) or (P(4) and P(3) and P(2) and P(1) and Ci(1));

	-- total propagation and generation of group
	GG <= G(4) or (P(4) and G(3)) or (P(4) and P(3) and G(2)) or (P(4) and P(3) and P(2) and G(1));

	PG <= P(4) and P(3) and P(2) and P(1);

	-- for sum and total Carry out
	SUM(0) <= A(0) xor B(0) xor Ci(1);
	SUM(1) <= A(1) xor B(1) xor Co(1);
	SUM(2) <= A(2) xor B(2) xor Co(2);
	SUM(3) <= A(3) xor B(3) xor Co(3);
	C_out <= Co(4);

end structure;
