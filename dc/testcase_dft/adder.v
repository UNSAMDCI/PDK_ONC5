module adder(a, b, cin, clk, s, cout);
`define WIDTH 64

	input	[`WIDTH-1:0] 	a, b;
	input			cin, clk;
	output	[`WIDTH-1:0]	s;
	output			cout;

	reg	[`WIDTH-1:0]	a0, b0;
	reg			cin0;
	reg	[`WIDTH-1:0]	s;
	reg			cout;

	wire	[`WIDTH-1:0]	a, b, s0;
	wire			cin, cout0;

	assign {cout0, s0} = a + b + cin;

always @ (posedge clk)
begin
	a0 <= a;
	b0 <= b;
	cin0 <= cin;
	s <= s0;
	cout <= cout0;
end

endmodule