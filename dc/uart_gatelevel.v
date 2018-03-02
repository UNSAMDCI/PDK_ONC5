/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP4-1
// Date      : Fri Jul 14 18:04:38 2017
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_uart_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  LSGCPX3 latch ( .CLK(CLK), .E(EN), .SE(TE), .GCLK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_uart_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  LSGCPX3 latch ( .CLK(CLK), .E(EN), .SE(TE), .GCLK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_uart_2 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  LSGCPX3 latch ( .CLK(CLK), .E(EN), .SE(TE), .GCLK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_uart_3 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  LSGCPX3 latch ( .CLK(CLK), .E(EN), .SE(TE), .GCLK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_uart_4 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  LSGCPX3 latch ( .CLK(CLK), .E(EN), .SE(TE), .GCLK(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_uart_5 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  LSGCPX3 latch ( .CLK(CLK), .E(EN), .SE(TE), .GCLK(ENCLK) );
endmodule


module uart ( clk, rst, rx, tx, transmit, tx_byte, received, rx_byte, 
        is_receiving, is_transmitting, recv_error );
  input [7:0] tx_byte;
  output [7:0] rx_byte;
  input clk, rst, rx, transmit;
  output tx, received, is_receiving, is_transmitting, recv_error;
  wire   n425, n427, n428, n429, n430, n431, n432, n433, n434, N203, N204,
         N205, N206, N207, N208, N209, N210, N211, N212, N213, N221, N226,
         N291, N292, N293, N294, N295, N296, N297, N298, N299, N300, N301,
         net145, net146, net151, net156, net161, net166, net171, n126, n127,
         n128, n130, n131, n138, n141, n142, n145, n426, n160, n162, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357, n358, n359, n360, n361, n362,
         n363, n364, n365, n366, n367, n368, n369, n370, n371, n372, n373,
         n374, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424;
  wire   [2:0] recv_state;
  wire   [1:0] tx_state;
  wire   [3:0] tx_bits_remaining;
  wire   [7:0] tx_data;
  wire   [10:0] rx_clk_divider;
  wire   [10:0] tx_clk_divider;
  wire   [5:0] rx_countdown;
  wire   [5:0] tx_countdown;
  wire   [3:0] rx_bits_remaining;

  SNPS_CLOCK_GATE_HIGH_uart_0 clk_gate_tx_countdown_reg ( .CLK(clk), .EN(n131), 
        .ENCLK(net145), .TE(net146) );
  SNPS_CLOCK_GATE_HIGH_uart_5 clk_gate_rx_countdown_reg ( .CLK(clk), .EN(n142), 
        .ENCLK(net151), .TE(net146) );
  SNPS_CLOCK_GATE_HIGH_uart_4 clk_gate_tx_bits_remaining_reg ( .CLK(clk), .EN(
        n130), .ENCLK(net156), .TE(net146) );
  SNPS_CLOCK_GATE_HIGH_uart_3 clk_gate_rx_bits_remaining_reg ( .CLK(clk), .EN(
        N221), .ENCLK(net161), .TE(net146) );
  SNPS_CLOCK_GATE_HIGH_uart_2 clk_gate_rx_data_reg ( .CLK(clk), .EN(N226), 
        .ENCLK(net166), .TE(net146) );
  SNPS_CLOCK_GATE_HIGH_uart_1 clk_gate_recv_state_reg ( .CLK(clk), .EN(n138), 
        .ENCLK(net171), .TE(net146) );
  DFRQX1 \recv_state_reg[0]  ( .D(n424), .ICLK(net171), .Q(recv_state[0]) );
  DFRQX1 \rx_countdown_reg[5]  ( .D(n406), .ICLK(net151), .Q(rx_countdown[5])
         );
  DFRQX1 \recv_state_reg[1]  ( .D(n423), .ICLK(net171), .Q(recv_state[1]) );
  DFRQX1 \recv_state_reg[2]  ( .D(n141), .ICLK(net171), .Q(recv_state[2]) );
  DFRQX1 \rx_countdown_reg[4]  ( .D(n405), .ICLK(net151), .Q(rx_countdown[4])
         );
  DFRQX1 \rx_countdown_reg[3]  ( .D(n404), .ICLK(net151), .Q(rx_countdown[3])
         );
  DFRQX1 \rx_countdown_reg[0]  ( .D(n403), .ICLK(net151), .Q(rx_countdown[0])
         );
  DFRQX1 \rx_data_reg[7]  ( .D(rx), .ICLK(net166), .Q(n427) );
  DFRQX1 \rx_data_reg[6]  ( .D(n427), .ICLK(net166), .Q(n428) );
  DFRQX1 \rx_data_reg[5]  ( .D(n428), .ICLK(net166), .Q(n429) );
  DFRQX1 \rx_data_reg[4]  ( .D(n429), .ICLK(net166), .Q(n430) );
  DFRQX1 \rx_data_reg[3]  ( .D(n430), .ICLK(net166), .Q(n431) );
  DFRQX1 \rx_data_reg[2]  ( .D(n431), .ICLK(net166), .Q(n432) );
  DFRQX1 \rx_data_reg[1]  ( .D(n432), .ICLK(net166), .Q(n433) );
  DFRQX1 \rx_data_reg[0]  ( .D(n433), .ICLK(net166), .Q(n434) );
  DFRQX1 \rx_bits_remaining_reg[0]  ( .D(n422), .ICLK(net161), .Q(
        rx_bits_remaining[0]) );
  DFRQX1 \rx_bits_remaining_reg[1]  ( .D(n421), .ICLK(net161), .Q(
        rx_bits_remaining[1]) );
  DFRQX1 \rx_bits_remaining_reg[2]  ( .D(n420), .ICLK(net161), .Q(
        rx_bits_remaining[2]) );
  DFRQX1 \rx_bits_remaining_reg[3]  ( .D(n419), .ICLK(net161), .Q(
        rx_bits_remaining[3]) );
  DFRQX1 \rx_countdown_reg[2]  ( .D(n145), .ICLK(net151), .Q(rx_countdown[2])
         );
  DFRQX1 \rx_countdown_reg[1]  ( .D(n402), .ICLK(net151), .Q(rx_countdown[1])
         );
  DFRQX1 \tx_state_reg[0]  ( .D(n128), .ICLK(clk), .Q(tx_state[0]) );
  DFRQX1 \tx_state_reg[1]  ( .D(n127), .ICLK(clk), .Q(tx_state[1]) );
  DFRQX1 \tx_clk_divider_reg[0]  ( .D(N291), .ICLK(clk), .Q(tx_clk_divider[0])
         );
  DFRQX1 \tx_clk_divider_reg[1]  ( .D(N292), .ICLK(clk), .Q(tx_clk_divider[1])
         );
  DFRQX1 \tx_clk_divider_reg[2]  ( .D(N293), .ICLK(clk), .Q(tx_clk_divider[2])
         );
  DFRQX1 \tx_clk_divider_reg[3]  ( .D(N294), .ICLK(clk), .Q(tx_clk_divider[3])
         );
  DFRQX1 \tx_clk_divider_reg[4]  ( .D(N295), .ICLK(clk), .Q(tx_clk_divider[4])
         );
  DFRQX1 \tx_clk_divider_reg[5]  ( .D(N296), .ICLK(clk), .Q(tx_clk_divider[5])
         );
  DFRQX1 \tx_clk_divider_reg[6]  ( .D(N297), .ICLK(clk), .Q(tx_clk_divider[6])
         );
  DFRQX1 \tx_clk_divider_reg[7]  ( .D(N298), .ICLK(clk), .Q(tx_clk_divider[7])
         );
  DFRQX1 \tx_clk_divider_reg[8]  ( .D(N299), .ICLK(clk), .Q(tx_clk_divider[8])
         );
  DFRQX1 \tx_clk_divider_reg[9]  ( .D(N300), .ICLK(clk), .Q(tx_clk_divider[9])
         );
  DFRQX1 \tx_clk_divider_reg[10]  ( .D(N301), .ICLK(clk), .Q(
        tx_clk_divider[10]) );
  DFRQX1 \tx_bits_remaining_reg[0]  ( .D(n418), .ICLK(net156), .Q(
        tx_bits_remaining[0]) );
  DFRQX1 \tx_bits_remaining_reg[1]  ( .D(n417), .ICLK(net156), .Q(
        tx_bits_remaining[1]) );
  DFRQX1 \tx_bits_remaining_reg[2]  ( .D(n416), .ICLK(net156), .Q(
        tx_bits_remaining[2]) );
  DFRQX1 \tx_bits_remaining_reg[3]  ( .D(n415), .ICLK(net156), .Q(
        tx_bits_remaining[3]) );
  DFRQX1 \tx_data_reg[7]  ( .D(n414), .ICLK(net156), .Q(tx_data[7]) );
  DFRQX1 \tx_data_reg[6]  ( .D(n413), .ICLK(net156), .Q(tx_data[6]) );
  DFRQX1 \tx_data_reg[5]  ( .D(n412), .ICLK(net156), .Q(tx_data[5]) );
  DFRQX1 \tx_data_reg[4]  ( .D(n411), .ICLK(net156), .Q(tx_data[4]) );
  DFRQX1 \tx_data_reg[3]  ( .D(n410), .ICLK(net156), .Q(tx_data[3]) );
  DFRQX1 \tx_data_reg[2]  ( .D(n409), .ICLK(net156), .Q(tx_data[2]) );
  DFRQX1 \tx_data_reg[1]  ( .D(n408), .ICLK(net156), .Q(tx_data[1]) );
  DFRQX1 \tx_data_reg[0]  ( .D(n407), .ICLK(net156), .Q(tx_data[0]) );
  DFRQX1 \tx_countdown_reg[2]  ( .D(n401), .ICLK(net145), .Q(tx_countdown[2])
         );
  DFRQX1 \tx_countdown_reg[0]  ( .D(n400), .ICLK(net145), .Q(tx_countdown[0])
         );
  DFRQX1 \tx_countdown_reg[1]  ( .D(n399), .ICLK(net145), .Q(tx_countdown[1])
         );
  DFRQX1 \tx_countdown_reg[3]  ( .D(n398), .ICLK(net145), .Q(tx_countdown[3])
         );
  DFRQX1 \tx_countdown_reg[4]  ( .D(n397), .ICLK(net145), .Q(tx_countdown[4])
         );
  DFRQX1 \tx_countdown_reg[5]  ( .D(n396), .ICLK(net145), .Q(tx_countdown[5])
         );
  DFRQX1 tx_out_reg ( .D(n126), .ICLK(clk), .Q(n425) );
  DFRQX1 \rx_clk_divider_reg[10]  ( .D(N213), .ICLK(clk), .Q(
        rx_clk_divider[10]) );
  DFRQX1 \rx_clk_divider_reg[9]  ( .D(N212), .ICLK(clk), .Q(rx_clk_divider[9])
         );
  DFRQX1 \rx_clk_divider_reg[8]  ( .D(N211), .ICLK(clk), .Q(rx_clk_divider[8])
         );
  DFRQX1 \rx_clk_divider_reg[7]  ( .D(N210), .ICLK(clk), .Q(rx_clk_divider[7])
         );
  DFRQX1 \rx_clk_divider_reg[6]  ( .D(N209), .ICLK(clk), .Q(rx_clk_divider[6])
         );
  DFRQX1 \rx_clk_divider_reg[5]  ( .D(N208), .ICLK(clk), .Q(rx_clk_divider[5])
         );
  DFRQX1 \rx_clk_divider_reg[4]  ( .D(N207), .ICLK(clk), .Q(rx_clk_divider[4])
         );
  DFRQX1 \rx_clk_divider_reg[3]  ( .D(N206), .ICLK(clk), .Q(rx_clk_divider[3])
         );
  DFRQX1 \rx_clk_divider_reg[2]  ( .D(N205), .ICLK(clk), .Q(rx_clk_divider[2])
         );
  DFRQX1 \rx_clk_divider_reg[1]  ( .D(N204), .ICLK(clk), .Q(rx_clk_divider[1])
         );
  DFRQX1 \rx_clk_divider_reg[0]  ( .D(N203), .ICLK(clk), .Q(rx_clk_divider[0])
         );
  INX1 U217 ( .IN(n433), .OUT(n393) );
  INX1 U218 ( .IN(n425), .OUT(n394) );
  INX1 U219 ( .IN(n427), .OUT(n387) );
  INX1 U220 ( .IN(n428), .OUT(n388) );
  INX1 U221 ( .IN(n429), .OUT(n389) );
  INX1 U222 ( .IN(n430), .OUT(n390) );
  INX1 U223 ( .IN(n431), .OUT(n391) );
  INX1 U224 ( .IN(n432), .OUT(n392) );
  INX1 U225 ( .IN(n230), .OUT(n386) );
  INX1 U226 ( .IN(n238), .OUT(n395) );
  INX8 U227 ( .IN(n393), .OUT(rx_byte[1]) );
  INX8 U228 ( .IN(n394), .OUT(tx) );
  INX8 U229 ( .IN(n387), .OUT(rx_byte[7]) );
  INX8 U230 ( .IN(n388), .OUT(rx_byte[6]) );
  INX8 U231 ( .IN(n389), .OUT(rx_byte[5]) );
  INX8 U232 ( .IN(n390), .OUT(rx_byte[4]) );
  INX8 U233 ( .IN(n391), .OUT(rx_byte[3]) );
  INX8 U234 ( .IN(n392), .OUT(rx_byte[2]) );
  INX8 U235 ( .IN(n386), .OUT(is_receiving) );
  INX8 U236 ( .IN(n395), .OUT(is_transmitting) );
  INX1 U237 ( .IN(n194), .OUT(n160) );
  NA3X1 U238 ( .A(recv_state[1]), .B(recv_state[2]), .C(n327), .OUT(n426) );
  INX8 U239 ( .IN(n426), .OUT(received) );
  INX1 U240 ( .IN(n434), .OUT(n162) );
  INX8 U241 ( .IN(n162), .OUT(rx_byte[0]) );
  LOGIC0 U242 ( .Q(net146) );
  INX1 U243 ( .IN(recv_state[1]), .OUT(n344) );
  OR2X1 U244 ( .A(n344), .B(rst), .OUT(n341) );
  INX1 U245 ( .IN(n341), .OUT(n350) );
  INX1 U246 ( .IN(rx_countdown[5]), .OUT(n164) );
  INX1 U247 ( .IN(rx_countdown[4]), .OUT(n166) );
  OR2X1 U248 ( .A(rx_countdown[1]), .B(rx_countdown[0]), .OUT(n329) );
  OR2X1 U249 ( .A(rx_countdown[2]), .B(n329), .OUT(n334) );
  NO2X1 U250 ( .A(rx_countdown[3]), .B(n334), .OUT(n165) );
  NA2X1 U251 ( .A(n166), .B(n165), .OUT(n168) );
  MU2IX1 U252 ( .IN0(n164), .IN1(rx_countdown[5]), .S(n168), .QN(n220) );
  MU2IX1 U253 ( .IN0(rx_countdown[4]), .IN1(n166), .S(n165), .QN(n222) );
  INX1 U254 ( .IN(rx_countdown[0]), .OUT(n233) );
  NO4X1 U255 ( .A(rx_countdown[3]), .B(rx_countdown[2]), .C(rx_countdown[1]), 
        .D(n233), .OUT(n167) );
  AND3X1 U256 ( .A(n220), .B(n222), .C(n167), .OUT(n193) );
  NO2X1 U257 ( .A(rx_countdown[5]), .B(n168), .OUT(n192) );
  INX1 U258 ( .IN(rst), .OUT(n358) );
  NA2X1 U259 ( .A(rx_clk_divider[8]), .B(n358), .OUT(n170) );
  NO2X1 U260 ( .A(rst), .B(rx_clk_divider[5]), .OUT(n175) );
  NO2X1 U261 ( .A(rst), .B(rx_clk_divider[3]), .OUT(n298) );
  OR2X1 U262 ( .A(rst), .B(rx_clk_divider[2]), .OUT(n183) );
  NO2X1 U263 ( .A(rx_clk_divider[0]), .B(rx_clk_divider[1]), .OUT(n169) );
  NO2X1 U264 ( .A(rst), .B(n169), .OUT(n182) );
  NO2X1 U265 ( .A(n183), .B(n182), .OUT(n297) );
  NA2X1 U266 ( .A(n298), .B(n297), .OUT(n300) );
  NO2X1 U267 ( .A(rx_clk_divider[4]), .B(n300), .OUT(n174) );
  NA2X1 U268 ( .A(n175), .B(n174), .OUT(n177) );
  OR2X1 U269 ( .A(rx_clk_divider[6]), .B(n177), .OUT(n171) );
  OR2X1 U270 ( .A(rx_clk_divider[7]), .B(n171), .OUT(n305) );
  MU2IX1 U271 ( .IN0(rx_clk_divider[8]), .IN1(n170), .S(n305), .QN(n307) );
  NA3X1 U272 ( .A(rx_clk_divider[7]), .B(n358), .C(n171), .OUT(n304) );
  OR2X1 U273 ( .A(rst), .B(rx_clk_divider[9]), .OUT(n186) );
  INX1 U274 ( .IN(n186), .OUT(n172) );
  OR2X1 U275 ( .A(rx_clk_divider[8]), .B(n305), .OUT(n185) );
  MU2IX1 U276 ( .IN0(n172), .IN1(n186), .S(n185), .QN(n308) );
  NA2X1 U277 ( .A(rx_clk_divider[1]), .B(n358), .OUT(n173) );
  AND2X1 U278 ( .A(rx_clk_divider[0]), .B(n358), .OUT(n293) );
  MU2IX1 U279 ( .IN0(n173), .IN1(rx_clk_divider[1]), .S(n293), .QN(n294) );
  INX1 U280 ( .IN(n175), .OUT(n176) );
  MU2IX1 U281 ( .IN0(n176), .IN1(n175), .S(n174), .QN(n302) );
  INX1 U282 ( .IN(rx_clk_divider[6]), .OUT(n179) );
  NO2X1 U283 ( .A(n179), .B(rst), .OUT(n178) );
  MU2IX1 U284 ( .IN0(n179), .IN1(n178), .S(n177), .QN(n303) );
  NA6X1 U285 ( .A(n304), .B(n308), .C(n298), .D(n294), .E(n302), .F(n303), 
        .OUT(n190) );
  INX1 U286 ( .IN(rx_clk_divider[4]), .OUT(n181) );
  NO2X1 U287 ( .A(n181), .B(rst), .OUT(n180) );
  MU2IX1 U288 ( .IN0(n181), .IN1(n180), .S(n300), .QN(n301) );
  INX1 U289 ( .IN(n183), .OUT(n184) );
  MU2IX1 U290 ( .IN0(n184), .IN1(n183), .S(n182), .QN(n296) );
  NA2X1 U291 ( .A(n358), .B(rx_clk_divider[10]), .OUT(n188) );
  NO2X1 U292 ( .A(n186), .B(n185), .OUT(n187) );
  HAX1 U293 ( .A(n188), .B(n187), .S(n309) );
  NA3X1 U294 ( .A(n301), .B(n296), .C(n309), .OUT(n189) );
  OR2X1 U295 ( .A(n190), .B(n189), .OUT(n191) );
  NO2X1 U296 ( .A(n307), .B(n191), .OUT(n224) );
  NA2X1 U297 ( .A(n224), .B(rx_clk_divider[0]), .OUT(n295) );
  MU2IX1 U298 ( .IN0(n193), .IN1(n192), .S(n295), .QN(n345) );
  INX1 U299 ( .IN(recv_state[2]), .OUT(n217) );
  NO2X1 U300 ( .A(rst), .B(n217), .OUT(n352) );
  NO2X1 U301 ( .A(n345), .B(n352), .OUT(n354) );
  INX1 U302 ( .IN(recv_state[0]), .OUT(n327) );
  NA3X1 U303 ( .A(n350), .B(n354), .C(n327), .OUT(n339) );
  INX1 U304 ( .IN(n339), .OUT(N226) );
  OR3X1 U305 ( .A(n327), .B(n217), .C(recv_state[1]), .OUT(n194) );
  INX8 U306 ( .IN(n194), .OUT(recv_error) );
  OR2X1 U307 ( .A(tx_state[1]), .B(tx_state[0]), .OUT(n238) );
  NA3X1 U308 ( .A(n344), .B(n327), .C(n217), .OUT(n230) );
  INX1 U309 ( .IN(rx), .OUT(n328) );
  INX1 U310 ( .IN(rx_bits_remaining[0]), .OUT(n203) );
  NO6X1 U311 ( .A(n203), .B(rx_bits_remaining[1]), .C(rx_bits_remaining[3]), 
        .D(n341), .E(rx_bits_remaining[2]), .F(recv_state[0]), .OUT(n195) );
  AO31X1 U312 ( .A(recv_state[1]), .B(recv_state[0]), .C(n328), .D(n195), 
        .OUT(n196) );
  NA2X1 U313 ( .A(n217), .B(n196), .OUT(n199) );
  NA2X1 U314 ( .A(n230), .B(n358), .OUT(n197) );
  NA2X1 U315 ( .A(n197), .B(n328), .OUT(n306) );
  OR2X1 U316 ( .A(n327), .B(rst), .OUT(n342) );
  NO2X1 U317 ( .A(recv_state[1]), .B(n342), .OUT(n343) );
  NA2X1 U318 ( .A(n343), .B(n217), .OUT(n330) );
  OR2X1 U319 ( .A(n330), .B(n328), .OUT(n198) );
  NA3X1 U320 ( .A(n199), .B(n306), .C(n198), .OUT(n424) );
  NA2X1 U321 ( .A(recv_state[0]), .B(n328), .OUT(n200) );
  NA3X1 U322 ( .A(n217), .B(n200), .C(n350), .OUT(n202) );
  OR2X1 U323 ( .A(rx), .B(n330), .OUT(n201) );
  NA2X1 U324 ( .A(n202), .B(n201), .OUT(n423) );
  MU2IX1 U325 ( .IN0(n203), .IN1(rx_bits_remaining[0]), .S(
        rx_bits_remaining[1]), .QN(n204) );
  NO2X1 U326 ( .A(n204), .B(n344), .OUT(n421) );
  OR2X1 U327 ( .A(rx_bits_remaining[0]), .B(rx_bits_remaining[1]), .OUT(n207)
         );
  INX1 U328 ( .IN(n207), .OUT(n205) );
  MU2IX1 U329 ( .IN0(n205), .IN1(n207), .S(rx_bits_remaining[2]), .QN(n206) );
  NO2X1 U330 ( .A(n206), .B(n344), .OUT(n420) );
  NO2X1 U331 ( .A(rx_bits_remaining[0]), .B(n344), .OUT(n422) );
  INX1 U332 ( .IN(rx_bits_remaining[3]), .OUT(n209) );
  NO2X1 U333 ( .A(rx_bits_remaining[2]), .B(n207), .OUT(n208) );
  MU2IX1 U334 ( .IN0(rx_bits_remaining[3]), .IN1(n209), .S(n208), .QN(n210) );
  NA2X1 U335 ( .A(recv_state[1]), .B(n210), .OUT(n419) );
  INX1 U336 ( .IN(tx_bits_remaining[0]), .OUT(n211) );
  MU2IX1 U337 ( .IN0(n211), .IN1(tx_bits_remaining[0]), .S(
        tx_bits_remaining[1]), .QN(n212) );
  NA2X1 U338 ( .A(tx_state[0]), .B(n358), .OUT(n379) );
  NO2X1 U339 ( .A(n212), .B(n379), .OUT(n417) );
  OR2X1 U340 ( .A(tx_bits_remaining[1]), .B(tx_bits_remaining[0]), .OUT(n215)
         );
  INX1 U341 ( .IN(n215), .OUT(n213) );
  MU2IX1 U342 ( .IN0(n213), .IN1(n215), .S(tx_bits_remaining[2]), .QN(n214) );
  NO2X1 U343 ( .A(n214), .B(n379), .OUT(n416) );
  NO2X1 U344 ( .A(tx_bits_remaining[0]), .B(n379), .OUT(n418) );
  OR2X1 U345 ( .A(tx_bits_remaining[2]), .B(n215), .OUT(n240) );
  NA2X1 U346 ( .A(tx_bits_remaining[3]), .B(n240), .OUT(n216) );
  INX1 U347 ( .IN(n379), .OUT(n371) );
  NA2X1 U348 ( .A(n216), .B(n371), .OUT(n415) );
  AND2X1 U349 ( .A(tx_byte[7]), .B(n379), .OUT(n414) );
  MU2X1 U350 ( .IN0(tx_byte[6]), .IN1(tx_data[7]), .S(n371), .Q(n413) );
  MU2X1 U351 ( .IN0(tx_byte[5]), .IN1(tx_data[6]), .S(n371), .Q(n412) );
  MU2X1 U352 ( .IN0(tx_byte[4]), .IN1(tx_data[5]), .S(n371), .Q(n411) );
  MU2X1 U353 ( .IN0(tx_byte[3]), .IN1(tx_data[4]), .S(n371), .Q(n410) );
  MU2X1 U354 ( .IN0(tx_byte[2]), .IN1(tx_data[3]), .S(n371), .Q(n409) );
  MU2X1 U355 ( .IN0(tx_byte[1]), .IN1(tx_data[2]), .S(n371), .Q(n408) );
  MU2X1 U356 ( .IN0(tx_byte[0]), .IN1(tx_data[1]), .S(n371), .Q(n407) );
  AN21X1 U357 ( .A(n217), .B(n328), .C(recv_state[0]), .OUT(n218) );
  NO2X1 U358 ( .A(recv_state[1]), .B(n218), .OUT(n223) );
  NA2X1 U359 ( .A(n330), .B(n223), .OUT(n219) );
  NA3X1 U360 ( .A(n219), .B(rx_clk_divider[0]), .C(n224), .OUT(n221) );
  NO2X1 U361 ( .A(n220), .B(n221), .OUT(n406) );
  NO2X1 U362 ( .A(n222), .B(n221), .OUT(n405) );
  NA2X1 U363 ( .A(recv_state[2]), .B(n343), .OUT(n229) );
  NA2I1X1 U364 ( .A(n343), .B(n223), .OUT(n227) );
  AND2X1 U365 ( .A(rx_clk_divider[0]), .B(n224), .OUT(n234) );
  INX1 U366 ( .IN(n334), .OUT(n225) );
  MU2IX1 U367 ( .IN0(n334), .IN1(n225), .S(rx_countdown[3]), .QN(n226) );
  NA3X1 U368 ( .A(n227), .B(n234), .C(n226), .OUT(n228) );
  NA2X1 U369 ( .A(n229), .B(n228), .OUT(n404) );
  OR2X1 U370 ( .A(n230), .B(rx), .OUT(n231) );
  NA3X1 U371 ( .A(n233), .B(n234), .C(n231), .OUT(n232) );
  NO2X1 U372 ( .A(n160), .B(n232), .OUT(n403) );
  MU2IX1 U373 ( .IN0(rx_countdown[0]), .IN1(n233), .S(rx_countdown[1]), .QN(
        n236) );
  NA3X1 U374 ( .A(recv_state[0]), .B(n341), .C(n330), .OUT(n235) );
  NA3X1 U375 ( .A(n236), .B(n235), .C(n234), .OUT(n237) );
  NA2X1 U376 ( .A(n237), .B(n306), .OUT(n402) );
  NA2X1 U377 ( .A(n358), .B(n238), .OUT(n239) );
  NA2X1 U378 ( .A(transmit), .B(n239), .OUT(n368) );
  NO2X1 U379 ( .A(tx_bits_remaining[3]), .B(n240), .OUT(n377) );
  NO2X1 U380 ( .A(n377), .B(n379), .OUT(n271) );
  INX1 U381 ( .IN(tx_state[1]), .OUT(n286) );
  OR2X1 U382 ( .A(tx_countdown[1]), .B(tx_countdown[0]), .OUT(n272) );
  OR2X1 U383 ( .A(tx_countdown[2]), .B(n272), .OUT(n267) );
  OR2X1 U384 ( .A(tx_countdown[3]), .B(n267), .OUT(n241) );
  NA2X1 U385 ( .A(tx_countdown[4]), .B(n241), .OUT(n290) );
  INX1 U386 ( .IN(tx_countdown[5]), .OUT(n242) );
  OR2X1 U387 ( .A(tx_countdown[4]), .B(n241), .OUT(n359) );
  MU2IX1 U388 ( .IN0(n242), .IN1(tx_countdown[5]), .S(n359), .QN(n292) );
  AND2X1 U389 ( .A(tx_countdown[0]), .B(n292), .OUT(n363) );
  NA2X1 U390 ( .A(tx_clk_divider[8]), .B(n358), .OUT(n244) );
  NO2X1 U391 ( .A(rst), .B(tx_clk_divider[5]), .OUT(n249) );
  NO2X1 U392 ( .A(rst), .B(tx_clk_divider[3]), .OUT(n315) );
  OR2X1 U393 ( .A(rst), .B(tx_clk_divider[2]), .OUT(n257) );
  NO2X1 U394 ( .A(tx_clk_divider[0]), .B(tx_clk_divider[1]), .OUT(n243) );
  NO2X1 U395 ( .A(rst), .B(n243), .OUT(n256) );
  NO2X1 U396 ( .A(n257), .B(n256), .OUT(n314) );
  NA2X1 U397 ( .A(n315), .B(n314), .OUT(n317) );
  NO2X1 U398 ( .A(tx_clk_divider[4]), .B(n317), .OUT(n248) );
  NA2X1 U399 ( .A(n249), .B(n248), .OUT(n251) );
  OR2X1 U400 ( .A(tx_clk_divider[6]), .B(n251), .OUT(n245) );
  OR2X1 U401 ( .A(tx_clk_divider[7]), .B(n245), .OUT(n322) );
  MU2IX1 U402 ( .IN0(tx_clk_divider[8]), .IN1(n244), .S(n322), .QN(n323) );
  NA3X1 U403 ( .A(tx_clk_divider[7]), .B(n358), .C(n245), .OUT(n321) );
  OR2X1 U404 ( .A(rst), .B(tx_clk_divider[9]), .OUT(n260) );
  INX1 U405 ( .IN(n260), .OUT(n246) );
  OR2X1 U406 ( .A(tx_clk_divider[8]), .B(n322), .OUT(n259) );
  MU2IX1 U407 ( .IN0(n246), .IN1(n260), .S(n259), .QN(n324) );
  NA2X1 U408 ( .A(tx_clk_divider[1]), .B(n358), .OUT(n247) );
  AND2X1 U409 ( .A(tx_clk_divider[0]), .B(n358), .OUT(n311) );
  MU2IX1 U410 ( .IN0(n247), .IN1(tx_clk_divider[1]), .S(n311), .QN(n312) );
  INX1 U411 ( .IN(n249), .OUT(n250) );
  MU2IX1 U412 ( .IN0(n250), .IN1(n249), .S(n248), .QN(n319) );
  INX1 U413 ( .IN(tx_clk_divider[6]), .OUT(n253) );
  NO2X1 U414 ( .A(n253), .B(rst), .OUT(n252) );
  MU2IX1 U415 ( .IN0(n253), .IN1(n252), .S(n251), .QN(n320) );
  NA6X1 U416 ( .A(n321), .B(n324), .C(n315), .D(n312), .E(n319), .F(n320), 
        .OUT(n264) );
  INX1 U417 ( .IN(tx_clk_divider[4]), .OUT(n255) );
  NO2X1 U418 ( .A(n255), .B(rst), .OUT(n254) );
  MU2IX1 U419 ( .IN0(n255), .IN1(n254), .S(n317), .QN(n318) );
  INX1 U420 ( .IN(n257), .OUT(n258) );
  MU2IX1 U421 ( .IN0(n258), .IN1(n257), .S(n256), .QN(n313) );
  NA2X1 U422 ( .A(n358), .B(tx_clk_divider[10]), .OUT(n262) );
  NO2X1 U423 ( .A(n260), .B(n259), .OUT(n261) );
  HAX1 U424 ( .A(n262), .B(n261), .S(n325) );
  NA3X1 U425 ( .A(n318), .B(n313), .C(n325), .OUT(n263) );
  OR2X1 U426 ( .A(n264), .B(n263), .OUT(n265) );
  NO2X1 U427 ( .A(n323), .B(n265), .OUT(n274) );
  AND2X1 U428 ( .A(tx_clk_divider[0]), .B(n274), .OUT(n364) );
  INX1 U429 ( .IN(tx_countdown[1]), .OUT(n266) );
  AND3X1 U430 ( .A(n363), .B(n364), .C(n266), .OUT(n282) );
  INX1 U431 ( .IN(n267), .OUT(n268) );
  MU2IX1 U432 ( .IN0(n268), .IN1(n267), .S(tx_countdown[3]), .QN(n287) );
  NA3X1 U433 ( .A(n290), .B(n282), .C(n287), .OUT(n269) );
  OR2X1 U434 ( .A(tx_countdown[0]), .B(n364), .OUT(n283) );
  NA2X1 U435 ( .A(n269), .B(n283), .OUT(n270) );
  NA3X1 U436 ( .A(n271), .B(n286), .C(n270), .OUT(n276) );
  INX1 U437 ( .IN(tx_countdown[2]), .OUT(n273) );
  MU2IX1 U438 ( .IN0(tx_countdown[2]), .IN1(n273), .S(n272), .QN(n281) );
  NA3X1 U439 ( .A(n274), .B(tx_clk_divider[0]), .C(n281), .OUT(n275) );
  NA3X1 U440 ( .A(n368), .B(n276), .C(n275), .OUT(n401) );
  NA2X1 U441 ( .A(transmit), .B(n286), .OUT(n277) );
  INX1 U442 ( .IN(tx_countdown[0]), .OUT(n278) );
  OA211X1 U443 ( .A(tx_state[0]), .B(n277), .C(n364), .D(n278), .OUT(n400) );
  MU2IX1 U444 ( .IN0(tx_countdown[0]), .IN1(n278), .S(tx_countdown[1]), .QN(
        n360) );
  INX1 U445 ( .IN(n360), .OUT(n280) );
  NA3X1 U446 ( .A(n286), .B(n379), .C(transmit), .OUT(n279) );
  NA2X1 U447 ( .A(n279), .B(n364), .OUT(n291) );
  NO2X1 U448 ( .A(n280), .B(n291), .OUT(n399) );
  NO2X1 U449 ( .A(tx_countdown[4]), .B(n281), .OUT(n362) );
  NA2X1 U450 ( .A(n362), .B(n282), .OUT(n284) );
  NA2X1 U451 ( .A(n284), .B(n283), .OUT(n285) );
  AND4X1 U452 ( .A(n371), .B(n377), .C(n286), .D(n285), .OUT(n289) );
  NO2X1 U453 ( .A(n287), .B(n291), .OUT(n288) );
  OR2X1 U454 ( .A(n289), .B(n288), .OUT(n398) );
  AN21X1 U455 ( .A(n359), .B(n290), .C(n291), .OUT(n397) );
  NO2X1 U456 ( .A(n292), .B(n291), .OUT(n396) );
  INX1 U457 ( .IN(n306), .OUT(n310) );
  NO2X1 U458 ( .A(n293), .B(n310), .OUT(N203) );
  NO2X1 U459 ( .A(n294), .B(n310), .OUT(N204) );
  AND2X1 U460 ( .A(n295), .B(n306), .OUT(n340) );
  NA2X1 U461 ( .A(n296), .B(n340), .OUT(N205) );
  OR2X1 U462 ( .A(n298), .B(n297), .OUT(n299) );
  NA3X1 U463 ( .A(n300), .B(n340), .C(n299), .OUT(N206) );
  NO2X1 U464 ( .A(n301), .B(n310), .OUT(N207) );
  NA2X1 U465 ( .A(n302), .B(n340), .OUT(N208) );
  NO2X1 U466 ( .A(n303), .B(n310), .OUT(N209) );
  AN21X1 U467 ( .A(n305), .B(n304), .C(n310), .OUT(N210) );
  AND2X1 U468 ( .A(n307), .B(n306), .OUT(N211) );
  NA2X1 U469 ( .A(n308), .B(n340), .OUT(N212) );
  NO2X1 U470 ( .A(n310), .B(n309), .OUT(N213) );
  INX1 U471 ( .IN(n368), .OUT(n326) );
  NO2X1 U472 ( .A(n311), .B(n326), .OUT(N291) );
  NO2X1 U473 ( .A(n312), .B(n326), .OUT(N292) );
  NO2X1 U474 ( .A(n364), .B(n326), .OUT(n367) );
  NA2X1 U475 ( .A(n313), .B(n367), .OUT(N293) );
  OR2X1 U476 ( .A(n315), .B(n314), .OUT(n316) );
  NA3X1 U477 ( .A(n317), .B(n367), .C(n316), .OUT(N294) );
  NO2X1 U478 ( .A(n318), .B(n326), .OUT(N295) );
  NA2X1 U479 ( .A(n319), .B(n367), .OUT(N296) );
  NO2X1 U480 ( .A(n320), .B(n326), .OUT(N297) );
  AN21X1 U481 ( .A(n322), .B(n321), .C(n326), .OUT(N298) );
  AND2X1 U482 ( .A(n323), .B(n368), .OUT(N299) );
  NA2X1 U483 ( .A(n324), .B(n367), .OUT(N300) );
  NO2X1 U484 ( .A(n326), .B(n325), .OUT(N301) );
  AO31X1 U485 ( .A(n343), .B(n354), .C(n328), .D(N226), .OUT(N221) );
  NA2X1 U486 ( .A(rx_countdown[2]), .B(n329), .OUT(n333) );
  INX1 U487 ( .IN(n342), .OUT(n353) );
  NO2X1 U488 ( .A(rx), .B(n352), .OUT(n331) );
  OA211X1 U489 ( .A(n353), .B(n331), .C(n330), .D(n341), .OUT(n332) );
  AN21X1 U490 ( .A(n334), .B(n333), .C(n332), .OUT(n335) );
  OR2X1 U491 ( .A(n335), .B(N221), .OUT(n145) );
  NO2X1 U492 ( .A(n345), .B(rx), .OUT(n336) );
  OR2X1 U493 ( .A(n352), .B(n336), .OUT(n337) );
  NA2X1 U494 ( .A(n343), .B(n337), .OUT(n338) );
  NA3X1 U495 ( .A(n340), .B(n339), .C(n338), .OUT(n142) );
  MU2IX1 U496 ( .IN0(n354), .IN1(n352), .S(n341), .QN(n357) );
  NO2X1 U497 ( .A(n357), .B(n342), .OUT(n349) );
  NA2X1 U498 ( .A(rx), .B(n343), .OUT(n347) );
  NA3X1 U499 ( .A(recv_state[2]), .B(n358), .C(n344), .OUT(n346) );
  MU2IX1 U500 ( .IN0(n347), .IN1(n346), .S(n345), .QN(n348) );
  OR2X1 U501 ( .A(n349), .B(n348), .OUT(n141) );
  NO2X1 U502 ( .A(rx), .B(n350), .OUT(n351) );
  OR2X1 U503 ( .A(n352), .B(n351), .OUT(n355) );
  MU2IX1 U504 ( .IN0(n355), .IN1(n354), .S(n353), .QN(n356) );
  NA3X1 U505 ( .A(n357), .B(n356), .C(n358), .OUT(n138) );
  NA2X1 U506 ( .A(tx_state[1]), .B(n358), .OUT(n382) );
  OR2X1 U507 ( .A(tx_countdown[5]), .B(n359), .OUT(n366) );
  NO2X1 U508 ( .A(n360), .B(tx_countdown[3]), .OUT(n361) );
  NA3X1 U509 ( .A(n363), .B(n362), .C(n361), .OUT(n365) );
  MU2IX1 U510 ( .IN0(n366), .IN1(n365), .S(n364), .QN(n373) );
  AND3X1 U511 ( .A(n371), .B(n382), .C(n373), .OUT(n372) );
  NA2I1X1 U512 ( .A(n372), .B(n367), .OUT(n131) );
  NA2I1X1 U513 ( .A(n377), .B(n372), .OUT(n369) );
  NA2X1 U514 ( .A(n369), .B(n368), .OUT(n130) );
  NO2X1 U515 ( .A(rst), .B(n372), .OUT(n380) );
  AND2X1 U516 ( .A(tx_state[0]), .B(n380), .OUT(n370) );
  OR2X1 U517 ( .A(n370), .B(n130), .OUT(n128) );
  NA2X1 U518 ( .A(tx_state[1]), .B(n371), .OUT(n376) );
  NA2X1 U519 ( .A(n372), .B(n377), .OUT(n375) );
  OR2X1 U520 ( .A(n382), .B(n373), .OUT(n374) );
  NA3X1 U521 ( .A(n376), .B(n375), .C(n374), .OUT(n127) );
  NO2X1 U522 ( .A(tx_data[0]), .B(n377), .OUT(n378) );
  MU2IX1 U523 ( .IN0(n378), .IN1(transmit), .S(n379), .QN(n385) );
  NA2X1 U524 ( .A(transmit), .B(n379), .OUT(n381) );
  NA2X1 U525 ( .A(n381), .B(n380), .OUT(n383) );
  NA2X1 U526 ( .A(n383), .B(n382), .OUT(n384) );
  MU2X1 U527 ( .IN0(n385), .IN1(n425), .S(n384), .Q(n126) );
endmodule

