create_clock -period 16.000 -name clk_axi[0] [get_ports clk_axi[0]]
create_clock -period 16.000 -name clk_axi[1] [get_ports clk_axi[1]]
create_clock -period 16.000 -name clk_axi[2] [get_ports clk_axi[2]]
create_clock -period 16.000 -name clk_axi[3] [get_ports clk_axi[3]]

create_clock -period 16.000 -name clk_noc [get_ports clk_noc]