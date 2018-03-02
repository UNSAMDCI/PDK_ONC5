module uart_pads ( clk, rst, rx, tx, transmit, tx_byte, received, rx_byte, 
        is_receiving, is_transmitting, recv_error );
  input  [7:0] tx_byte;
  output [7:0] rx_byte;
  input  clk, rst, rx, transmit;
  output tx, received, is_receiving, is_transmitting, recv_error;


  PADIO ipad_CLK(.ANA (clk));
  PADIO ipad_RST(.ANA (rst));
  PADIO ipad_RX(.ANA (rx));
  PADIO ipad_TRANSMIT(.ANA (transmit));
  PADIO ipad_TX(.ANA (tx));
  PADIO ipad_RECEIVED(.ANA (received));
  PADIO ipad_IS_REC(.ANA (is_receiving));
  PADIO ipad_IS_TX(.ANA (is_transmitting));
  PADIO ipad_RECV_ERROR(.ANA (recv_error));

  // tx_byte
  PADIO ipad_TX0(.ANA (tx_byte[0]));
  PADIO ipad_TX1(.ANA (tx_byte[1]));
  PADIO ipad_TX2(.ANA (tx_byte[2]));
  PADIO ipad_TX3(.ANA (tx_byte[3]));
  PADIO ipad_TX4(.ANA (tx_byte[4]));
  PADIO ipad_TX5(.ANA (tx_byte[5]));
  PADIO ipad_TX6(.ANA (tx_byte[6]));
  PADIO ipad_TX7(.ANA (tx_byte[7]));

  // rx_byte
  PADIO ipad_RX0(.ANA (rx_byte[0]));
  PADIO ipad_RX1(.ANA (rx_byte[1]));
  PADIO ipad_RX2(.ANA (rx_byte[2]));
  PADIO ipad_RX3(.ANA (rx_byte[3]));
  PADIO ipad_RX4(.ANA (rx_byte[4]));
  PADIO ipad_RX5(.ANA (rx_byte[5]));
  PADIO ipad_RX6(.ANA (rx_byte[6]));
  PADIO ipad_RX7(.ANA (rx_byte[7]));


  uart CORE ( 
    .clk             (clk),
    .rst             (rst),
    .rx              (rx),
    .tx              (tx), 
    .transmit        (transmit),
    .tx_byte         (tx_byte),
    .received        (received),
    .rx_byte         (rx_byte), 
    .is_receiving    (is_receiving),
    .is_transmitting (is_transmitting),
    .recv_error      (recv_error) 
  );

endmodule // uart