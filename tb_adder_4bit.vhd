library ieee;
use ieee.std_logic_1164.all;

entity tb_adder_4bit is
	end tb_adder_4bit;
architecture behavior of tb_adder_4bit is
	component adder_4bit
		port(
		A:	in std_logic_vector (3 downto 0);
		B:	in std_logic_vector (3 downto 0);
		C_in:	in std_logic;
		C_out:	out std_logic;
		SUM:	out std_logic_vector (3 downto 0)
		    );
end component;

signal a:	std_logic_vector (3 downto 0);
signal b:	std_logic_vector (3 downto 0);
signal c_in:	std_logic := '0';
signal c_out: 	std_logic;
signal sum:	std_logic_vector (3 downto 0);

begin
	dut: adder_4bit
	port map(
	A => a,
	B => b,
	C_in => c_in,
	C_out => c_out,
	SUM => sum
		);
adder_proc: process
begin
	-- A + B = 10 + 2, Cin = 0
	a <= "1010";
	b <= "0010";
	c_in <= '0';
	wait for 10 ns;

	-- A + B = 10 +2, Cin = 1
	a <= "1010";
	b <= "0010";
	c_in <= '1';
	wait for 10 ns;

	-- A + B = 10 + 5, Cin = 0
	a <= "1010";
	b <= "0101";
	c_in <= '0';
	wait for 10 ns;

	-- A + B = 10 + 5, Cin =1
	a <= "1010";
	b <= "0101";
	c_in <= '1';
	wait for 10 ns;

	wait;
end process;
end behavior;

