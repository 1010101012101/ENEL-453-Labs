library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevensegment is
    Port ( CA : out  STD_LOGIC;
           CB : out  STD_LOGIC;
           CC : out  STD_LOGIC;
           CD : out  STD_LOGIC;
           CE : out  STD_LOGIC;
           CF : out  STD_LOGIC;
           CG : out  STD_LOGIC;
           DP : out  STD_LOGIC;
		   dp_in: in STD_LOGIC;
           data : in  STD_LOGIC_VECTOR (3 downto 0)
			  );
end sevensegment;

architecture Behavioral of sevensegment is
	-- Signals:
	signal decoded_bits: STD_LOGIC_VECTOR(6 downto 0);

begin

Decoding: process(data) begin -- Sensitive to changing data
case data is
	when "0000" => decoded_bits <= "1111110";
	when "0001" => decoded_bits <= "0110000";
	when "0010" => decoded_bits <= "1101101";
	-- FINISH WRITING DECODING
	when others => decoded_bits <= "0000000"; -- For everything else
end case;

end process;

-- The LEDs that compose the segments are actually active low
DP <= not dp_in;
CA <= not decoded_bits(6);
CB <= not decoded_bits(5);
CC <= not decoded_bits(4);
CD <= not decoded_bits(3);
CE <= not decoded_bits(2);
CF <= not decoded_bits(1);
CG <= not decoded_bits(0);

end Behavioral;