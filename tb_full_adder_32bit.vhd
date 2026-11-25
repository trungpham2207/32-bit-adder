library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_full_adder_32bit is
	end tb_full_adder_32bit;

architecture behavior of tb_full_adder_32bit is 
	component full_adder_32bit
		port(
		A: 	in std_logic_vector (31 downto 0);
		B: 	in std_logic_vector (31 downto 0);
		C_in:	in std_logic;
		C_out: 	out std_logic;
		SUM: 	out std_logic_vector (31 downto 0)
		    );
	end component;

	signal a,b,sum:	std_logic_vector (31 downto 0);
	signal c_in,c_out:	std_logic;

begin
	dut: full_adder_32bit
	port map(
	A	=> a,
	B	=> b,
	C_in	=> c_in,
	C_out	=> c_out,
	SUM	=> sum
		);
		
	adder_proc: process
	begin
	-- test the propagation function
		a <= x"55555555"; b <= x"AAAAAAAA"; c_in <= '0';
		wait for 10 ns;

		a <= x"55555555"; b <= x"AAAAAAAA"; c_in <= '1';
		wait for 10 ns;

	-- test the generation function
		a <= x"AAAAAAAA"; b <= x"AAAAAAAA"; c_in <= '0';
		wait for 10 ns;

		a <= x"AAAAAAAA"; b <= x"AAAAAAAA"; c_in <= '1';
		wait for 10 ns;

	-- test the case when the sum exceed the FFFFFFFF
		a <= x"00000001"; b <= x"FFFFFFFE"; c_in <= '0';
		wait for 10 ns;

		a <= x"00000001"; b <= x"FFFFFFFE"; c_in <= '1';
		wait for 10 ns;

		wait;
		
	end process;
end behavior;

