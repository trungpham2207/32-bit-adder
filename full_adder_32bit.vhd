library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder_32bit is
	port(
	A:	in std_logic_vector (31 downto 0);
	B: 	in std_logic_vector (31 downto 0);
	C_in:	in std_logic;
	C_out:	out std_logic;
	SUM:	out std_logic_vector (31 downto 0)
	    );
    end full_adder_32bit;
architecture structure of full_adder_32bit is
	-- using 8 adder_4bit
	component adder_4bit
		port(
		A:	in std_logic_vector (3 downto 0);
		B:	in std_logic_vector (3 downto 0);
		C_in: 	in std_logic;
		C_out:	out std_logic;
		SUM:	out std_logic_vector (3 downto 0);
		GG:	out std_logic;
		PG:	out std_logic
		    );
	end component;

	-- internal signal
	signal c: 	std_logic_vector (8 downto 0);
	signal gg,pg:	std_logic_vector (7 downto 0);
	signal TGo4,TPo4:	std_logic_vector (1 downto 0);
	
begin
	gen_adder: for i in 0 to 7 generate
		blk: adder_4bit port map(
		A 	=> A (4*i+3 downto 4*i),
		B 	=> B (4*i+3 downto 4*i),
		SUM 	=> SUM (4*i+3 downto 4*i),
		C_in	=> c(i),
		C_out	=> open,
		GG 	=> gg(i),
	       	PG	=> pg(i)	
		);		   
	end generate;

	-- carry in of block 0
	c(0) <= C_in; 
	-- carry in of block 1
	c(1) <= gg(0) or (pg(0) and c(0)); 	
	-- carry in of block 2
	c(2) <= gg(1) or (pg(1) and gg(0)) or (pg(1) and pg(0) and c(0));
	-- carry in of block 3
	c(3) <= gg(2) or (pg(2) and gg(1)) or (pg(2) and pg(1) and gg(0)) or (pg(2) and pg(1) and pg(0) and c(0));

	-- level 2: total propagation and generation of 4 4-bit-adder blocks
	TGo4(0) <= gg(3) or (pg(3) and gg(2)) or (pg(3) and pg(2) and gg(1)) or (pg(3) and pg(2) and pg(1) and gg(0));
	TPo4(0) <= pg(3) and pg(2) and pg(1) and pg(0);
	
	TGo4(1) <= gg(7) or (pg(7) and gg(6)) or (pg(7) and pg(6) and gg(5)) or (pg(7) and pg(6) and pg(5) and gg(4));
	TPo4(1) <= pg(7) and pg(6) and pg(5) and pg(4);

	-- carry in of block 4
	c(4) <= TGo4(0) or (TPo4(0) and c(0));
	-- carry in of block 5
	c(5) <= gg(4) or (pg(4) and c(4));
	-- carry in of block 6
	c(6) <= gg(5) or (pg(5) and gg(4)) or (pg(5) and pg(4) and c(4));
	-- carry in of block 7
	c(7) <= gg(6) or (pg(6) and gg(5)) or (pg(6) and pg(5) and gg(4)) or (pg(6) and pg(5) and pg(4) and c(4));

	-- total propagation and generation of 8 4-bit-adder blocks
	C_out <= TGo4(1) or (TPo4(1) and TGo4(0)) or (TPo4(1) and TPo4(0) and C_in); 
end structure;

