// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 2024.10 - Revision c2ba6936ca2ed63137095fea0b630a1c66e20e63-main - Date 2026-10-09T11:22:04
// Bambu executed with: /tmp/appimage_extracted_59f63c7110881beda1d70e94269c4433/usr/bin/bambu --top-fname=gift64_top -O3 --rom-duplication --generate-tb=/home/runner/work/ttsky-gift/ttsky-gift/hls/test_top.xml --device-name=nangate45 --clock-period=20 --simulate --simulator=VERILATOR -v3 /home/runner/work/ttsky-gift/ttsky-gift/hls/gift64_hls_opt.c 
// 
// Send any bug to: panda-info@polimi.it
// ************************************************************************
// The following text holds for all the components tagged with PANDA_LGPLv3.
// They are all part of the BAMBU/PANDA IP LIBRARY.
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
// 
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public
// License along with the PandA framework; see the files COPYING.LIB
// If not, see <http://www.gnu.org/licenses/>.
// ************************************************************************


`ifdef __ICARUS__
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VERILATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef MODEL_TECH
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VCS
  `define _SIM_HAVE_CLOG2
`endif
`ifdef NCVERILOG
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_SIMULATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_ISIM
  `define _SIM_HAVE_CLOG2
`endif

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module constant_value(out1);
  parameter BITSIZE_out1=1,
    value=1'b0;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = value;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_SE(clock,
  reset,
  in1,
  wenable,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    if (wenable)
      reg_out1 <= in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ARRAY_1D_STD_DISTRAM_NN_SDS(clock,
  reset,
  in1,
  in2r,
  in2w,
  in3r,
  in3w,
  in4r,
  in4w,
  out1,
  sel_LOAD,
  sel_STORE,
  S_oe_ram,
  S_we_ram,
  S_addr_ram,
  S_Wdata_ram,
  Sin_Rdata_ram,
  Sout_Rdata_ram,
  S_data_ram_size,
  Sin_DataRdy,
  Sout_DataRdy,
  proxy_in1,
  proxy_in2r,
  proxy_in2w,
  proxy_in3r,
  proxy_in3w,
  proxy_in4r,
  proxy_in4w,
  proxy_sel_LOAD,
  proxy_sel_STORE,
  proxy_out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2r=1, PORTSIZE_in2r=2,
    BITSIZE_in2w=1, PORTSIZE_in2w=2,
    BITSIZE_in3r=1, PORTSIZE_in3r=2,
    BITSIZE_in3w=1, PORTSIZE_in3w=2,
    BITSIZE_in4r=1, PORTSIZE_in4r=2,
    BITSIZE_in4w=1, PORTSIZE_in4w=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_S_oe_ram=1, PORTSIZE_S_oe_ram=2,
    BITSIZE_S_we_ram=1, PORTSIZE_S_we_ram=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_S_addr_ram=1, PORTSIZE_S_addr_ram=2,
    BITSIZE_S_Wdata_ram=8, PORTSIZE_S_Wdata_ram=2,
    BITSIZE_Sin_Rdata_ram=8, PORTSIZE_Sin_Rdata_ram=2,
    BITSIZE_Sout_Rdata_ram=8, PORTSIZE_Sout_Rdata_ram=2,
    BITSIZE_S_data_ram_size=1, PORTSIZE_S_data_ram_size=2,
    BITSIZE_Sin_DataRdy=1, PORTSIZE_Sin_DataRdy=2,
    BITSIZE_Sout_DataRdy=1, PORTSIZE_Sout_DataRdy=2,
    MEMORY_INIT_file="array.mem",
    n_elements=1,
    data_size=32,
    address_space_begin=0,
    address_space_rangesize=4,
    BUS_PIPELINED=1,
    PRIVATE_MEMORY=0,
    READ_ONLY_MEMORY=0,
    USE_SPARSE_MEMORY=1,
    ALIGNMENT=32,
    BITSIZE_proxy_in1=1, PORTSIZE_proxy_in1=2,
    BITSIZE_proxy_in2r=1, PORTSIZE_proxy_in2r=2,
    BITSIZE_proxy_in2w=1, PORTSIZE_proxy_in2w=2,
    BITSIZE_proxy_in3r=1, PORTSIZE_proxy_in3r=2,
    BITSIZE_proxy_in3w=1, PORTSIZE_proxy_in3w=2,
    BITSIZE_proxy_in4r=1, PORTSIZE_proxy_in4r=2,
    BITSIZE_proxy_in4w=1, PORTSIZE_proxy_in4w=2,
    BITSIZE_proxy_sel_LOAD=1, PORTSIZE_proxy_sel_LOAD=2,
    BITSIZE_proxy_sel_STORE=1, PORTSIZE_proxy_sel_STORE=2,
    BITSIZE_proxy_out1=1, PORTSIZE_proxy_out1=2;
  // IN
  input clock;
  input reset;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2r*BITSIZE_in2r)+(-1):0] in2r;
  input [(PORTSIZE_in2w*BITSIZE_in2w)+(-1):0] in2w;
  input [(PORTSIZE_in3r*BITSIZE_in3r)+(-1):0] in3r;
  input [(PORTSIZE_in3w*BITSIZE_in3w)+(-1):0] in3w;
  input [PORTSIZE_in4r-1:0] in4r;
  input [PORTSIZE_in4w-1:0] in4w;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_S_oe_ram-1:0] S_oe_ram;
  input [PORTSIZE_S_we_ram-1:0] S_we_ram;
  input [(PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1):0] S_addr_ram;
  input [(PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1):0] S_Wdata_ram;
  input [(PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1):0] Sin_Rdata_ram;
  input [(PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1):0] S_data_ram_size;
  input [PORTSIZE_Sin_DataRdy-1:0] Sin_DataRdy;
  input [(PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1):0] proxy_in1;
  input [(PORTSIZE_proxy_in2r*BITSIZE_proxy_in2r)+(-1):0] proxy_in2r;
  input [(PORTSIZE_proxy_in2w*BITSIZE_proxy_in2w)+(-1):0] proxy_in2w;
  input [(PORTSIZE_proxy_in3r*BITSIZE_proxy_in3r)+(-1):0] proxy_in3r;
  input [(PORTSIZE_proxy_in3w*BITSIZE_proxy_in3w)+(-1):0] proxy_in3w;
  input [(PORTSIZE_proxy_in4r*BITSIZE_proxy_in4r)+(-1):0] proxy_in4r;
  input [(PORTSIZE_proxy_in4w*BITSIZE_proxy_in4w)+(-1):0] proxy_in4w;
  input [PORTSIZE_proxy_sel_LOAD-1:0] proxy_sel_LOAD;
  input [PORTSIZE_proxy_sel_STORE-1:0] proxy_sel_STORE;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [(PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1):0] Sout_Rdata_ram;
  output [PORTSIZE_Sout_DataRdy-1:0] Sout_DataRdy;
  output [(PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1):0] proxy_out1;
  
  `ifndef _SIM_HAVE_CLOG2
      function integer log2;
        input integer value;
        integer temp_value;
        begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
        end
      endfunction
  `endif
  parameter n_byte_on_databus = ALIGNMENT/8;
  parameter nbit_addr_r = BITSIZE_in2r > BITSIZE_proxy_in2r ? BITSIZE_in2r : BITSIZE_proxy_in2r;
  parameter nbit_addr_w = BITSIZE_in2w > BITSIZE_proxy_in2w ? BITSIZE_in2w : BITSIZE_proxy_in2w;
  `ifdef _SIM_HAVE_CLOG2
    localparam nbit_read_addr = n_elements == 1 ? 1 : $clog2(n_elements);
    localparam nbits_byte_offset = n_byte_on_databus<=1 ? 0 : $clog2(n_byte_on_databus);
  `else
    localparam nbit_read_addr = n_elements == 1 ? 1 : log2(n_elements);
    localparam nbits_byte_offset = n_byte_on_databus<=1 ? 0 : log2(n_byte_on_databus);
  `endif
  parameter max_n_writes = PORTSIZE_sel_STORE;
  parameter max_n_reads = PORTSIZE_sel_LOAD;
  
  wire [max_n_writes-1:0] bram_write;
  
  wire [nbit_read_addr*max_n_reads-1:0] memory_addr_a_r;
  wire [nbit_read_addr*max_n_writes-1:0] memory_addr_a_w;
  
  wire [data_size*max_n_writes-1:0] din_value_aggregated;
  wire [data_size*max_n_reads-1:0] dout_a;
  wire [nbit_addr_r*max_n_reads-1:0] tmp_addr_r;
  wire [nbit_addr_w*max_n_writes-1:0] tmp_addr_w;
  wire [nbit_addr_r*max_n_reads-1:0] relative_addr_r;
  wire [nbit_addr_w*max_n_writes-1:0] relative_addr_w;
  integer index2;
  
  reg [data_size-1:0] memory [0:n_elements-1] /* synthesis syn_ramstyle = "no_rw_check" */;
  
  initial
  begin
    $readmemb(MEMORY_INIT_file,memory,0,n_elements-1);
  end
  
  generate
  genvar ind2_r;
  for (ind2_r=0; ind2_r<max_n_reads; ind2_r=ind2_r+1)
    begin : Lind2_r
      assign tmp_addr_r[(ind2_r+1)*nbit_addr_r-1:ind2_r*nbit_addr_r] = (proxy_sel_LOAD[ind2_r] && proxy_in4r[ind2_r]) ? proxy_in2r[(ind2_r+1)*BITSIZE_proxy_in2r-1:ind2_r*BITSIZE_proxy_in2r] : in2r[(ind2_r+1)*BITSIZE_in2r-1:ind2_r*BITSIZE_in2r];
    end
  endgenerate
  
  generate
  genvar ind2_w;
  for (ind2_w=0; ind2_w<max_n_writes; ind2_w=ind2_w+1)
    begin : Lind2_w
      assign tmp_addr_w[(ind2_w+1)*nbit_addr_w-1:ind2_w*nbit_addr_w] = (proxy_sel_STORE[ind2_w] && proxy_in4w[ind2_w]) ? proxy_in2w[(ind2_w+1)*BITSIZE_proxy_in2w-1:ind2_w*BITSIZE_proxy_in2w] : in2w[(ind2_w+1)*BITSIZE_in2w-1:ind2_w*BITSIZE_in2w];
    end
  endgenerate
  
  generate
  genvar i6_r;
    for (i6_r=0; i6_r<max_n_reads; i6_r=i6_r+1)
    begin : L6_r
      if(USE_SPARSE_MEMORY==1)
        assign relative_addr_r[(i6_r+1)*nbit_addr_r-1:i6_r*nbit_addr_r] = tmp_addr_r[(i6_r+1)*nbit_addr_r-1:i6_r*nbit_addr_r];
      else
        assign relative_addr_r[(i6_r+1)*nbit_addr_r-1:i6_r*nbit_addr_r] = tmp_addr_r[(i6_r+1)*nbit_addr_r-1:i6_r*nbit_addr_r]-address_space_begin;
    end
  endgenerate
  
  generate
  genvar i6_w;
    for (i6_w=0; i6_w<max_n_writes; i6_w=i6_w+1)
    begin : L6_w
      if(USE_SPARSE_MEMORY==1)
        assign relative_addr_w[(i6_w+1)*nbit_addr_w-1:i6_w*nbit_addr_w] = tmp_addr_w[(i6_w+1)*nbit_addr_w-1:i6_w*nbit_addr_w];
      else
        assign relative_addr_w[(i6_w+1)*nbit_addr_w-1:i6_w*nbit_addr_w] = tmp_addr_w[(i6_w+1)*nbit_addr_w-1:i6_w*nbit_addr_w]-address_space_begin;
    end
  endgenerate
  
  generate
  genvar i7_r;
    for (i7_r=0; i7_r<max_n_reads; i7_r=i7_r+1)
    begin : L7_A_r
      if (n_elements==1)
        assign memory_addr_a_r[(i7_r+1)*nbit_read_addr-1:i7_r*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_a_r[(i7_r+1)*nbit_read_addr-1:i7_r*nbit_read_addr] = relative_addr_r[nbit_read_addr+nbits_byte_offset-1+i7_r*nbit_addr_r:nbits_byte_offset+i7_r*nbit_addr_r];
    end
  endgenerate
  
  generate
  genvar i7_w;
    for (i7_w=0; i7_w<max_n_writes; i7_w=i7_w+1)
    begin : L7_A_w
      if (n_elements==1)
        assign memory_addr_a_w[(i7_w+1)*nbit_read_addr-1:i7_w*nbit_read_addr] = {nbit_read_addr{1'b0}};
      else
        assign memory_addr_a_w[(i7_w+1)*nbit_read_addr-1:i7_w*nbit_read_addr] = relative_addr_w[nbit_read_addr+nbits_byte_offset-1+i7_w*nbit_addr_w:nbits_byte_offset+i7_w*nbit_addr_w];
    end
  endgenerate
  
  generate
  genvar i14;
    for (i14=0; i14<max_n_writes; i14=i14+1)
    begin : L14
      assign din_value_aggregated[(i14+1)*data_size-1:i14*data_size] = (proxy_sel_STORE[i14] && proxy_in4w[i14]) ? proxy_in1[(i14+1)*BITSIZE_proxy_in1-1:i14*BITSIZE_proxy_in1] : in1[(i14+1)*BITSIZE_in1-1:i14*BITSIZE_in1];
    end
  endgenerate
  
  generate
  genvar i11;
    for (i11=0; i11<max_n_reads; i11=i11+1)
    begin : asynchronous_read
      assign dout_a[data_size*i11+:data_size] = memory[memory_addr_a_r[nbit_read_addr*i11+:nbit_read_addr]];
    end
  endgenerate
  
  generate if(READ_ONLY_MEMORY==0)
    always @(posedge clock)
    begin
      for (index2=0; index2<max_n_writes; index2=index2+1)
      begin
        if(bram_write[index2])
          memory[memory_addr_a_w[nbit_read_addr*index2+:nbit_read_addr]] <= din_value_aggregated[data_size*index2+:data_size];
      end
    end
  endgenerate
  
  generate
  genvar i21;
    for (i21=0; i21<max_n_writes; i21=i21+1)
    begin : L21
        assign bram_write[i21] = (sel_STORE[i21] && in4w[i21]) || (proxy_sel_STORE[i21] && proxy_in4w[i21]);
    end
  endgenerate
  
  generate
  genvar i20;
    for (i20=0; i20<max_n_reads; i20=i20+1)
    begin : L20
      assign out1[(i20+1)*BITSIZE_out1-1:i20*BITSIZE_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
      assign proxy_out1[(i20+1)*BITSIZE_proxy_out1-1:i20*BITSIZE_proxy_out1] = dout_a[(i20+1)*data_size-1:i20*data_size];
    end
  endgenerate
  assign Sout_Rdata_ram =Sin_Rdata_ram;
  assign Sout_DataRdy = Sin_DataRdy;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UUdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module addr_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module read_cond_FU(in1,
  out1);
  parameter BITSIZE_in1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output out1;
  assign out1 = in1 != {BITSIZE_in1{1'b0}};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_and_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 & in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_ior_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 | in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_bit_xor_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 ^ in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_eq_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 == in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_lshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    localparam arg2_bitsize = $clog2(PRECISION);
  `else
    localparam arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 << in2[arg2_bitsize-1:0];
    else
      assign out1 = in1 << in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_pointer_plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    LSB_PARAMETER=-1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  wire [BITSIZE_out1-1:0] in1_tmp;
  wire [BITSIZE_out1-1:0] in2_tmp;
  assign in1_tmp = in1;
  assign in2_tmp = in2;generate if (BITSIZE_out1 > LSB_PARAMETER) assign out1[BITSIZE_out1-1:LSB_PARAMETER] = (in1_tmp[BITSIZE_out1-1:LSB_PARAMETER] + in2_tmp[BITSIZE_out1-1:LSB_PARAMETER]); else assign out1 = 0; endgenerate
  generate if (LSB_PARAMETER != 0 && BITSIZE_out1 > LSB_PARAMETER) assign out1[LSB_PARAMETER-1:0] = 0; endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_rshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    localparam arg2_bitsize = $clog2(PRECISION);
  `else
    localparam arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 >> (in2[arg2_bitsize-1:0]);
    else
      assign out1 = in1 >> in2;
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module MUX_GATE(sel,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input sel;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = sel ? in1 : in2;
endmodule

// Datapath RTL description for gift64_top
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_gift64_top(clock,
  reset,
  in_port_pt,
  in_port_key_hi,
  in_port_key_lo,
  return_port,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE,
  selector_MUX_133_reg_0_0_0_0,
  selector_MUX_134_reg_1_0_0_0,
  selector_MUX_135_reg_10_0_0_0,
  selector_MUX_136_reg_11_0_0_0,
  selector_MUX_137_reg_12_0_0_0,
  selector_MUX_138_reg_13_0_0_0,
  selector_MUX_139_reg_14_0_0_0,
  selector_MUX_140_reg_15_0_0_0,
  selector_MUX_141_reg_16_0_0_0,
  selector_MUX_142_reg_17_0_0_0,
  selector_MUX_143_reg_18_0_0_0,
  selector_MUX_144_reg_19_0_0_0,
  selector_MUX_145_reg_2_0_0_0,
  selector_MUX_146_reg_20_0_0_0,
  selector_MUX_147_reg_21_0_0_0,
  selector_MUX_148_reg_22_0_0_0,
  selector_MUX_149_reg_23_0_0_0,
  selector_MUX_150_reg_24_0_0_0,
  selector_MUX_151_reg_25_0_0_0,
  selector_MUX_152_reg_26_0_0_0,
  selector_MUX_153_reg_27_0_0_0,
  selector_MUX_154_reg_28_0_0_0,
  selector_MUX_155_reg_29_0_0_0,
  selector_MUX_156_reg_3_0_0_0,
  selector_MUX_157_reg_30_0_0_0,
  selector_MUX_158_reg_31_0_0_0,
  selector_MUX_159_reg_32_0_0_0,
  selector_MUX_160_reg_33_0_0_0,
  selector_MUX_161_reg_34_0_0_0,
  selector_MUX_162_reg_35_0_0_0,
  selector_MUX_163_reg_36_0_0_0,
  selector_MUX_164_reg_37_0_0_0,
  selector_MUX_165_reg_38_0_0_0,
  selector_MUX_166_reg_39_0_0_0,
  selector_MUX_167_reg_4_0_0_0,
  selector_MUX_168_reg_40_0_0_0,
  selector_MUX_169_reg_41_0_0_0,
  selector_MUX_170_reg_42_0_0_0,
  selector_MUX_171_reg_43_0_0_0,
  selector_MUX_172_reg_44_0_0_0,
  selector_MUX_173_reg_45_0_0_0,
  selector_MUX_174_reg_46_0_0_0,
  selector_MUX_175_reg_47_0_0_0,
  selector_MUX_176_reg_48_0_0_0,
  selector_MUX_178_reg_5_0_0_0,
  selector_MUX_180_reg_6_0_0_0,
  selector_MUX_181_reg_7_0_0_0,
  selector_MUX_182_reg_8_0_0_0,
  selector_MUX_183_reg_9_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_36,
  wrenable_reg_37,
  wrenable_reg_38,
  wrenable_reg_39,
  wrenable_reg_4,
  wrenable_reg_40,
  wrenable_reg_41,
  wrenable_reg_42,
  wrenable_reg_43,
  wrenable_reg_44,
  wrenable_reg_45,
  wrenable_reg_46,
  wrenable_reg_47,
  wrenable_reg_48,
  wrenable_reg_49,
  wrenable_reg_5,
  wrenable_reg_50,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_gift64_top_428528_429278);
  parameter MEM_var_429362_428528=1024,
    MEM_var_429679_428528=1024;
  // IN
  input clock;
  input reset;
  input [63:0] in_port_pt;
  input [63:0] in_port_key_hi;
  input [63:0] in_port_key_lo;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_STORE;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD;
  input fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE;
  input selector_MUX_133_reg_0_0_0_0;
  input selector_MUX_134_reg_1_0_0_0;
  input selector_MUX_135_reg_10_0_0_0;
  input selector_MUX_136_reg_11_0_0_0;
  input selector_MUX_137_reg_12_0_0_0;
  input selector_MUX_138_reg_13_0_0_0;
  input selector_MUX_139_reg_14_0_0_0;
  input selector_MUX_140_reg_15_0_0_0;
  input selector_MUX_141_reg_16_0_0_0;
  input selector_MUX_142_reg_17_0_0_0;
  input selector_MUX_143_reg_18_0_0_0;
  input selector_MUX_144_reg_19_0_0_0;
  input selector_MUX_145_reg_2_0_0_0;
  input selector_MUX_146_reg_20_0_0_0;
  input selector_MUX_147_reg_21_0_0_0;
  input selector_MUX_148_reg_22_0_0_0;
  input selector_MUX_149_reg_23_0_0_0;
  input selector_MUX_150_reg_24_0_0_0;
  input selector_MUX_151_reg_25_0_0_0;
  input selector_MUX_152_reg_26_0_0_0;
  input selector_MUX_153_reg_27_0_0_0;
  input selector_MUX_154_reg_28_0_0_0;
  input selector_MUX_155_reg_29_0_0_0;
  input selector_MUX_156_reg_3_0_0_0;
  input selector_MUX_157_reg_30_0_0_0;
  input selector_MUX_158_reg_31_0_0_0;
  input selector_MUX_159_reg_32_0_0_0;
  input selector_MUX_160_reg_33_0_0_0;
  input selector_MUX_161_reg_34_0_0_0;
  input selector_MUX_162_reg_35_0_0_0;
  input selector_MUX_163_reg_36_0_0_0;
  input selector_MUX_164_reg_37_0_0_0;
  input selector_MUX_165_reg_38_0_0_0;
  input selector_MUX_166_reg_39_0_0_0;
  input selector_MUX_167_reg_4_0_0_0;
  input selector_MUX_168_reg_40_0_0_0;
  input selector_MUX_169_reg_41_0_0_0;
  input selector_MUX_170_reg_42_0_0_0;
  input selector_MUX_171_reg_43_0_0_0;
  input selector_MUX_172_reg_44_0_0_0;
  input selector_MUX_173_reg_45_0_0_0;
  input selector_MUX_174_reg_46_0_0_0;
  input selector_MUX_175_reg_47_0_0_0;
  input selector_MUX_176_reg_48_0_0_0;
  input selector_MUX_178_reg_5_0_0_0;
  input selector_MUX_180_reg_6_0_0_0;
  input selector_MUX_181_reg_7_0_0_0;
  input selector_MUX_182_reg_8_0_0_0;
  input selector_MUX_183_reg_9_0_0_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_20;
  input wrenable_reg_21;
  input wrenable_reg_22;
  input wrenable_reg_23;
  input wrenable_reg_24;
  input wrenable_reg_25;
  input wrenable_reg_26;
  input wrenable_reg_27;
  input wrenable_reg_28;
  input wrenable_reg_29;
  input wrenable_reg_3;
  input wrenable_reg_30;
  input wrenable_reg_31;
  input wrenable_reg_32;
  input wrenable_reg_33;
  input wrenable_reg_34;
  input wrenable_reg_35;
  input wrenable_reg_36;
  input wrenable_reg_37;
  input wrenable_reg_38;
  input wrenable_reg_39;
  input wrenable_reg_4;
  input wrenable_reg_40;
  input wrenable_reg_41;
  input wrenable_reg_42;
  input wrenable_reg_43;
  input wrenable_reg_44;
  input wrenable_reg_45;
  input wrenable_reg_46;
  input wrenable_reg_47;
  input wrenable_reg_48;
  input wrenable_reg_49;
  input wrenable_reg_5;
  input wrenable_reg_50;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [63:0] return_port;
  output OUT_CONDITION_gift64_top_428528_429278;
  // Component and signal declarations
  wire null_out_signal_array_429362_0_Sout_DataRdy_0;
  wire null_out_signal_array_429362_0_Sout_DataRdy_1;
  wire [7:0] null_out_signal_array_429362_0_Sout_Rdata_ram_0;
  wire [7:0] null_out_signal_array_429362_0_Sout_Rdata_ram_1;
  wire [7:0] null_out_signal_array_429362_0_proxy_out1_0;
  wire [7:0] null_out_signal_array_429362_0_proxy_out1_1;
  wire null_out_signal_array_429362_1_Sout_DataRdy_0;
  wire null_out_signal_array_429362_1_Sout_DataRdy_1;
  wire [7:0] null_out_signal_array_429362_1_Sout_Rdata_ram_0;
  wire [7:0] null_out_signal_array_429362_1_Sout_Rdata_ram_1;
  wire [7:0] null_out_signal_array_429362_1_proxy_out1_0;
  wire [7:0] null_out_signal_array_429362_1_proxy_out1_1;
  wire null_out_signal_array_429362_2_Sout_DataRdy_0;
  wire null_out_signal_array_429362_2_Sout_DataRdy_1;
  wire [7:0] null_out_signal_array_429362_2_Sout_Rdata_ram_0;
  wire [7:0] null_out_signal_array_429362_2_Sout_Rdata_ram_1;
  wire [7:0] null_out_signal_array_429362_2_proxy_out1_0;
  wire [7:0] null_out_signal_array_429362_2_proxy_out1_1;
  wire null_out_signal_array_429362_3_Sout_DataRdy_0;
  wire null_out_signal_array_429362_3_Sout_DataRdy_1;
  wire [7:0] null_out_signal_array_429362_3_Sout_Rdata_ram_0;
  wire [7:0] null_out_signal_array_429362_3_Sout_Rdata_ram_1;
  wire [7:0] null_out_signal_array_429362_3_proxy_out1_0;
  wire [7:0] null_out_signal_array_429362_3_proxy_out1_1;
  wire null_out_signal_array_429362_4_Sout_DataRdy_0;
  wire null_out_signal_array_429362_4_Sout_DataRdy_1;
  wire [7:0] null_out_signal_array_429362_4_Sout_Rdata_ram_0;
  wire [7:0] null_out_signal_array_429362_4_Sout_Rdata_ram_1;
  wire [7:0] null_out_signal_array_429362_4_proxy_out1_0;
  wire [7:0] null_out_signal_array_429362_4_proxy_out1_1;
  wire null_out_signal_array_429362_5_Sout_DataRdy_0;
  wire null_out_signal_array_429362_5_Sout_DataRdy_1;
  wire [7:0] null_out_signal_array_429362_5_Sout_Rdata_ram_0;
  wire [7:0] null_out_signal_array_429362_5_Sout_Rdata_ram_1;
  wire [7:0] null_out_signal_array_429362_5_proxy_out1_0;
  wire [7:0] null_out_signal_array_429362_5_proxy_out1_1;
  wire null_out_signal_array_429362_6_Sout_DataRdy_0;
  wire null_out_signal_array_429362_6_Sout_DataRdy_1;
  wire [7:0] null_out_signal_array_429362_6_Sout_Rdata_ram_0;
  wire [7:0] null_out_signal_array_429362_6_Sout_Rdata_ram_1;
  wire [7:0] null_out_signal_array_429362_6_proxy_out1_0;
  wire [7:0] null_out_signal_array_429362_6_proxy_out1_1;
  wire null_out_signal_array_429362_7_Sout_DataRdy_0;
  wire null_out_signal_array_429362_7_Sout_DataRdy_1;
  wire [7:0] null_out_signal_array_429362_7_Sout_Rdata_ram_0;
  wire [7:0] null_out_signal_array_429362_7_Sout_Rdata_ram_1;
  wire [7:0] null_out_signal_array_429362_7_proxy_out1_0;
  wire [7:0] null_out_signal_array_429362_7_proxy_out1_1;
  wire null_out_signal_array_429679_0_Sout_DataRdy_0;
  wire null_out_signal_array_429679_0_Sout_DataRdy_1;
  wire [7:0] null_out_signal_array_429679_0_Sout_Rdata_ram_0;
  wire [7:0] null_out_signal_array_429679_0_Sout_Rdata_ram_1;
  wire [7:0] null_out_signal_array_429679_0_out1_1;
  wire [7:0] null_out_signal_array_429679_0_proxy_out1_0;
  wire [7:0] null_out_signal_array_429679_0_proxy_out1_1;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_429362_0;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_array_429362_5;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_array_429362_5;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_array_429362_6;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_array_429362_6;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_array_429362_7;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_array_429362_7;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_429362_0;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_array_429362_1;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_array_429362_1;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_array_429362_2;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_array_429362_2;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_array_429362_3;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_array_429362_3;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_array_429362_4;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_array_429362_4;
  wire [7:0] out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_429679_0;
  wire [3:0] out_MUX_133_reg_0_0_0_0;
  wire [3:0] out_MUX_134_reg_1_0_0_0;
  wire [3:0] out_MUX_135_reg_10_0_0_0;
  wire [3:0] out_MUX_136_reg_11_0_0_0;
  wire [3:0] out_MUX_137_reg_12_0_0_0;
  wire [3:0] out_MUX_138_reg_13_0_0_0;
  wire [3:0] out_MUX_139_reg_14_0_0_0;
  wire [3:0] out_MUX_140_reg_15_0_0_0;
  wire [3:0] out_MUX_141_reg_16_0_0_0;
  wire [3:0] out_MUX_142_reg_17_0_0_0;
  wire [3:0] out_MUX_143_reg_18_0_0_0;
  wire [3:0] out_MUX_144_reg_19_0_0_0;
  wire [3:0] out_MUX_145_reg_2_0_0_0;
  wire [3:0] out_MUX_146_reg_20_0_0_0;
  wire [3:0] out_MUX_147_reg_21_0_0_0;
  wire [3:0] out_MUX_148_reg_22_0_0_0;
  wire [3:0] out_MUX_149_reg_23_0_0_0;
  wire [3:0] out_MUX_150_reg_24_0_0_0;
  wire [3:0] out_MUX_151_reg_25_0_0_0;
  wire [3:0] out_MUX_152_reg_26_0_0_0;
  wire [3:0] out_MUX_153_reg_27_0_0_0;
  wire [3:0] out_MUX_154_reg_28_0_0_0;
  wire [3:0] out_MUX_155_reg_29_0_0_0;
  wire [3:0] out_MUX_156_reg_3_0_0_0;
  wire [3:0] out_MUX_157_reg_30_0_0_0;
  wire [3:0] out_MUX_158_reg_31_0_0_0;
  wire [3:0] out_MUX_159_reg_32_0_0_0;
  wire [3:0] out_MUX_160_reg_33_0_0_0;
  wire [3:0] out_MUX_161_reg_34_0_0_0;
  wire [3:0] out_MUX_162_reg_35_0_0_0;
  wire [3:0] out_MUX_163_reg_36_0_0_0;
  wire [3:0] out_MUX_164_reg_37_0_0_0;
  wire [3:0] out_MUX_165_reg_38_0_0_0;
  wire [3:0] out_MUX_166_reg_39_0_0_0;
  wire [3:0] out_MUX_167_reg_4_0_0_0;
  wire [3:0] out_MUX_168_reg_40_0_0_0;
  wire [3:0] out_MUX_169_reg_41_0_0_0;
  wire [3:0] out_MUX_170_reg_42_0_0_0;
  wire [3:0] out_MUX_171_reg_43_0_0_0;
  wire [3:0] out_MUX_172_reg_44_0_0_0;
  wire [3:0] out_MUX_173_reg_45_0_0_0;
  wire [3:0] out_MUX_174_reg_46_0_0_0;
  wire [3:0] out_MUX_175_reg_47_0_0_0;
  wire [31:0] out_MUX_176_reg_48_0_0_0;
  wire [3:0] out_MUX_178_reg_5_0_0_0;
  wire [3:0] out_MUX_180_reg_6_0_0_0;
  wire [3:0] out_MUX_181_reg_7_0_0_0;
  wire [3:0] out_MUX_182_reg_8_0_0_0;
  wire [3:0] out_MUX_183_reg_9_0_0_0;
  wire [3:0] out_UUdata_converter_FU_100_i0_fu_gift64_top_428528_429031;
  wire [3:0] out_UUdata_converter_FU_101_i0_fu_gift64_top_428528_429034;
  wire [3:0] out_UUdata_converter_FU_102_i0_fu_gift64_top_428528_429037;
  wire [3:0] out_UUdata_converter_FU_103_i0_fu_gift64_top_428528_429040;
  wire [3:0] out_UUdata_converter_FU_104_i0_fu_gift64_top_428528_429043;
  wire [3:0] out_UUdata_converter_FU_105_i0_fu_gift64_top_428528_429046;
  wire [3:0] out_UUdata_converter_FU_106_i0_fu_gift64_top_428528_429049;
  wire [3:0] out_UUdata_converter_FU_107_i0_fu_gift64_top_428528_429052;
  wire [3:0] out_UUdata_converter_FU_108_i0_fu_gift64_top_428528_429055;
  wire [3:0] out_UUdata_converter_FU_109_i0_fu_gift64_top_428528_429058;
  wire [3:0] out_UUdata_converter_FU_10_i0_fu_gift64_top_428528_428568;
  wire [3:0] out_UUdata_converter_FU_110_i0_fu_gift64_top_428528_429061;
  wire [3:0] out_UUdata_converter_FU_111_i0_fu_gift64_top_428528_429064;
  wire [3:0] out_UUdata_converter_FU_112_i0_fu_gift64_top_428528_429067;
  wire [3:0] out_UUdata_converter_FU_113_i0_fu_gift64_top_428528_429070;
  wire [3:0] out_UUdata_converter_FU_114_i0_fu_gift64_top_428528_429073;
  wire [3:0] out_UUdata_converter_FU_115_i0_fu_gift64_top_428528_429076;
  wire out_UUdata_converter_FU_116_i0_fu_gift64_top_428528_429277;
  wire [7:0] out_UUdata_converter_FU_118_i0_fu_gift64_top_428528_430009;
  wire [3:0] out_UUdata_converter_FU_119_i0_fu_gift64_top_428528_430010;
  wire [3:0] out_UUdata_converter_FU_11_i0_fu_gift64_top_428528_428571;
  wire [3:0] out_UUdata_converter_FU_120_i0_fu_gift64_top_428528_430013;
  wire [3:0] out_UUdata_converter_FU_121_i0_fu_gift64_top_428528_430016;
  wire [3:0] out_UUdata_converter_FU_122_i0_fu_gift64_top_428528_430019;
  wire [3:0] out_UUdata_converter_FU_123_i0_fu_gift64_top_428528_430022;
  wire [3:0] out_UUdata_converter_FU_124_i0_fu_gift64_top_428528_430025;
  wire [3:0] out_UUdata_converter_FU_125_i0_fu_gift64_top_428528_430028;
  wire [3:0] out_UUdata_converter_FU_126_i0_fu_gift64_top_428528_430031;
  wire [3:0] out_UUdata_converter_FU_127_i0_fu_gift64_top_428528_430034;
  wire [3:0] out_UUdata_converter_FU_128_i0_fu_gift64_top_428528_430037;
  wire [3:0] out_UUdata_converter_FU_129_i0_fu_gift64_top_428528_430040;
  wire [3:0] out_UUdata_converter_FU_12_i0_fu_gift64_top_428528_428574;
  wire [3:0] out_UUdata_converter_FU_130_i0_fu_gift64_top_428528_430043;
  wire [3:0] out_UUdata_converter_FU_131_i0_fu_gift64_top_428528_430046;
  wire [3:0] out_UUdata_converter_FU_132_i0_fu_gift64_top_428528_430049;
  wire [3:0] out_UUdata_converter_FU_13_i0_fu_gift64_top_428528_428577;
  wire [3:0] out_UUdata_converter_FU_14_i0_fu_gift64_top_428528_428580;
  wire [3:0] out_UUdata_converter_FU_15_i0_fu_gift64_top_428528_428583;
  wire [3:0] out_UUdata_converter_FU_16_i0_fu_gift64_top_428528_428586;
  wire [3:0] out_UUdata_converter_FU_17_i0_fu_gift64_top_428528_428589;
  wire [3:0] out_UUdata_converter_FU_18_i0_fu_gift64_top_428528_428592;
  wire [3:0] out_UUdata_converter_FU_19_i0_fu_gift64_top_428528_428595;
  wire [3:0] out_UUdata_converter_FU_20_i0_fu_gift64_top_428528_428598;
  wire [3:0] out_UUdata_converter_FU_21_i0_fu_gift64_top_428528_428601;
  wire [3:0] out_UUdata_converter_FU_22_i0_fu_gift64_top_428528_428604;
  wire [3:0] out_UUdata_converter_FU_23_i0_fu_gift64_top_428528_428607;
  wire [3:0] out_UUdata_converter_FU_24_i0_fu_gift64_top_428528_428610;
  wire [3:0] out_UUdata_converter_FU_25_i0_fu_gift64_top_428528_428613;
  wire [3:0] out_UUdata_converter_FU_26_i0_fu_gift64_top_428528_428616;
  wire [3:0] out_UUdata_converter_FU_27_i0_fu_gift64_top_428528_428619;
  wire [3:0] out_UUdata_converter_FU_28_i0_fu_gift64_top_428528_428622;
  wire [3:0] out_UUdata_converter_FU_29_i0_fu_gift64_top_428528_428625;
  wire [3:0] out_UUdata_converter_FU_30_i0_fu_gift64_top_428528_428628;
  wire [3:0] out_UUdata_converter_FU_31_i0_fu_gift64_top_428528_428631;
  wire [3:0] out_UUdata_converter_FU_32_i0_fu_gift64_top_428528_428634;
  wire [3:0] out_UUdata_converter_FU_33_i0_fu_gift64_top_428528_428637;
  wire [3:0] out_UUdata_converter_FU_34_i0_fu_gift64_top_428528_428640;
  wire [3:0] out_UUdata_converter_FU_35_i0_fu_gift64_top_428528_428643;
  wire [3:0] out_UUdata_converter_FU_36_i0_fu_gift64_top_428528_428646;
  wire [3:0] out_UUdata_converter_FU_37_i0_fu_gift64_top_428528_428649;
  wire [3:0] out_UUdata_converter_FU_38_i0_fu_gift64_top_428528_428652;
  wire [3:0] out_UUdata_converter_FU_39_i0_fu_gift64_top_428528_428655;
  wire [3:0] out_UUdata_converter_FU_40_i0_fu_gift64_top_428528_428658;
  wire [3:0] out_UUdata_converter_FU_41_i0_fu_gift64_top_428528_428661;
  wire [3:0] out_UUdata_converter_FU_42_i0_fu_gift64_top_428528_428664;
  wire [3:0] out_UUdata_converter_FU_43_i0_fu_gift64_top_428528_428667;
  wire [3:0] out_UUdata_converter_FU_44_i0_fu_gift64_top_428528_428670;
  wire [3:0] out_UUdata_converter_FU_45_i0_fu_gift64_top_428528_428673;
  wire [3:0] out_UUdata_converter_FU_46_i0_fu_gift64_top_428528_428676;
  wire [3:0] out_UUdata_converter_FU_47_i0_fu_gift64_top_428528_428678;
  wire [3:0] out_UUdata_converter_FU_48_i0_fu_gift64_top_428528_428680;
  wire [7:0] out_UUdata_converter_FU_4_i0_fu_gift64_top_428528_428549;
  wire [7:0] out_UUdata_converter_FU_5_i0_fu_gift64_top_428528_428551;
  wire [7:0] out_UUdata_converter_FU_6_i0_fu_gift64_top_428528_428553;
  wire [3:0] out_UUdata_converter_FU_7_i0_fu_gift64_top_428528_428559;
  wire [3:0] out_UUdata_converter_FU_8_i0_fu_gift64_top_428528_428562;
  wire [3:0] out_UUdata_converter_FU_9_i0_fu_gift64_top_428528_428565;
  wire [10:0] out_addr_expr_FU_49_i0_fu_gift64_top_428528_430283;
  wire [10:0] out_addr_expr_FU_50_i0_fu_gift64_top_428528_430348;
  wire out_const_0;
  wire [4:0] out_const_1;
  wire [5:0] out_const_10;
  wire [5:0] out_const_11;
  wire [10:0] out_const_12;
  wire [10:0] out_const_13;
  wire [1:0] out_const_14;
  wire [3:0] out_const_15;
  wire [4:0] out_const_16;
  wire [5:0] out_const_17;
  wire [5:0] out_const_18;
  wire [4:0] out_const_19;
  wire out_const_2;
  wire [5:0] out_const_20;
  wire [3:0] out_const_21;
  wire [5:0] out_const_22;
  wire [1:0] out_const_3;
  wire [2:0] out_const_4;
  wire [3:0] out_const_5;
  wire [4:0] out_const_6;
  wire [5:0] out_const_7;
  wire [5:0] out_const_8;
  wire [4:0] out_const_9;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_429362_0_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_array_429362_5_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_array_429362_5_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_array_429362_6_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_array_429362_6_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_array_429362_7_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_array_429362_7_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_429362_0_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_array_429362_1_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_array_429362_1_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_array_429362_2_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_array_429362_2_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_array_429362_3_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_array_429362_3_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_array_429362_4_8_4;
  wire [3:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_array_429362_4_8_4;
  wire [5:0] out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_429679_0_8_6;
  wire [31:0] out_conv_out_const_0_1_32;
  wire [31:0] out_conv_out_const_12_11_32;
  wire [31:0] out_conv_out_const_13_11_32;
  wire [3:0] out_conv_out_const_1_5_4;
  wire out_read_cond_FU_117_i0_fu_gift64_top_428528_429278;
  wire [3:0] out_reg_0_reg_0;
  wire [3:0] out_reg_10_reg_10;
  wire [3:0] out_reg_11_reg_11;
  wire [3:0] out_reg_12_reg_12;
  wire [3:0] out_reg_13_reg_13;
  wire [3:0] out_reg_14_reg_14;
  wire [3:0] out_reg_15_reg_15;
  wire [3:0] out_reg_16_reg_16;
  wire [3:0] out_reg_17_reg_17;
  wire [3:0] out_reg_18_reg_18;
  wire [3:0] out_reg_19_reg_19;
  wire [3:0] out_reg_1_reg_1;
  wire [3:0] out_reg_20_reg_20;
  wire [3:0] out_reg_21_reg_21;
  wire [3:0] out_reg_22_reg_22;
  wire [3:0] out_reg_23_reg_23;
  wire [3:0] out_reg_24_reg_24;
  wire [3:0] out_reg_25_reg_25;
  wire [3:0] out_reg_26_reg_26;
  wire [3:0] out_reg_27_reg_27;
  wire [3:0] out_reg_28_reg_28;
  wire [3:0] out_reg_29_reg_29;
  wire [3:0] out_reg_2_reg_2;
  wire [3:0] out_reg_30_reg_30;
  wire [3:0] out_reg_31_reg_31;
  wire [3:0] out_reg_32_reg_32;
  wire [3:0] out_reg_33_reg_33;
  wire [3:0] out_reg_34_reg_34;
  wire [3:0] out_reg_35_reg_35;
  wire [3:0] out_reg_36_reg_36;
  wire [3:0] out_reg_37_reg_37;
  wire [3:0] out_reg_38_reg_38;
  wire [3:0] out_reg_39_reg_39;
  wire [3:0] out_reg_3_reg_3;
  wire [3:0] out_reg_40_reg_40;
  wire [3:0] out_reg_41_reg_41;
  wire [3:0] out_reg_42_reg_42;
  wire [3:0] out_reg_43_reg_43;
  wire [3:0] out_reg_44_reg_44;
  wire [3:0] out_reg_45_reg_45;
  wire [3:0] out_reg_46_reg_46;
  wire [3:0] out_reg_47_reg_47;
  wire [31:0] out_reg_48_reg_48;
  wire [10:0] out_reg_49_reg_49;
  wire [3:0] out_reg_4_reg_4;
  wire [10:0] out_reg_50_reg_50;
  wire [3:0] out_reg_5_reg_5;
  wire [3:0] out_reg_6_reg_6;
  wire [3:0] out_reg_7_reg_7;
  wire [3:0] out_reg_8_reg_8;
  wire [3:0] out_reg_9_reg_9;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i0_fu_gift64_top_428528_429079;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i10_fu_gift64_top_428528_429089;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i11_fu_gift64_top_428528_429090;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i12_fu_gift64_top_428528_429091;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i13_fu_gift64_top_428528_429092;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i14_fu_gift64_top_428528_429093;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i15_fu_gift64_top_428528_429094;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i16_fu_gift64_top_428528_429095;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i17_fu_gift64_top_428528_429096;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i18_fu_gift64_top_428528_429097;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i19_fu_gift64_top_428528_429098;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i1_fu_gift64_top_428528_429080;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i20_fu_gift64_top_428528_429099;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i21_fu_gift64_top_428528_429100;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i22_fu_gift64_top_428528_429101;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i23_fu_gift64_top_428528_429102;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i24_fu_gift64_top_428528_429103;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i25_fu_gift64_top_428528_429104;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i26_fu_gift64_top_428528_429122;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i27_fu_gift64_top_428528_429132;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i28_fu_gift64_top_428528_429142;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i29_fu_gift64_top_428528_429152;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i2_fu_gift64_top_428528_429081;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i30_fu_gift64_top_428528_429160;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i31_fu_gift64_top_428528_429163;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i32_fu_gift64_top_428528_429168;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i33_fu_gift64_top_428528_429174;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i34_fu_gift64_top_428528_429178;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i35_fu_gift64_top_428528_429183;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i36_fu_gift64_top_428528_429187;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i37_fu_gift64_top_428528_429193;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i38_fu_gift64_top_428528_429196;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i39_fu_gift64_top_428528_429202;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i3_fu_gift64_top_428528_429082;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i40_fu_gift64_top_428528_429208;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i41_fu_gift64_top_428528_429214;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i42_fu_gift64_top_428528_429220;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i43_fu_gift64_top_428528_429229;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i44_fu_gift64_top_428528_429235;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i45_fu_gift64_top_428528_429241;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i46_fu_gift64_top_428528_429250;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i47_fu_gift64_top_428528_429256;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i4_fu_gift64_top_428528_429083;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i5_fu_gift64_top_428528_429084;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i6_fu_gift64_top_428528_429085;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i7_fu_gift64_top_428528_429086;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i8_fu_gift64_top_428528_429087;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_134_i9_fu_gift64_top_428528_429088;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i0_fu_gift64_top_428528_429118;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i10_fu_gift64_top_428528_429144;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i11_fu_gift64_top_428528_429146;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i12_fu_gift64_top_428528_429148;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i13_fu_gift64_top_428528_429150;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i14_fu_gift64_top_428528_429154;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i15_fu_gift64_top_428528_429156;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i1_fu_gift64_top_428528_429120;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i2_fu_gift64_top_428528_429124;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i3_fu_gift64_top_428528_429126;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i4_fu_gift64_top_428528_429128;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i5_fu_gift64_top_428528_429130;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i6_fu_gift64_top_428528_429134;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i7_fu_gift64_top_428528_429136;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i8_fu_gift64_top_428528_429138;
  wire [0:0] out_ui_bit_and_expr_FU_1_0_1_135_i9_fu_gift64_top_428528_429140;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i0_fu_gift64_top_428528_428550;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i10_fu_gift64_top_428528_428581;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i11_fu_gift64_top_428528_428584;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i12_fu_gift64_top_428528_428587;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i13_fu_gift64_top_428528_428590;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i14_fu_gift64_top_428528_428593;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i15_fu_gift64_top_428528_428596;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i16_fu_gift64_top_428528_428599;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i17_fu_gift64_top_428528_428602;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i18_fu_gift64_top_428528_428605;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i19_fu_gift64_top_428528_428608;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i1_fu_gift64_top_428528_428552;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i20_fu_gift64_top_428528_428611;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i21_fu_gift64_top_428528_428614;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i22_fu_gift64_top_428528_428617;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i23_fu_gift64_top_428528_428620;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i24_fu_gift64_top_428528_428623;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i25_fu_gift64_top_428528_428626;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i26_fu_gift64_top_428528_428629;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i27_fu_gift64_top_428528_428632;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i28_fu_gift64_top_428528_428635;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i29_fu_gift64_top_428528_428638;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i2_fu_gift64_top_428528_428554;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i30_fu_gift64_top_428528_428641;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i31_fu_gift64_top_428528_428644;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i32_fu_gift64_top_428528_428647;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i33_fu_gift64_top_428528_428650;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i34_fu_gift64_top_428528_428653;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i35_fu_gift64_top_428528_428656;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i36_fu_gift64_top_428528_428659;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i37_fu_gift64_top_428528_428662;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i38_fu_gift64_top_428528_428665;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i39_fu_gift64_top_428528_428668;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i3_fu_gift64_top_428528_428560;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i40_fu_gift64_top_428528_428671;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i41_fu_gift64_top_428528_428674;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i4_fu_gift64_top_428528_428563;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i5_fu_gift64_top_428528_428566;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i6_fu_gift64_top_428528_428569;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i7_fu_gift64_top_428528_428572;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i8_fu_gift64_top_428528_428575;
  wire [3:0] out_ui_bit_and_expr_FU_8_0_8_136_i9_fu_gift64_top_428528_428578;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_137_i0_fu_gift64_top_428528_429261;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_137_i1_fu_gift64_top_428528_429265;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_137_i2_fu_gift64_top_428528_429269;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_138_i0_fu_gift64_top_428528_429263;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_138_i1_fu_gift64_top_428528_429267;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_138_i2_fu_gift64_top_428528_429271;
  wire [1:0] out_ui_bit_and_expr_FU_8_0_8_138_i3_fu_gift64_top_428528_429274;
  wire [11:0] out_ui_bit_ior_expr_FU_0_16_16_139_i0_fu_gift64_top_428528_430012;
  wire [15:0] out_ui_bit_ior_expr_FU_0_16_16_140_i0_fu_gift64_top_428528_430015;
  wire [19:0] out_ui_bit_ior_expr_FU_0_32_32_141_i0_fu_gift64_top_428528_430018;
  wire [23:0] out_ui_bit_ior_expr_FU_0_32_32_142_i0_fu_gift64_top_428528_430021;
  wire [27:0] out_ui_bit_ior_expr_FU_0_32_32_143_i0_fu_gift64_top_428528_430024;
  wire [31:0] out_ui_bit_ior_expr_FU_0_32_32_144_i0_fu_gift64_top_428528_430027;
  wire [35:0] out_ui_bit_ior_expr_FU_0_64_64_145_i0_fu_gift64_top_428528_430030;
  wire [39:0] out_ui_bit_ior_expr_FU_0_64_64_146_i0_fu_gift64_top_428528_430033;
  wire [43:0] out_ui_bit_ior_expr_FU_0_64_64_147_i0_fu_gift64_top_428528_430036;
  wire [47:0] out_ui_bit_ior_expr_FU_0_64_64_148_i0_fu_gift64_top_428528_430039;
  wire [51:0] out_ui_bit_ior_expr_FU_0_64_64_149_i0_fu_gift64_top_428528_430042;
  wire [55:0] out_ui_bit_ior_expr_FU_0_64_64_150_i0_fu_gift64_top_428528_430045;
  wire [59:0] out_ui_bit_ior_expr_FU_0_64_64_151_i0_fu_gift64_top_428528_430048;
  wire [63:0] out_ui_bit_ior_expr_FU_0_64_64_152_i0_fu_gift64_top_428528_430051;
  wire [1:0] out_ui_bit_ior_expr_FU_0_8_8_153_i0_fu_gift64_top_428528_429164;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_154_i0_fu_gift64_top_428528_429165;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_155_i0_fu_gift64_top_428528_429169;
  wire [1:0] out_ui_bit_ior_expr_FU_0_8_8_156_i0_fu_gift64_top_428528_429170;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_157_i0_fu_gift64_top_428528_429171;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_158_i0_fu_gift64_top_428528_429175;
  wire [1:0] out_ui_bit_ior_expr_FU_0_8_8_159_i0_fu_gift64_top_428528_429179;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_160_i0_fu_gift64_top_428528_429180;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_161_i0_fu_gift64_top_428528_429184;
  wire [1:0] out_ui_bit_ior_expr_FU_0_8_8_162_i0_fu_gift64_top_428528_429188;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_163_i0_fu_gift64_top_428528_429189;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_164_i0_fu_gift64_top_428528_429190;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_165_i0_fu_gift64_top_428528_429197;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu_gift64_top_428528_429198;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu_gift64_top_428528_429199;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_168_i0_fu_gift64_top_428528_429203;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_169_i0_fu_gift64_top_428528_429204;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_170_i0_fu_gift64_top_428528_429205;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_171_i0_fu_gift64_top_428528_429209;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_172_i0_fu_gift64_top_428528_429210;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_173_i0_fu_gift64_top_428528_429211;
  wire [2:0] out_ui_bit_ior_expr_FU_0_8_8_174_i0_fu_gift64_top_428528_429215;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_175_i0_fu_gift64_top_428528_429216;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_176_i0_fu_gift64_top_428528_429217;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_177_i0_fu_gift64_top_428528_429221;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_178_i0_fu_gift64_top_428528_429222;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_179_i0_fu_gift64_top_428528_429223;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_180_i0_fu_gift64_top_428528_429224;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_181_i0_fu_gift64_top_428528_429225;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_182_i0_fu_gift64_top_428528_429226;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_183_i0_fu_gift64_top_428528_429230;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_184_i0_fu_gift64_top_428528_429231;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_185_i0_fu_gift64_top_428528_429232;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_186_i0_fu_gift64_top_428528_429236;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_187_i0_fu_gift64_top_428528_429237;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_188_i0_fu_gift64_top_428528_429238;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_189_i0_fu_gift64_top_428528_429242;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_190_i0_fu_gift64_top_428528_429243;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_191_i0_fu_gift64_top_428528_429244;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_192_i0_fu_gift64_top_428528_429245;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_193_i0_fu_gift64_top_428528_429246;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_194_i0_fu_gift64_top_428528_429247;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_195_i0_fu_gift64_top_428528_429251;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_196_i0_fu_gift64_top_428528_429252;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_197_i0_fu_gift64_top_428528_429253;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_198_i0_fu_gift64_top_428528_429257;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_199_i0_fu_gift64_top_428528_429258;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_200_i0_fu_gift64_top_428528_429259;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_201_i0_fu_gift64_top_428528_429264;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_202_i0_fu_gift64_top_428528_429268;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_203_i0_fu_gift64_top_428528_429272;
  wire [3:0] out_ui_bit_ior_expr_FU_0_8_8_204_i0_fu_gift64_top_428528_429275;
  wire [7:0] out_ui_bit_ior_expr_FU_0_8_8_205_i0_fu_gift64_top_428528_430008;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i0_fu_gift64_top_428528_429117;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i10_fu_gift64_top_428528_429143;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i11_fu_gift64_top_428528_429145;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i12_fu_gift64_top_428528_429147;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i13_fu_gift64_top_428528_429149;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i14_fu_gift64_top_428528_429153;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i15_fu_gift64_top_428528_429155;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i16_fu_gift64_top_428528_429162;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i17_fu_gift64_top_428528_429167;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i18_fu_gift64_top_428528_429173;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i19_fu_gift64_top_428528_429177;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i1_fu_gift64_top_428528_429119;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i20_fu_gift64_top_428528_429182;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i21_fu_gift64_top_428528_429192;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i22_fu_gift64_top_428528_429195;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i23_fu_gift64_top_428528_429201;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i24_fu_gift64_top_428528_429207;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i25_fu_gift64_top_428528_429219;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i26_fu_gift64_top_428528_429228;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i27_fu_gift64_top_428528_429240;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i28_fu_gift64_top_428528_429249;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i2_fu_gift64_top_428528_429123;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i3_fu_gift64_top_428528_429125;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i4_fu_gift64_top_428528_429127;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i5_fu_gift64_top_428528_429129;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i6_fu_gift64_top_428528_429133;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i7_fu_gift64_top_428528_429135;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i8_fu_gift64_top_428528_429137;
  wire [0:0] out_ui_bit_xor_expr_FU_1_1_1_206_i9_fu_gift64_top_428528_429139;
  wire [3:0] out_ui_bit_xor_expr_FU_8_0_8_207_i0_fu_gift64_top_428528_429260;
  wire [1:0] out_ui_bit_xor_expr_FU_8_8_8_208_i0_fu_gift64_top_428528_429121;
  wire [1:0] out_ui_bit_xor_expr_FU_8_8_8_208_i1_fu_gift64_top_428528_429131;
  wire [1:0] out_ui_bit_xor_expr_FU_8_8_8_208_i2_fu_gift64_top_428528_429141;
  wire [1:0] out_ui_bit_xor_expr_FU_8_8_8_208_i3_fu_gift64_top_428528_429151;
  wire [3:0] out_ui_bit_xor_expr_FU_8_8_8_208_i4_fu_gift64_top_428528_429159;
  wire [1:0] out_ui_bit_xor_expr_FU_8_8_8_208_i5_fu_gift64_top_428528_429186;
  wire [1:0] out_ui_bit_xor_expr_FU_8_8_8_208_i6_fu_gift64_top_428528_429213;
  wire [1:0] out_ui_bit_xor_expr_FU_8_8_8_208_i7_fu_gift64_top_428528_429234;
  wire [1:0] out_ui_bit_xor_expr_FU_8_8_8_208_i8_fu_gift64_top_428528_429255;
  wire out_ui_eq_expr_FU_32_0_32_209_i0_fu_gift64_top_428528_430278;
  wire [11:0] out_ui_lshift_expr_FU_16_0_16_210_i0_fu_gift64_top_428528_430011;
  wire [15:0] out_ui_lshift_expr_FU_16_0_16_211_i0_fu_gift64_top_428528_430014;
  wire [19:0] out_ui_lshift_expr_FU_32_0_32_212_i0_fu_gift64_top_428528_430017;
  wire [23:0] out_ui_lshift_expr_FU_32_0_32_213_i0_fu_gift64_top_428528_430020;
  wire [27:0] out_ui_lshift_expr_FU_32_0_32_214_i0_fu_gift64_top_428528_430023;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_215_i0_fu_gift64_top_428528_430026;
  wire [35:0] out_ui_lshift_expr_FU_64_0_64_216_i0_fu_gift64_top_428528_430029;
  wire [39:0] out_ui_lshift_expr_FU_64_0_64_217_i0_fu_gift64_top_428528_430032;
  wire [43:0] out_ui_lshift_expr_FU_64_0_64_218_i0_fu_gift64_top_428528_430035;
  wire [47:0] out_ui_lshift_expr_FU_64_0_64_219_i0_fu_gift64_top_428528_430038;
  wire [51:0] out_ui_lshift_expr_FU_64_0_64_220_i0_fu_gift64_top_428528_430041;
  wire [55:0] out_ui_lshift_expr_FU_64_0_64_221_i0_fu_gift64_top_428528_430044;
  wire [59:0] out_ui_lshift_expr_FU_64_0_64_222_i0_fu_gift64_top_428528_430047;
  wire [63:0] out_ui_lshift_expr_FU_64_0_64_223_i0_fu_gift64_top_428528_430050;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_224_i0_fu_gift64_top_428528_429161;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_224_i1_fu_gift64_top_428528_429181;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_224_i2_fu_gift64_top_428528_429191;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_224_i3_fu_gift64_top_428528_429218;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_224_i4_fu_gift64_top_428528_429239;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_225_i0_fu_gift64_top_428528_429166;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_226_i0_fu_gift64_top_428528_429172;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_226_i1_fu_gift64_top_428528_429262;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_226_i2_fu_gift64_top_428528_429266;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_226_i3_fu_gift64_top_428528_429270;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_226_i4_fu_gift64_top_428528_429273;
  wire [7:0] out_ui_lshift_expr_FU_8_0_8_227_i0_fu_gift64_top_428528_430007;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i0_fu_gift64_top_428528_430366;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i10_fu_gift64_top_428528_430479;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i11_fu_gift64_top_428528_430493;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i12_fu_gift64_top_428528_430500;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i13_fu_gift64_top_428528_430514;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i14_fu_gift64_top_428528_430528;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i15_fu_gift64_top_428528_430542;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_228_i16_fu_gift64_top_428528_430834;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_228_i17_fu_gift64_top_428528_430841;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_228_i18_fu_gift64_top_428528_430848;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_228_i19_fu_gift64_top_428528_430855;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i1_fu_gift64_top_428528_430381;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i2_fu_gift64_top_428528_430395;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i3_fu_gift64_top_428528_430402;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i4_fu_gift64_top_428528_430409;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i5_fu_gift64_top_428528_430423;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i6_fu_gift64_top_428528_430437;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i7_fu_gift64_top_428528_430444;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i8_fu_gift64_top_428528_430451;
  wire [2:0] out_ui_lshift_expr_FU_8_0_8_228_i9_fu_gift64_top_428528_430465;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i0_fu_gift64_top_428528_430374;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i10_fu_gift64_top_428528_430577;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i11_fu_gift64_top_428528_430605;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i12_fu_gift64_top_428528_430612;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i13_fu_gift64_top_428528_430622;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i14_fu_gift64_top_428528_430629;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i15_fu_gift64_top_428528_430656;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i16_fu_gift64_top_428528_430663;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i17_fu_gift64_top_428528_430697;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i18_fu_gift64_top_428528_430704;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i19_fu_gift64_top_428528_430714;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i1_fu_gift64_top_428528_430388;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i20_fu_gift64_top_428528_430721;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i2_fu_gift64_top_428528_430416;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i3_fu_gift64_top_428528_430430;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i4_fu_gift64_top_428528_430458;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i5_fu_gift64_top_428528_430472;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i6_fu_gift64_top_428528_430486;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i7_fu_gift64_top_428528_430507;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i8_fu_gift64_top_428528_430521;
  wire [3:0] out_ui_lshift_expr_FU_8_0_8_229_i9_fu_gift64_top_428528_430535;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i0_fu_gift64_top_428528_430549;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i10_fu_gift64_top_428528_430687;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i11_fu_gift64_top_428528_430731;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i12_fu_gift64_top_428528_430738;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i13_fu_gift64_top_428528_430745;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i14_fu_gift64_top_428528_430755;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i15_fu_gift64_top_428528_430762;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i16_fu_gift64_top_428528_430772;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i17_fu_gift64_top_428528_430779;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i18_fu_gift64_top_428528_430786;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i19_fu_gift64_top_428528_430796;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i1_fu_gift64_top_428528_430556;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i20_fu_gift64_top_428528_430803;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i21_fu_gift64_top_428528_430813;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i22_fu_gift64_top_428528_430820;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i23_fu_gift64_top_428528_430827;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i2_fu_gift64_top_428528_430563;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i3_fu_gift64_top_428528_430570;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i4_fu_gift64_top_428528_430588;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i5_fu_gift64_top_428528_430595;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i6_fu_gift64_top_428528_430639;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i7_fu_gift64_top_428528_430646;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i8_fu_gift64_top_428528_430670;
  wire [1:0] out_ui_lshift_expr_FU_8_0_8_230_i9_fu_gift64_top_428528_430680;
  wire [31:0] out_ui_plus_expr_FU_32_0_32_231_i0_fu_gift64_top_428528_429276;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i0_fu_gift64_top_428528_429032;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i10_fu_gift64_top_428528_429062;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i11_fu_gift64_top_428528_429065;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i12_fu_gift64_top_428528_429068;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i13_fu_gift64_top_428528_429071;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i14_fu_gift64_top_428528_429074;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i15_fu_gift64_top_428528_429077;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i16_fu_gift64_top_428528_429157;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i1_fu_gift64_top_428528_429035;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i2_fu_gift64_top_428528_429038;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i3_fu_gift64_top_428528_429041;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i4_fu_gift64_top_428528_429044;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i5_fu_gift64_top_428528_429047;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i6_fu_gift64_top_428528_429050;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i7_fu_gift64_top_428528_429053;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i8_fu_gift64_top_428528_429056;
  wire [10:0] out_ui_pointer_plus_expr_FU_16_16_16_232_i9_fu_gift64_top_428528_429059;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_233_i0_fu_gift64_top_428528_428558;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_233_i1_fu_gift64_top_428528_428561;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_233_i2_fu_gift64_top_428528_428564;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_234_i0_fu_gift64_top_428528_428567;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_234_i1_fu_gift64_top_428528_428570;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_234_i2_fu_gift64_top_428528_428573;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_235_i0_fu_gift64_top_428528_428576;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_235_i1_fu_gift64_top_428528_428579;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_235_i2_fu_gift64_top_428528_428582;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_236_i0_fu_gift64_top_428528_428585;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_236_i1_fu_gift64_top_428528_428588;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_236_i2_fu_gift64_top_428528_428591;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_237_i0_fu_gift64_top_428528_428594;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_237_i1_fu_gift64_top_428528_428597;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_237_i2_fu_gift64_top_428528_428600;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_238_i0_fu_gift64_top_428528_428603;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_238_i1_fu_gift64_top_428528_428606;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_238_i2_fu_gift64_top_428528_428609;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_239_i0_fu_gift64_top_428528_428612;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_239_i1_fu_gift64_top_428528_428615;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_239_i2_fu_gift64_top_428528_428618;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_240_i0_fu_gift64_top_428528_428621;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_240_i1_fu_gift64_top_428528_428624;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_240_i2_fu_gift64_top_428528_428627;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_241_i0_fu_gift64_top_428528_428630;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_241_i1_fu_gift64_top_428528_428633;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_241_i2_fu_gift64_top_428528_428636;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_242_i0_fu_gift64_top_428528_428639;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_242_i1_fu_gift64_top_428528_428642;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_242_i2_fu_gift64_top_428528_428645;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_243_i0_fu_gift64_top_428528_428648;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_243_i1_fu_gift64_top_428528_428651;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_243_i2_fu_gift64_top_428528_428654;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_244_i0_fu_gift64_top_428528_428657;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_244_i1_fu_gift64_top_428528_428660;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_244_i2_fu_gift64_top_428528_428663;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_245_i0_fu_gift64_top_428528_428666;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_245_i1_fu_gift64_top_428528_428669;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_245_i2_fu_gift64_top_428528_428672;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_246_i0_fu_gift64_top_428528_428675;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_246_i1_fu_gift64_top_428528_428677;
  wire [3:0] out_ui_rshift_expr_FU_64_0_64_246_i2_fu_gift64_top_428528_428679;
  wire [3:0] out_ui_rshift_expr_FU_8_0_8_247_i0_fu_gift64_top_428528_428555;
  wire [3:0] out_ui_rshift_expr_FU_8_0_8_247_i1_fu_gift64_top_428528_428556;
  wire [3:0] out_ui_rshift_expr_FU_8_0_8_247_i2_fu_gift64_top_428528_428557;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_248_i0_fu_gift64_top_428528_429105;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_248_i1_fu_gift64_top_428528_429108;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_248_i2_fu_gift64_top_428528_429111;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_248_i3_fu_gift64_top_428528_429114;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_248_i4_fu_gift64_top_428528_429176;
  wire [3:0] out_ui_rshift_expr_FU_8_0_8_248_i5_fu_gift64_top_428528_429194;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_248_i6_fu_gift64_top_428528_429206;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_248_i7_fu_gift64_top_428528_429227;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_248_i8_fu_gift64_top_428528_429248;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_249_i0_fu_gift64_top_428528_429106;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_249_i1_fu_gift64_top_428528_429109;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_249_i2_fu_gift64_top_428528_429112;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_249_i3_fu_gift64_top_428528_429115;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_249_i4_fu_gift64_top_428528_429185;
  wire [3:0] out_ui_rshift_expr_FU_8_0_8_249_i5_fu_gift64_top_428528_429200;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_249_i6_fu_gift64_top_428528_429212;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_249_i7_fu_gift64_top_428528_429233;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_249_i8_fu_gift64_top_428528_429254;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_250_i0_fu_gift64_top_428528_429107;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_250_i1_fu_gift64_top_428528_429110;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_250_i2_fu_gift64_top_428528_429113;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_250_i3_fu_gift64_top_428528_429116;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i0_fu_gift64_top_428528_430359;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i10_fu_gift64_top_428528_430475;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i11_fu_gift64_top_428528_430489;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i12_fu_gift64_top_428528_430496;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i13_fu_gift64_top_428528_430510;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i14_fu_gift64_top_428528_430524;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i15_fu_gift64_top_428528_430538;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_251_i16_fu_gift64_top_428528_430830;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_251_i17_fu_gift64_top_428528_430837;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_251_i18_fu_gift64_top_428528_430844;
  wire [1:0] out_ui_rshift_expr_FU_8_0_8_251_i19_fu_gift64_top_428528_430851;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i1_fu_gift64_top_428528_430377;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i2_fu_gift64_top_428528_430391;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i3_fu_gift64_top_428528_430398;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i4_fu_gift64_top_428528_430405;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i5_fu_gift64_top_428528_430419;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i6_fu_gift64_top_428528_430433;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i7_fu_gift64_top_428528_430440;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i8_fu_gift64_top_428528_430447;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_251_i9_fu_gift64_top_428528_430461;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i0_fu_gift64_top_428528_430370;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i10_fu_gift64_top_428528_430573;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i11_fu_gift64_top_428528_430598;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i12_fu_gift64_top_428528_430601;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i13_fu_gift64_top_428528_430608;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i14_fu_gift64_top_428528_430615;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i15_fu_gift64_top_428528_430618;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i16_fu_gift64_top_428528_430625;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i17_fu_gift64_top_428528_430649;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i18_fu_gift64_top_428528_430652;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i19_fu_gift64_top_428528_430659;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i1_fu_gift64_top_428528_430384;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i20_fu_gift64_top_428528_430690;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i21_fu_gift64_top_428528_430693;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i22_fu_gift64_top_428528_430700;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i23_fu_gift64_top_428528_430707;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i24_fu_gift64_top_428528_430710;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i25_fu_gift64_top_428528_430717;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i2_fu_gift64_top_428528_430412;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i3_fu_gift64_top_428528_430426;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i4_fu_gift64_top_428528_430454;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i5_fu_gift64_top_428528_430468;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i6_fu_gift64_top_428528_430482;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i7_fu_gift64_top_428528_430503;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i8_fu_gift64_top_428528_430517;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_252_i9_fu_gift64_top_428528_430531;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i0_fu_gift64_top_428528_430545;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i10_fu_gift64_top_428528_430666;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i11_fu_gift64_top_428528_430673;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i12_fu_gift64_top_428528_430676;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i13_fu_gift64_top_428528_430683;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i14_fu_gift64_top_428528_430724;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i15_fu_gift64_top_428528_430727;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i16_fu_gift64_top_428528_430734;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i17_fu_gift64_top_428528_430741;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i18_fu_gift64_top_428528_430748;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i19_fu_gift64_top_428528_430751;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i1_fu_gift64_top_428528_430552;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i20_fu_gift64_top_428528_430758;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i21_fu_gift64_top_428528_430765;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i22_fu_gift64_top_428528_430768;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i23_fu_gift64_top_428528_430775;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i24_fu_gift64_top_428528_430782;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i25_fu_gift64_top_428528_430789;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i26_fu_gift64_top_428528_430792;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i27_fu_gift64_top_428528_430799;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i28_fu_gift64_top_428528_430806;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i29_fu_gift64_top_428528_430809;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i2_fu_gift64_top_428528_430559;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i30_fu_gift64_top_428528_430816;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i31_fu_gift64_top_428528_430823;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i3_fu_gift64_top_428528_430566;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i4_fu_gift64_top_428528_430580;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i5_fu_gift64_top_428528_430584;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i6_fu_gift64_top_428528_430591;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i7_fu_gift64_top_428528_430632;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i8_fu_gift64_top_428528_430635;
  wire [0:0] out_ui_rshift_expr_FU_8_0_8_253_i9_fu_gift64_top_428528_430642;
  wire [31:0] out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0;
  
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_133_reg_0_0_0_0 (.out1(out_MUX_133_reg_0_0_0_0),
    .sel(selector_MUX_133_reg_0_0_0_0),
    .in1(out_UUdata_converter_FU_46_i0_fu_gift64_top_428528_428676),
    .in2(out_ui_bit_xor_expr_FU_8_0_8_207_i0_fu_gift64_top_428528_429260));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_134_reg_1_0_0_0 (.out1(out_MUX_134_reg_1_0_0_0),
    .sel(selector_MUX_134_reg_1_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i39_fu_gift64_top_428528_428668),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_197_i0_fu_gift64_top_428528_429253));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_135_reg_10_0_0_0 (.out1(out_MUX_135_reg_10_0_0_0),
    .sel(selector_MUX_135_reg_10_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i6_fu_gift64_top_428528_428569),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_164_i0_fu_gift64_top_428528_429190));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_136_reg_11_0_0_0 (.out1(out_MUX_136_reg_11_0_0_0),
    .sel(selector_MUX_136_reg_11_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i3_fu_gift64_top_428528_428560),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_161_i0_fu_gift64_top_428528_429184));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_137_reg_12_0_0_0 (.out1(out_MUX_137_reg_12_0_0_0),
    .sel(selector_MUX_137_reg_12_0_0_0),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_158_i0_fu_gift64_top_428528_429175),
    .in2(out_ui_rshift_expr_FU_8_0_8_247_i0_fu_gift64_top_428528_428555));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_138_reg_13_0_0_0 (.out1(out_MUX_138_reg_13_0_0_0),
    .sel(selector_MUX_138_reg_13_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i0_fu_gift64_top_428528_428550),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_155_i0_fu_gift64_top_428528_429169));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_139_reg_14_0_0_0 (.out1(out_MUX_139_reg_14_0_0_0),
    .sel(selector_MUX_139_reg_14_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i30_fu_gift64_top_428528_428641),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_188_i0_fu_gift64_top_428528_429238));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_140_reg_15_0_0_0 (.out1(out_MUX_140_reg_15_0_0_0),
    .sel(selector_MUX_140_reg_15_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i27_fu_gift64_top_428528_428632),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_185_i0_fu_gift64_top_428528_429232));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_141_reg_16_0_0_0 (.out1(out_MUX_141_reg_16_0_0_0),
    .sel(selector_MUX_141_reg_16_0_0_0),
    .in1(out_reg_17_reg_17),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i1_fu_gift64_top_428528_428552));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_142_reg_17_0_0_0 (.out1(out_MUX_142_reg_17_0_0_0),
    .sel(selector_MUX_142_reg_17_0_0_0),
    .in1(out_reg_32_reg_32),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i22_fu_gift64_top_428528_428617));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_143_reg_18_0_0_0 (.out1(out_MUX_143_reg_18_0_0_0),
    .sel(selector_MUX_143_reg_18_0_0_0),
    .in1(out_reg_19_reg_19),
    .in2(out_ui_rshift_expr_FU_8_0_8_247_i1_fu_gift64_top_428528_428556));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_144_reg_19_0_0_0 (.out1(out_MUX_144_reg_19_0_0_0),
    .sel(selector_MUX_144_reg_19_0_0_0),
    .in1(out_reg_33_reg_33),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i25_fu_gift64_top_428528_428626));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_145_reg_2_0_0_0 (.out1(out_MUX_145_reg_2_0_0_0),
    .sel(selector_MUX_145_reg_2_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i36_fu_gift64_top_428528_428659),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_194_i0_fu_gift64_top_428528_429247));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_146_reg_20_0_0_0 (.out1(out_MUX_146_reg_20_0_0_0),
    .sel(selector_MUX_146_reg_20_0_0_0),
    .in1(out_reg_21_reg_21),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i4_fu_gift64_top_428528_428563));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_147_reg_21_0_0_0 (.out1(out_MUX_147_reg_21_0_0_0),
    .sel(selector_MUX_147_reg_21_0_0_0),
    .in1(out_reg_34_reg_34),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i28_fu_gift64_top_428528_428635));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_148_reg_22_0_0_0 (.out1(out_MUX_148_reg_22_0_0_0),
    .sel(selector_MUX_148_reg_22_0_0_0),
    .in1(out_reg_23_reg_23),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i7_fu_gift64_top_428528_428572));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_149_reg_23_0_0_0 (.out1(out_MUX_149_reg_23_0_0_0),
    .sel(selector_MUX_149_reg_23_0_0_0),
    .in1(out_reg_35_reg_35),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i31_fu_gift64_top_428528_428644));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_150_reg_24_0_0_0 (.out1(out_MUX_150_reg_24_0_0_0),
    .sel(selector_MUX_150_reg_24_0_0_0),
    .in1(out_reg_25_reg_25),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i10_fu_gift64_top_428528_428581));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_151_reg_25_0_0_0 (.out1(out_MUX_151_reg_25_0_0_0),
    .sel(selector_MUX_151_reg_25_0_0_0),
    .in1(out_reg_36_reg_36),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i34_fu_gift64_top_428528_428653));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_152_reg_26_0_0_0 (.out1(out_MUX_152_reg_26_0_0_0),
    .sel(selector_MUX_152_reg_26_0_0_0),
    .in1(out_reg_27_reg_27),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i13_fu_gift64_top_428528_428590));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_153_reg_27_0_0_0 (.out1(out_MUX_153_reg_27_0_0_0),
    .sel(selector_MUX_153_reg_27_0_0_0),
    .in1(out_reg_37_reg_37),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i37_fu_gift64_top_428528_428662));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_154_reg_28_0_0_0 (.out1(out_MUX_154_reg_28_0_0_0),
    .sel(selector_MUX_154_reg_28_0_0_0),
    .in1(out_reg_29_reg_29),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i16_fu_gift64_top_428528_428599));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_155_reg_29_0_0_0 (.out1(out_MUX_155_reg_29_0_0_0),
    .sel(selector_MUX_155_reg_29_0_0_0),
    .in1(out_reg_38_reg_38),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i40_fu_gift64_top_428528_428671));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_156_reg_3_0_0_0 (.out1(out_MUX_156_reg_3_0_0_0),
    .sel(selector_MUX_156_reg_3_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i33_fu_gift64_top_428528_428650),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_191_i0_fu_gift64_top_428528_429244));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_157_reg_30_0_0_0 (.out1(out_MUX_157_reg_30_0_0_0),
    .sel(selector_MUX_157_reg_30_0_0_0),
    .in1(out_reg_31_reg_31),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i19_fu_gift64_top_428528_428608));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_158_reg_31_0_0_0 (.out1(out_MUX_158_reg_31_0_0_0),
    .sel(selector_MUX_158_reg_31_0_0_0),
    .in1(out_reg_39_reg_39),
    .in2(out_UUdata_converter_FU_47_i0_fu_gift64_top_428528_428678));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_159_reg_32_0_0_0 (.out1(out_MUX_159_reg_32_0_0_0),
    .sel(selector_MUX_159_reg_32_0_0_0),
    .in1(out_reg_40_reg_40),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i2_fu_gift64_top_428528_428554));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_160_reg_33_0_0_0 (.out1(out_MUX_160_reg_33_0_0_0),
    .sel(selector_MUX_160_reg_33_0_0_0),
    .in1(out_reg_41_reg_41),
    .in2(out_ui_rshift_expr_FU_8_0_8_247_i2_fu_gift64_top_428528_428557));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_161_reg_34_0_0_0 (.out1(out_MUX_161_reg_34_0_0_0),
    .sel(selector_MUX_161_reg_34_0_0_0),
    .in1(out_reg_42_reg_42),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i5_fu_gift64_top_428528_428566));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_162_reg_35_0_0_0 (.out1(out_MUX_162_reg_35_0_0_0),
    .sel(selector_MUX_162_reg_35_0_0_0),
    .in1(out_reg_43_reg_43),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i8_fu_gift64_top_428528_428575));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_163_reg_36_0_0_0 (.out1(out_MUX_163_reg_36_0_0_0),
    .sel(selector_MUX_163_reg_36_0_0_0),
    .in1(out_reg_44_reg_44),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i11_fu_gift64_top_428528_428584));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_164_reg_37_0_0_0 (.out1(out_MUX_164_reg_37_0_0_0),
    .sel(selector_MUX_164_reg_37_0_0_0),
    .in1(out_reg_45_reg_45),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i14_fu_gift64_top_428528_428593));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_165_reg_38_0_0_0 (.out1(out_MUX_165_reg_38_0_0_0),
    .sel(selector_MUX_165_reg_38_0_0_0),
    .in1(out_reg_46_reg_46),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i17_fu_gift64_top_428528_428602));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_166_reg_39_0_0_0 (.out1(out_MUX_166_reg_39_0_0_0),
    .sel(selector_MUX_166_reg_39_0_0_0),
    .in1(out_reg_47_reg_47),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i20_fu_gift64_top_428528_428611));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_167_reg_4_0_0_0 (.out1(out_MUX_167_reg_4_0_0_0),
    .sel(selector_MUX_167_reg_4_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i24_fu_gift64_top_428528_428623),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_182_i0_fu_gift64_top_428528_429226));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_168_reg_40_0_0_0 (.out1(out_MUX_168_reg_40_0_0_0),
    .sel(selector_MUX_168_reg_40_0_0_0),
    .in1(out_reg_22_reg_22),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i23_fu_gift64_top_428528_428620));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_169_reg_41_0_0_0 (.out1(out_MUX_169_reg_41_0_0_0),
    .sel(selector_MUX_169_reg_41_0_0_0),
    .in1(out_reg_16_reg_16),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i26_fu_gift64_top_428528_428629));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_170_reg_42_0_0_0 (.out1(out_MUX_170_reg_42_0_0_0),
    .sel(selector_MUX_170_reg_42_0_0_0),
    .in1(out_reg_18_reg_18),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i29_fu_gift64_top_428528_428638));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_171_reg_43_0_0_0 (.out1(out_MUX_171_reg_43_0_0_0),
    .sel(selector_MUX_171_reg_43_0_0_0),
    .in1(out_reg_20_reg_20),
    .in2(out_ui_bit_and_expr_FU_8_0_8_136_i32_fu_gift64_top_428528_428647));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_172_reg_44_0_0_0 (.out1(out_MUX_172_reg_44_0_0_0),
    .sel(selector_MUX_172_reg_44_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i35_fu_gift64_top_428528_428656),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_201_i0_fu_gift64_top_428528_429264));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_173_reg_45_0_0_0 (.out1(out_MUX_173_reg_45_0_0_0),
    .sel(selector_MUX_173_reg_45_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i38_fu_gift64_top_428528_428665),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_202_i0_fu_gift64_top_428528_429268));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_174_reg_46_0_0_0 (.out1(out_MUX_174_reg_46_0_0_0),
    .sel(selector_MUX_174_reg_46_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i41_fu_gift64_top_428528_428674),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_203_i0_fu_gift64_top_428528_429272));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_175_reg_47_0_0_0 (.out1(out_MUX_175_reg_47_0_0_0),
    .sel(selector_MUX_175_reg_47_0_0_0),
    .in1(out_UUdata_converter_FU_48_i0_fu_gift64_top_428528_428680),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_204_i0_fu_gift64_top_428528_429275));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_176_reg_48_0_0_0 (.out1(out_MUX_176_reg_48_0_0_0),
    .sel(selector_MUX_176_reg_48_0_0_0),
    .in1(out_ui_plus_expr_FU_32_0_32_231_i0_fu_gift64_top_428528_429276),
    .in2(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_178_reg_5_0_0_0 (.out1(out_MUX_178_reg_5_0_0_0),
    .sel(selector_MUX_178_reg_5_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i21_fu_gift64_top_428528_428614),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_179_i0_fu_gift64_top_428528_429223));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_180_reg_6_0_0_0 (.out1(out_MUX_180_reg_6_0_0_0),
    .sel(selector_MUX_180_reg_6_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i18_fu_gift64_top_428528_428605),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_176_i0_fu_gift64_top_428528_429217));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_181_reg_7_0_0_0 (.out1(out_MUX_181_reg_7_0_0_0),
    .sel(selector_MUX_181_reg_7_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i15_fu_gift64_top_428528_428596),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_173_i0_fu_gift64_top_428528_429211));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_182_reg_8_0_0_0 (.out1(out_MUX_182_reg_8_0_0_0),
    .sel(selector_MUX_182_reg_8_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i12_fu_gift64_top_428528_428587),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_170_i0_fu_gift64_top_428528_429205));
  MUX_GATE #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) MUX_183_reg_9_0_0_0 (.out1(out_MUX_183_reg_9_0_0_0),
    .sel(selector_MUX_183_reg_9_0_0_0),
    .in1(out_ui_bit_and_expr_FU_8_0_8_136_i9_fu_gift64_top_428528_428578),
    .in2(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu_gift64_top_428528_429199));
  UUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) UUdata_converter_FU_uu_conv_0 (.out1(out_uu_conv_conn_obj_0_UUdata_converter_FU_uu_conv_0),
    .in1(out_conv_out_const_0_1_32));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2r(11),
    .PORTSIZE_in2r(2),
    .BITSIZE_in2w(11),
    .PORTSIZE_in2w(2),
    .BITSIZE_in3r(4),
    .PORTSIZE_in3r(2),
    .BITSIZE_in3w(4),
    .PORTSIZE_in3w(2),
    .BITSIZE_in4r(1),
    .PORTSIZE_in4r(2),
    .BITSIZE_in4w(1),
    .PORTSIZE_in4w(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(11),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(8),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(8),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(8),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(4),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("array_ref_429362.mem"),
    .n_elements(16),
    .data_size(8),
    .address_space_begin(MEM_var_429362_428528),
    .address_space_rangesize(1024),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(1),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(8),
    .BITSIZE_proxy_in1(8),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2r(11),
    .PORTSIZE_proxy_in2r(2),
    .BITSIZE_proxy_in2w(11),
    .PORTSIZE_proxy_in2w(2),
    .BITSIZE_proxy_in3r(4),
    .PORTSIZE_proxy_in3r(2),
    .BITSIZE_proxy_in3w(4),
    .PORTSIZE_proxy_in3w(2),
    .BITSIZE_proxy_in4r(1),
    .PORTSIZE_proxy_in4r(2),
    .BITSIZE_proxy_in4w(1),
    .PORTSIZE_proxy_in4w(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(8),
    .PORTSIZE_proxy_out1(2)) array_429362_0 (.out1({out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_429362_0,
      out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_429362_0}),
    .Sout_Rdata_ram({null_out_signal_array_429362_0_Sout_Rdata_ram_1,
      null_out_signal_array_429362_0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_429362_0_Sout_DataRdy_1,
      null_out_signal_array_429362_0_Sout_DataRdy_0}),
    .proxy_out1({null_out_signal_array_429362_0_proxy_out1_1,
      null_out_signal_array_429362_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2r({out_ui_pointer_plus_expr_FU_16_16_16_232_i1_fu_gift64_top_428528_429035,
      out_ui_pointer_plus_expr_FU_16_16_16_232_i0_fu_gift64_top_428528_429032}),
    .in2w({11'b00000000000,
      11'b00000000000}),
    .in3r({out_conv_out_const_1_5_4,
      out_conv_out_const_1_5_4}),
    .in3w({4'b0000,
      4'b0000}),
    .in4r({out_const_2,
      out_const_2}),
    .in4w({1'b0,
      1'b0}),
    .sel_LOAD({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD}),
    .sel_STORE({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({11'b00000000000,
      11'b00000000000}),
    .S_Wdata_ram({8'b00000000,
      8'b00000000}),
    .Sin_Rdata_ram({8'b00000000,
      8'b00000000}),
    .S_data_ram_size({4'b0000,
      4'b0000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1({8'b00000000,
      8'b00000000}),
    .proxy_in2r({11'b00000000000,
      11'b00000000000}),
    .proxy_in2w({11'b00000000000,
      11'b00000000000}),
    .proxy_in3r({4'b0000,
      4'b0000}),
    .proxy_in3w({4'b0000,
      4'b0000}),
    .proxy_in4r({1'b0,
      1'b0}),
    .proxy_in4w({1'b0,
      1'b0}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2r(11),
    .PORTSIZE_in2r(2),
    .BITSIZE_in2w(11),
    .PORTSIZE_in2w(2),
    .BITSIZE_in3r(4),
    .PORTSIZE_in3r(2),
    .BITSIZE_in3w(4),
    .PORTSIZE_in3w(2),
    .BITSIZE_in4r(1),
    .PORTSIZE_in4r(2),
    .BITSIZE_in4w(1),
    .PORTSIZE_in4w(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(11),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(8),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(8),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(8),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(4),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("array_ref_429362.mem"),
    .n_elements(16),
    .data_size(8),
    .address_space_begin(MEM_var_429362_428528),
    .address_space_rangesize(1024),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(1),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(8),
    .BITSIZE_proxy_in1(8),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2r(11),
    .PORTSIZE_proxy_in2r(2),
    .BITSIZE_proxy_in2w(11),
    .PORTSIZE_proxy_in2w(2),
    .BITSIZE_proxy_in3r(4),
    .PORTSIZE_proxy_in3r(2),
    .BITSIZE_proxy_in3w(4),
    .PORTSIZE_proxy_in3w(2),
    .BITSIZE_proxy_in4r(1),
    .PORTSIZE_proxy_in4r(2),
    .BITSIZE_proxy_in4w(1),
    .PORTSIZE_proxy_in4w(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(8),
    .PORTSIZE_proxy_out1(2)) array_429362_1 (.out1({out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_array_429362_1,
      out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_array_429362_1}),
    .Sout_Rdata_ram({null_out_signal_array_429362_1_Sout_Rdata_ram_1,
      null_out_signal_array_429362_1_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_429362_1_Sout_DataRdy_1,
      null_out_signal_array_429362_1_Sout_DataRdy_0}),
    .proxy_out1({null_out_signal_array_429362_1_proxy_out1_1,
      null_out_signal_array_429362_1_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2r({out_ui_pointer_plus_expr_FU_16_16_16_232_i3_fu_gift64_top_428528_429041,
      out_ui_pointer_plus_expr_FU_16_16_16_232_i2_fu_gift64_top_428528_429038}),
    .in2w({11'b00000000000,
      11'b00000000000}),
    .in3r({out_conv_out_const_1_5_4,
      out_conv_out_const_1_5_4}),
    .in3w({4'b0000,
      4'b0000}),
    .in4r({out_const_2,
      out_const_2}),
    .in4w({1'b0,
      1'b0}),
    .sel_LOAD({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_LOAD,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_LOAD}),
    .sel_STORE({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_STORE,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_STORE}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({11'b00000000000,
      11'b00000000000}),
    .S_Wdata_ram({8'b00000000,
      8'b00000000}),
    .Sin_Rdata_ram({8'b00000000,
      8'b00000000}),
    .S_data_ram_size({4'b0000,
      4'b0000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1({8'b00000000,
      8'b00000000}),
    .proxy_in2r({11'b00000000000,
      11'b00000000000}),
    .proxy_in2w({11'b00000000000,
      11'b00000000000}),
    .proxy_in3r({4'b0000,
      4'b0000}),
    .proxy_in3w({4'b0000,
      4'b0000}),
    .proxy_in4r({1'b0,
      1'b0}),
    .proxy_in4w({1'b0,
      1'b0}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2r(11),
    .PORTSIZE_in2r(2),
    .BITSIZE_in2w(11),
    .PORTSIZE_in2w(2),
    .BITSIZE_in3r(4),
    .PORTSIZE_in3r(2),
    .BITSIZE_in3w(4),
    .PORTSIZE_in3w(2),
    .BITSIZE_in4r(1),
    .PORTSIZE_in4r(2),
    .BITSIZE_in4w(1),
    .PORTSIZE_in4w(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(11),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(8),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(8),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(8),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(4),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("array_ref_429362.mem"),
    .n_elements(16),
    .data_size(8),
    .address_space_begin(MEM_var_429362_428528),
    .address_space_rangesize(1024),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(1),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(8),
    .BITSIZE_proxy_in1(8),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2r(11),
    .PORTSIZE_proxy_in2r(2),
    .BITSIZE_proxy_in2w(11),
    .PORTSIZE_proxy_in2w(2),
    .BITSIZE_proxy_in3r(4),
    .PORTSIZE_proxy_in3r(2),
    .BITSIZE_proxy_in3w(4),
    .PORTSIZE_proxy_in3w(2),
    .BITSIZE_proxy_in4r(1),
    .PORTSIZE_proxy_in4r(2),
    .BITSIZE_proxy_in4w(1),
    .PORTSIZE_proxy_in4w(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(8),
    .PORTSIZE_proxy_out1(2)) array_429362_2 (.out1({out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_array_429362_2,
      out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_array_429362_2}),
    .Sout_Rdata_ram({null_out_signal_array_429362_2_Sout_Rdata_ram_1,
      null_out_signal_array_429362_2_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_429362_2_Sout_DataRdy_1,
      null_out_signal_array_429362_2_Sout_DataRdy_0}),
    .proxy_out1({null_out_signal_array_429362_2_proxy_out1_1,
      null_out_signal_array_429362_2_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2r({out_ui_pointer_plus_expr_FU_16_16_16_232_i5_fu_gift64_top_428528_429047,
      out_ui_pointer_plus_expr_FU_16_16_16_232_i4_fu_gift64_top_428528_429044}),
    .in2w({11'b00000000000,
      11'b00000000000}),
    .in3r({out_conv_out_const_1_5_4,
      out_conv_out_const_1_5_4}),
    .in3w({4'b0000,
      4'b0000}),
    .in4r({out_const_2,
      out_const_2}),
    .in4w({1'b0,
      1'b0}),
    .sel_LOAD({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_LOAD,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_LOAD}),
    .sel_STORE({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_STORE,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_STORE}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({11'b00000000000,
      11'b00000000000}),
    .S_Wdata_ram({8'b00000000,
      8'b00000000}),
    .Sin_Rdata_ram({8'b00000000,
      8'b00000000}),
    .S_data_ram_size({4'b0000,
      4'b0000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1({8'b00000000,
      8'b00000000}),
    .proxy_in2r({11'b00000000000,
      11'b00000000000}),
    .proxy_in2w({11'b00000000000,
      11'b00000000000}),
    .proxy_in3r({4'b0000,
      4'b0000}),
    .proxy_in3w({4'b0000,
      4'b0000}),
    .proxy_in4r({1'b0,
      1'b0}),
    .proxy_in4w({1'b0,
      1'b0}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2r(11),
    .PORTSIZE_in2r(2),
    .BITSIZE_in2w(11),
    .PORTSIZE_in2w(2),
    .BITSIZE_in3r(4),
    .PORTSIZE_in3r(2),
    .BITSIZE_in3w(4),
    .PORTSIZE_in3w(2),
    .BITSIZE_in4r(1),
    .PORTSIZE_in4r(2),
    .BITSIZE_in4w(1),
    .PORTSIZE_in4w(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(11),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(8),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(8),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(8),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(4),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("array_ref_429362.mem"),
    .n_elements(16),
    .data_size(8),
    .address_space_begin(MEM_var_429362_428528),
    .address_space_rangesize(1024),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(1),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(8),
    .BITSIZE_proxy_in1(8),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2r(11),
    .PORTSIZE_proxy_in2r(2),
    .BITSIZE_proxy_in2w(11),
    .PORTSIZE_proxy_in2w(2),
    .BITSIZE_proxy_in3r(4),
    .PORTSIZE_proxy_in3r(2),
    .BITSIZE_proxy_in3w(4),
    .PORTSIZE_proxy_in3w(2),
    .BITSIZE_proxy_in4r(1),
    .PORTSIZE_proxy_in4r(2),
    .BITSIZE_proxy_in4w(1),
    .PORTSIZE_proxy_in4w(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(8),
    .PORTSIZE_proxy_out1(2)) array_429362_3 (.out1({out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_array_429362_3,
      out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_array_429362_3}),
    .Sout_Rdata_ram({null_out_signal_array_429362_3_Sout_Rdata_ram_1,
      null_out_signal_array_429362_3_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_429362_3_Sout_DataRdy_1,
      null_out_signal_array_429362_3_Sout_DataRdy_0}),
    .proxy_out1({null_out_signal_array_429362_3_proxy_out1_1,
      null_out_signal_array_429362_3_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2r({out_ui_pointer_plus_expr_FU_16_16_16_232_i7_fu_gift64_top_428528_429053,
      out_ui_pointer_plus_expr_FU_16_16_16_232_i6_fu_gift64_top_428528_429050}),
    .in2w({11'b00000000000,
      11'b00000000000}),
    .in3r({out_conv_out_const_1_5_4,
      out_conv_out_const_1_5_4}),
    .in3w({4'b0000,
      4'b0000}),
    .in4r({out_const_2,
      out_const_2}),
    .in4w({1'b0,
      1'b0}),
    .sel_LOAD({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_LOAD,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_LOAD}),
    .sel_STORE({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_STORE,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_STORE}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({11'b00000000000,
      11'b00000000000}),
    .S_Wdata_ram({8'b00000000,
      8'b00000000}),
    .Sin_Rdata_ram({8'b00000000,
      8'b00000000}),
    .S_data_ram_size({4'b0000,
      4'b0000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1({8'b00000000,
      8'b00000000}),
    .proxy_in2r({11'b00000000000,
      11'b00000000000}),
    .proxy_in2w({11'b00000000000,
      11'b00000000000}),
    .proxy_in3r({4'b0000,
      4'b0000}),
    .proxy_in3w({4'b0000,
      4'b0000}),
    .proxy_in4r({1'b0,
      1'b0}),
    .proxy_in4w({1'b0,
      1'b0}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2r(11),
    .PORTSIZE_in2r(2),
    .BITSIZE_in2w(11),
    .PORTSIZE_in2w(2),
    .BITSIZE_in3r(4),
    .PORTSIZE_in3r(2),
    .BITSIZE_in3w(4),
    .PORTSIZE_in3w(2),
    .BITSIZE_in4r(1),
    .PORTSIZE_in4r(2),
    .BITSIZE_in4w(1),
    .PORTSIZE_in4w(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(11),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(8),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(8),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(8),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(4),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("array_ref_429362.mem"),
    .n_elements(16),
    .data_size(8),
    .address_space_begin(MEM_var_429362_428528),
    .address_space_rangesize(1024),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(1),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(8),
    .BITSIZE_proxy_in1(8),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2r(11),
    .PORTSIZE_proxy_in2r(2),
    .BITSIZE_proxy_in2w(11),
    .PORTSIZE_proxy_in2w(2),
    .BITSIZE_proxy_in3r(4),
    .PORTSIZE_proxy_in3r(2),
    .BITSIZE_proxy_in3w(4),
    .PORTSIZE_proxy_in3w(2),
    .BITSIZE_proxy_in4r(1),
    .PORTSIZE_proxy_in4r(2),
    .BITSIZE_proxy_in4w(1),
    .PORTSIZE_proxy_in4w(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(8),
    .PORTSIZE_proxy_out1(2)) array_429362_4 (.out1({out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_array_429362_4,
      out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_array_429362_4}),
    .Sout_Rdata_ram({null_out_signal_array_429362_4_Sout_Rdata_ram_1,
      null_out_signal_array_429362_4_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_429362_4_Sout_DataRdy_1,
      null_out_signal_array_429362_4_Sout_DataRdy_0}),
    .proxy_out1({null_out_signal_array_429362_4_proxy_out1_1,
      null_out_signal_array_429362_4_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2r({out_ui_pointer_plus_expr_FU_16_16_16_232_i9_fu_gift64_top_428528_429059,
      out_ui_pointer_plus_expr_FU_16_16_16_232_i8_fu_gift64_top_428528_429056}),
    .in2w({11'b00000000000,
      11'b00000000000}),
    .in3r({out_conv_out_const_1_5_4,
      out_conv_out_const_1_5_4}),
    .in3w({4'b0000,
      4'b0000}),
    .in4r({out_const_2,
      out_const_2}),
    .in4w({1'b0,
      1'b0}),
    .sel_LOAD({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_LOAD,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_LOAD}),
    .sel_STORE({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_STORE,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_STORE}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({11'b00000000000,
      11'b00000000000}),
    .S_Wdata_ram({8'b00000000,
      8'b00000000}),
    .Sin_Rdata_ram({8'b00000000,
      8'b00000000}),
    .S_data_ram_size({4'b0000,
      4'b0000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1({8'b00000000,
      8'b00000000}),
    .proxy_in2r({11'b00000000000,
      11'b00000000000}),
    .proxy_in2w({11'b00000000000,
      11'b00000000000}),
    .proxy_in3r({4'b0000,
      4'b0000}),
    .proxy_in3w({4'b0000,
      4'b0000}),
    .proxy_in4r({1'b0,
      1'b0}),
    .proxy_in4w({1'b0,
      1'b0}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2r(11),
    .PORTSIZE_in2r(2),
    .BITSIZE_in2w(11),
    .PORTSIZE_in2w(2),
    .BITSIZE_in3r(4),
    .PORTSIZE_in3r(2),
    .BITSIZE_in3w(4),
    .PORTSIZE_in3w(2),
    .BITSIZE_in4r(1),
    .PORTSIZE_in4r(2),
    .BITSIZE_in4w(1),
    .PORTSIZE_in4w(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(11),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(8),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(8),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(8),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(4),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("array_ref_429362.mem"),
    .n_elements(16),
    .data_size(8),
    .address_space_begin(MEM_var_429362_428528),
    .address_space_rangesize(1024),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(1),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(8),
    .BITSIZE_proxy_in1(8),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2r(11),
    .PORTSIZE_proxy_in2r(2),
    .BITSIZE_proxy_in2w(11),
    .PORTSIZE_proxy_in2w(2),
    .BITSIZE_proxy_in3r(4),
    .PORTSIZE_proxy_in3r(2),
    .BITSIZE_proxy_in3w(4),
    .PORTSIZE_proxy_in3w(2),
    .BITSIZE_proxy_in4r(1),
    .PORTSIZE_proxy_in4r(2),
    .BITSIZE_proxy_in4w(1),
    .PORTSIZE_proxy_in4w(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(8),
    .PORTSIZE_proxy_out1(2)) array_429362_5 (.out1({out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_array_429362_5,
      out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_array_429362_5}),
    .Sout_Rdata_ram({null_out_signal_array_429362_5_Sout_Rdata_ram_1,
      null_out_signal_array_429362_5_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_429362_5_Sout_DataRdy_1,
      null_out_signal_array_429362_5_Sout_DataRdy_0}),
    .proxy_out1({null_out_signal_array_429362_5_proxy_out1_1,
      null_out_signal_array_429362_5_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2r({out_ui_pointer_plus_expr_FU_16_16_16_232_i11_fu_gift64_top_428528_429065,
      out_ui_pointer_plus_expr_FU_16_16_16_232_i10_fu_gift64_top_428528_429062}),
    .in2w({11'b00000000000,
      11'b00000000000}),
    .in3r({out_conv_out_const_1_5_4,
      out_conv_out_const_1_5_4}),
    .in3w({4'b0000,
      4'b0000}),
    .in4r({out_const_2,
      out_const_2}),
    .in4w({1'b0,
      1'b0}),
    .sel_LOAD({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_LOAD,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_LOAD}),
    .sel_STORE({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_STORE,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_STORE}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({11'b00000000000,
      11'b00000000000}),
    .S_Wdata_ram({8'b00000000,
      8'b00000000}),
    .Sin_Rdata_ram({8'b00000000,
      8'b00000000}),
    .S_data_ram_size({4'b0000,
      4'b0000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1({8'b00000000,
      8'b00000000}),
    .proxy_in2r({11'b00000000000,
      11'b00000000000}),
    .proxy_in2w({11'b00000000000,
      11'b00000000000}),
    .proxy_in3r({4'b0000,
      4'b0000}),
    .proxy_in3w({4'b0000,
      4'b0000}),
    .proxy_in4r({1'b0,
      1'b0}),
    .proxy_in4w({1'b0,
      1'b0}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2r(11),
    .PORTSIZE_in2r(2),
    .BITSIZE_in2w(11),
    .PORTSIZE_in2w(2),
    .BITSIZE_in3r(4),
    .PORTSIZE_in3r(2),
    .BITSIZE_in3w(4),
    .PORTSIZE_in3w(2),
    .BITSIZE_in4r(1),
    .PORTSIZE_in4r(2),
    .BITSIZE_in4w(1),
    .PORTSIZE_in4w(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(11),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(8),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(8),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(8),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(4),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("array_ref_429362.mem"),
    .n_elements(16),
    .data_size(8),
    .address_space_begin(MEM_var_429362_428528),
    .address_space_rangesize(1024),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(1),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(8),
    .BITSIZE_proxy_in1(8),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2r(11),
    .PORTSIZE_proxy_in2r(2),
    .BITSIZE_proxy_in2w(11),
    .PORTSIZE_proxy_in2w(2),
    .BITSIZE_proxy_in3r(4),
    .PORTSIZE_proxy_in3r(2),
    .BITSIZE_proxy_in3w(4),
    .PORTSIZE_proxy_in3w(2),
    .BITSIZE_proxy_in4r(1),
    .PORTSIZE_proxy_in4r(2),
    .BITSIZE_proxy_in4w(1),
    .PORTSIZE_proxy_in4w(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(8),
    .PORTSIZE_proxy_out1(2)) array_429362_6 (.out1({out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_array_429362_6,
      out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_array_429362_6}),
    .Sout_Rdata_ram({null_out_signal_array_429362_6_Sout_Rdata_ram_1,
      null_out_signal_array_429362_6_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_429362_6_Sout_DataRdy_1,
      null_out_signal_array_429362_6_Sout_DataRdy_0}),
    .proxy_out1({null_out_signal_array_429362_6_proxy_out1_1,
      null_out_signal_array_429362_6_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2r({out_ui_pointer_plus_expr_FU_16_16_16_232_i13_fu_gift64_top_428528_429071,
      out_ui_pointer_plus_expr_FU_16_16_16_232_i12_fu_gift64_top_428528_429068}),
    .in2w({11'b00000000000,
      11'b00000000000}),
    .in3r({out_conv_out_const_1_5_4,
      out_conv_out_const_1_5_4}),
    .in3w({4'b0000,
      4'b0000}),
    .in4r({out_const_2,
      out_const_2}),
    .in4w({1'b0,
      1'b0}),
    .sel_LOAD({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_LOAD,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_LOAD}),
    .sel_STORE({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_STORE,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_STORE}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({11'b00000000000,
      11'b00000000000}),
    .S_Wdata_ram({8'b00000000,
      8'b00000000}),
    .Sin_Rdata_ram({8'b00000000,
      8'b00000000}),
    .S_data_ram_size({4'b0000,
      4'b0000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1({8'b00000000,
      8'b00000000}),
    .proxy_in2r({11'b00000000000,
      11'b00000000000}),
    .proxy_in2w({11'b00000000000,
      11'b00000000000}),
    .proxy_in3r({4'b0000,
      4'b0000}),
    .proxy_in3w({4'b0000,
      4'b0000}),
    .proxy_in4r({1'b0,
      1'b0}),
    .proxy_in4w({1'b0,
      1'b0}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2r(11),
    .PORTSIZE_in2r(2),
    .BITSIZE_in2w(11),
    .PORTSIZE_in2w(2),
    .BITSIZE_in3r(4),
    .PORTSIZE_in3r(2),
    .BITSIZE_in3w(4),
    .PORTSIZE_in3w(2),
    .BITSIZE_in4r(1),
    .PORTSIZE_in4r(2),
    .BITSIZE_in4w(1),
    .PORTSIZE_in4w(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(11),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(8),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(8),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(8),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(4),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("array_ref_429362.mem"),
    .n_elements(16),
    .data_size(8),
    .address_space_begin(MEM_var_429362_428528),
    .address_space_rangesize(1024),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(1),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(8),
    .BITSIZE_proxy_in1(8),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2r(11),
    .PORTSIZE_proxy_in2r(2),
    .BITSIZE_proxy_in2w(11),
    .PORTSIZE_proxy_in2w(2),
    .BITSIZE_proxy_in3r(4),
    .PORTSIZE_proxy_in3r(2),
    .BITSIZE_proxy_in3w(4),
    .PORTSIZE_proxy_in3w(2),
    .BITSIZE_proxy_in4r(1),
    .PORTSIZE_proxy_in4r(2),
    .BITSIZE_proxy_in4w(1),
    .PORTSIZE_proxy_in4w(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(8),
    .PORTSIZE_proxy_out1(2)) array_429362_7 (.out1({out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_array_429362_7,
      out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_array_429362_7}),
    .Sout_Rdata_ram({null_out_signal_array_429362_7_Sout_Rdata_ram_1,
      null_out_signal_array_429362_7_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_429362_7_Sout_DataRdy_1,
      null_out_signal_array_429362_7_Sout_DataRdy_0}),
    .proxy_out1({null_out_signal_array_429362_7_proxy_out1_1,
      null_out_signal_array_429362_7_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2r({out_ui_pointer_plus_expr_FU_16_16_16_232_i15_fu_gift64_top_428528_429077,
      out_ui_pointer_plus_expr_FU_16_16_16_232_i14_fu_gift64_top_428528_429074}),
    .in2w({11'b00000000000,
      11'b00000000000}),
    .in3r({out_conv_out_const_1_5_4,
      out_conv_out_const_1_5_4}),
    .in3w({4'b0000,
      4'b0000}),
    .in4r({out_const_2,
      out_const_2}),
    .in4w({1'b0,
      1'b0}),
    .sel_LOAD({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_LOAD,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_LOAD}),
    .sel_STORE({fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_STORE,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_STORE}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({11'b00000000000,
      11'b00000000000}),
    .S_Wdata_ram({8'b00000000,
      8'b00000000}),
    .Sin_Rdata_ram({8'b00000000,
      8'b00000000}),
    .S_data_ram_size({4'b0000,
      4'b0000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1({8'b00000000,
      8'b00000000}),
    .proxy_in2r({11'b00000000000,
      11'b00000000000}),
    .proxy_in2w({11'b00000000000,
      11'b00000000000}),
    .proxy_in3r({4'b0000,
      4'b0000}),
    .proxy_in3w({4'b0000,
      4'b0000}),
    .proxy_in4r({1'b0,
      1'b0}),
    .proxy_in4w({1'b0,
      1'b0}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  ARRAY_1D_STD_DISTRAM_NN_SDS #(.BITSIZE_in1(8),
    .PORTSIZE_in1(2),
    .BITSIZE_in2r(11),
    .PORTSIZE_in2r(2),
    .BITSIZE_in2w(11),
    .PORTSIZE_in2w(2),
    .BITSIZE_in3r(4),
    .PORTSIZE_in3r(2),
    .BITSIZE_in3w(4),
    .PORTSIZE_in3w(2),
    .BITSIZE_in4r(1),
    .PORTSIZE_in4r(2),
    .BITSIZE_in4w(1),
    .PORTSIZE_in4w(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_S_oe_ram(1),
    .PORTSIZE_S_oe_ram(2),
    .BITSIZE_S_we_ram(1),
    .PORTSIZE_S_we_ram(2),
    .BITSIZE_out1(8),
    .PORTSIZE_out1(2),
    .BITSIZE_S_addr_ram(11),
    .PORTSIZE_S_addr_ram(2),
    .BITSIZE_S_Wdata_ram(8),
    .PORTSIZE_S_Wdata_ram(2),
    .BITSIZE_Sin_Rdata_ram(8),
    .PORTSIZE_Sin_Rdata_ram(2),
    .BITSIZE_Sout_Rdata_ram(8),
    .PORTSIZE_Sout_Rdata_ram(2),
    .BITSIZE_S_data_ram_size(4),
    .PORTSIZE_S_data_ram_size(2),
    .BITSIZE_Sin_DataRdy(1),
    .PORTSIZE_Sin_DataRdy(2),
    .BITSIZE_Sout_DataRdy(1),
    .PORTSIZE_Sout_DataRdy(2),
    .MEMORY_INIT_file("array_ref_429679.mem"),
    .n_elements(62),
    .data_size(8),
    .address_space_begin(MEM_var_429679_428528),
    .address_space_rangesize(1024),
    .BUS_PIPELINED(1),
    .PRIVATE_MEMORY(1),
    .READ_ONLY_MEMORY(1),
    .USE_SPARSE_MEMORY(1),
    .ALIGNMENT(8),
    .BITSIZE_proxy_in1(8),
    .PORTSIZE_proxy_in1(2),
    .BITSIZE_proxy_in2r(11),
    .PORTSIZE_proxy_in2r(2),
    .BITSIZE_proxy_in2w(11),
    .PORTSIZE_proxy_in2w(2),
    .BITSIZE_proxy_in3r(4),
    .PORTSIZE_proxy_in3r(2),
    .BITSIZE_proxy_in3w(4),
    .PORTSIZE_proxy_in3w(2),
    .BITSIZE_proxy_in4r(1),
    .PORTSIZE_proxy_in4r(2),
    .BITSIZE_proxy_in4w(1),
    .PORTSIZE_proxy_in4w(2),
    .BITSIZE_proxy_sel_LOAD(1),
    .PORTSIZE_proxy_sel_LOAD(2),
    .BITSIZE_proxy_sel_STORE(1),
    .PORTSIZE_proxy_sel_STORE(2),
    .BITSIZE_proxy_out1(8),
    .PORTSIZE_proxy_out1(2)) array_429679_0 (.out1({null_out_signal_array_429679_0_out1_1,
      out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_429679_0}),
    .Sout_Rdata_ram({null_out_signal_array_429679_0_Sout_Rdata_ram_1,
      null_out_signal_array_429679_0_Sout_Rdata_ram_0}),
    .Sout_DataRdy({null_out_signal_array_429679_0_Sout_DataRdy_1,
      null_out_signal_array_429679_0_Sout_DataRdy_0}),
    .proxy_out1({null_out_signal_array_429679_0_proxy_out1_1,
      null_out_signal_array_429679_0_proxy_out1_0}),
    .clock(clock),
    .reset(reset),
    .in1({8'b00000000,
      8'b00000000}),
    .in2r({11'b00000000000,
      out_ui_pointer_plus_expr_FU_16_16_16_232_i16_fu_gift64_top_428528_429157}),
    .in2w({11'b00000000000,
      11'b00000000000}),
    .in3r({4'b0000,
      out_conv_out_const_1_5_4}),
    .in3w({4'b0000,
      4'b0000}),
    .in4r({1'b0,
      out_const_2}),
    .in4w({1'b0,
      1'b0}),
    .sel_LOAD({1'b0,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD}),
    .sel_STORE({1'b0,
      fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE}),
    .S_oe_ram({1'b0,
      1'b0}),
    .S_we_ram({1'b0,
      1'b0}),
    .S_addr_ram({11'b00000000000,
      11'b00000000000}),
    .S_Wdata_ram({8'b00000000,
      8'b00000000}),
    .Sin_Rdata_ram({8'b00000000,
      8'b00000000}),
    .S_data_ram_size({4'b0000,
      4'b0000}),
    .Sin_DataRdy({1'b0,
      1'b0}),
    .proxy_in1({8'b00000000,
      8'b00000000}),
    .proxy_in2r({11'b00000000000,
      11'b00000000000}),
    .proxy_in2w({11'b00000000000,
      11'b00000000000}),
    .proxy_in3r({4'b0000,
      4'b0000}),
    .proxy_in3w({4'b0000,
      4'b0000}),
    .proxy_in4r({1'b0,
      1'b0}),
    .proxy_in4w({1'b0,
      1'b0}),
    .proxy_sel_LOAD({1'b0,
      1'b0}),
    .proxy_sel_STORE({1'b0,
      1'b0}));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b01000)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101000)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b101100)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(11),
    .value(MEM_var_429362_428528)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(11),
    .value(MEM_var_429679_428528)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b11)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1100)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11000)) const_16 (.out1(out_const_16));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110000)) const_17 (.out1(out_const_17));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b110100)) const_18 (.out1(out_const_18));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b11100)) const_19 (.out1(out_const_19));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111000)) const_20 (.out1(out_const_20));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1111)) const_21 (.out1(out_const_21));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b111100)) const_22 (.out1(out_const_22));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10000)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100000)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(6),
    .value(6'b100100)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10100)) const_9 (.out1(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_429362_0_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_429362_0_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_429362_0));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_array_429362_5_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_array_429362_5_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_array_429362_5));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_array_429362_5_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_array_429362_5_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_array_429362_5));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_array_429362_6_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_array_429362_6_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_array_429362_6));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_array_429362_6_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_array_429362_6_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_array_429362_6));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_array_429362_7_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_array_429362_7_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_array_429362_7));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_array_429362_7_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_array_429362_7_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_array_429362_7));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_429362_0_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_429362_0_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_429362_0));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_array_429362_1_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_array_429362_1_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_array_429362_1));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_array_429362_1_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_array_429362_1_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_array_429362_1));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_array_429362_2_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_array_429362_2_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_array_429362_2));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_array_429362_2_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_array_429362_2_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_array_429362_2));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_array_429362_3_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_array_429362_3_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_array_429362_3));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_array_429362_3_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_array_429362_3_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_array_429362_3));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_array_429362_4_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_array_429362_4_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_array_429362_4));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(4)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_array_429362_4_8_4 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_array_429362_4_8_4),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_array_429362_4));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(6)) conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_429679_0_8_6 (.out1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_429679_0_8_6),
    .in1(out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_429679_0));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_const_0_1_32 (.out1(out_conv_out_const_0_1_32),
    .in1(out_const_0));
  UUdata_converter_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(32)) conv_out_const_12_11_32 (.out1(out_conv_out_const_12_11_32),
    .in1(out_const_12));
  UUdata_converter_FU #(.BITSIZE_in1(11),
    .BITSIZE_out1(32)) conv_out_const_13_11_32 (.out1(out_conv_out_const_13_11_32),
    .in1(out_const_13));
  UUdata_converter_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(4)) conv_out_const_1_5_4 (.out1(out_conv_out_const_1_5_4),
    .in1(out_const_1));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(8)) fu_gift64_top_428528_428549 (.out1(out_UUdata_converter_FU_4_i0_fu_gift64_top_428528_428549),
    .in1(in_port_pt));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428550 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i0_fu_gift64_top_428528_428550),
    .in1(out_UUdata_converter_FU_4_i0_fu_gift64_top_428528_428549),
    .in2(out_const_21));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(8)) fu_gift64_top_428528_428551 (.out1(out_UUdata_converter_FU_5_i0_fu_gift64_top_428528_428551),
    .in1(in_port_key_lo));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428552 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i1_fu_gift64_top_428528_428552),
    .in1(out_UUdata_converter_FU_5_i0_fu_gift64_top_428528_428551),
    .in2(out_const_21));
  UUdata_converter_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(8)) fu_gift64_top_428528_428553 (.out1(out_UUdata_converter_FU_6_i0_fu_gift64_top_428528_428553),
    .in1(in_port_key_hi));
  ui_bit_and_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428554 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i2_fu_gift64_top_428528_428554),
    .in1(out_UUdata_converter_FU_6_i0_fu_gift64_top_428528_428553),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_428555 (.out1(out_ui_rshift_expr_FU_8_0_8_247_i0_fu_gift64_top_428528_428555),
    .in1(out_UUdata_converter_FU_4_i0_fu_gift64_top_428528_428549),
    .in2(out_const_4));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_428556 (.out1(out_ui_rshift_expr_FU_8_0_8_247_i1_fu_gift64_top_428528_428556),
    .in1(out_UUdata_converter_FU_5_i0_fu_gift64_top_428528_428551),
    .in2(out_const_4));
  ui_rshift_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_428557 (.out1(out_ui_rshift_expr_FU_8_0_8_247_i2_fu_gift64_top_428528_428557),
    .in1(out_UUdata_converter_FU_6_i0_fu_gift64_top_428528_428553),
    .in2(out_const_4));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428558 (.out1(out_ui_rshift_expr_FU_64_0_64_233_i0_fu_gift64_top_428528_428558),
    .in1(in_port_pt),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428559 (.out1(out_UUdata_converter_FU_7_i0_fu_gift64_top_428528_428559),
    .in1(out_ui_rshift_expr_FU_64_0_64_233_i0_fu_gift64_top_428528_428558));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428560 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i3_fu_gift64_top_428528_428560),
    .in1(out_UUdata_converter_FU_7_i0_fu_gift64_top_428528_428559),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428561 (.out1(out_ui_rshift_expr_FU_64_0_64_233_i1_fu_gift64_top_428528_428561),
    .in1(in_port_key_lo),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428562 (.out1(out_UUdata_converter_FU_8_i0_fu_gift64_top_428528_428562),
    .in1(out_ui_rshift_expr_FU_64_0_64_233_i1_fu_gift64_top_428528_428561));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428563 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i4_fu_gift64_top_428528_428563),
    .in1(out_UUdata_converter_FU_8_i0_fu_gift64_top_428528_428562),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428564 (.out1(out_ui_rshift_expr_FU_64_0_64_233_i2_fu_gift64_top_428528_428564),
    .in1(in_port_key_hi),
    .in2(out_const_5));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428565 (.out1(out_UUdata_converter_FU_9_i0_fu_gift64_top_428528_428565),
    .in1(out_ui_rshift_expr_FU_64_0_64_233_i2_fu_gift64_top_428528_428564));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428566 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i5_fu_gift64_top_428528_428566),
    .in1(out_UUdata_converter_FU_9_i0_fu_gift64_top_428528_428565),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428567 (.out1(out_ui_rshift_expr_FU_64_0_64_234_i0_fu_gift64_top_428528_428567),
    .in1(in_port_pt),
    .in2(out_const_15));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428568 (.out1(out_UUdata_converter_FU_10_i0_fu_gift64_top_428528_428568),
    .in1(out_ui_rshift_expr_FU_64_0_64_234_i0_fu_gift64_top_428528_428567));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428569 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i6_fu_gift64_top_428528_428569),
    .in1(out_UUdata_converter_FU_10_i0_fu_gift64_top_428528_428568),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428570 (.out1(out_ui_rshift_expr_FU_64_0_64_234_i1_fu_gift64_top_428528_428570),
    .in1(in_port_key_lo),
    .in2(out_const_15));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428571 (.out1(out_UUdata_converter_FU_11_i0_fu_gift64_top_428528_428571),
    .in1(out_ui_rshift_expr_FU_64_0_64_234_i1_fu_gift64_top_428528_428570));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428572 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i7_fu_gift64_top_428528_428572),
    .in1(out_UUdata_converter_FU_11_i0_fu_gift64_top_428528_428571),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428573 (.out1(out_ui_rshift_expr_FU_64_0_64_234_i2_fu_gift64_top_428528_428573),
    .in1(in_port_key_hi),
    .in2(out_const_15));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428574 (.out1(out_UUdata_converter_FU_12_i0_fu_gift64_top_428528_428574),
    .in1(out_ui_rshift_expr_FU_64_0_64_234_i2_fu_gift64_top_428528_428573));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428575 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i8_fu_gift64_top_428528_428575),
    .in1(out_UUdata_converter_FU_12_i0_fu_gift64_top_428528_428574),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428576 (.out1(out_ui_rshift_expr_FU_64_0_64_235_i0_fu_gift64_top_428528_428576),
    .in1(in_port_pt),
    .in2(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428577 (.out1(out_UUdata_converter_FU_13_i0_fu_gift64_top_428528_428577),
    .in1(out_ui_rshift_expr_FU_64_0_64_235_i0_fu_gift64_top_428528_428576));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428578 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i9_fu_gift64_top_428528_428578),
    .in1(out_UUdata_converter_FU_13_i0_fu_gift64_top_428528_428577),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428579 (.out1(out_ui_rshift_expr_FU_64_0_64_235_i1_fu_gift64_top_428528_428579),
    .in1(in_port_key_lo),
    .in2(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428580 (.out1(out_UUdata_converter_FU_14_i0_fu_gift64_top_428528_428580),
    .in1(out_ui_rshift_expr_FU_64_0_64_235_i1_fu_gift64_top_428528_428579));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428581 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i10_fu_gift64_top_428528_428581),
    .in1(out_UUdata_converter_FU_14_i0_fu_gift64_top_428528_428580),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428582 (.out1(out_ui_rshift_expr_FU_64_0_64_235_i2_fu_gift64_top_428528_428582),
    .in1(in_port_key_hi),
    .in2(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428583 (.out1(out_UUdata_converter_FU_15_i0_fu_gift64_top_428528_428583),
    .in1(out_ui_rshift_expr_FU_64_0_64_235_i2_fu_gift64_top_428528_428582));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428584 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i11_fu_gift64_top_428528_428584),
    .in1(out_UUdata_converter_FU_15_i0_fu_gift64_top_428528_428583),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428585 (.out1(out_ui_rshift_expr_FU_64_0_64_236_i0_fu_gift64_top_428528_428585),
    .in1(in_port_pt),
    .in2(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428586 (.out1(out_UUdata_converter_FU_16_i0_fu_gift64_top_428528_428586),
    .in1(out_ui_rshift_expr_FU_64_0_64_236_i0_fu_gift64_top_428528_428585));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428587 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i12_fu_gift64_top_428528_428587),
    .in1(out_UUdata_converter_FU_16_i0_fu_gift64_top_428528_428586),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428588 (.out1(out_ui_rshift_expr_FU_64_0_64_236_i1_fu_gift64_top_428528_428588),
    .in1(in_port_key_lo),
    .in2(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428589 (.out1(out_UUdata_converter_FU_17_i0_fu_gift64_top_428528_428589),
    .in1(out_ui_rshift_expr_FU_64_0_64_236_i1_fu_gift64_top_428528_428588));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428590 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i13_fu_gift64_top_428528_428590),
    .in1(out_UUdata_converter_FU_17_i0_fu_gift64_top_428528_428589),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428591 (.out1(out_ui_rshift_expr_FU_64_0_64_236_i2_fu_gift64_top_428528_428591),
    .in1(in_port_key_hi),
    .in2(out_const_9));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428592 (.out1(out_UUdata_converter_FU_18_i0_fu_gift64_top_428528_428592),
    .in1(out_ui_rshift_expr_FU_64_0_64_236_i2_fu_gift64_top_428528_428591));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428593 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i14_fu_gift64_top_428528_428593),
    .in1(out_UUdata_converter_FU_18_i0_fu_gift64_top_428528_428592),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428594 (.out1(out_ui_rshift_expr_FU_64_0_64_237_i0_fu_gift64_top_428528_428594),
    .in1(in_port_pt),
    .in2(out_const_16));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428595 (.out1(out_UUdata_converter_FU_19_i0_fu_gift64_top_428528_428595),
    .in1(out_ui_rshift_expr_FU_64_0_64_237_i0_fu_gift64_top_428528_428594));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428596 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i15_fu_gift64_top_428528_428596),
    .in1(out_UUdata_converter_FU_19_i0_fu_gift64_top_428528_428595),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428597 (.out1(out_ui_rshift_expr_FU_64_0_64_237_i1_fu_gift64_top_428528_428597),
    .in1(in_port_key_lo),
    .in2(out_const_16));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428598 (.out1(out_UUdata_converter_FU_20_i0_fu_gift64_top_428528_428598),
    .in1(out_ui_rshift_expr_FU_64_0_64_237_i1_fu_gift64_top_428528_428597));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428599 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i16_fu_gift64_top_428528_428599),
    .in1(out_UUdata_converter_FU_20_i0_fu_gift64_top_428528_428598),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428600 (.out1(out_ui_rshift_expr_FU_64_0_64_237_i2_fu_gift64_top_428528_428600),
    .in1(in_port_key_hi),
    .in2(out_const_16));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428601 (.out1(out_UUdata_converter_FU_21_i0_fu_gift64_top_428528_428601),
    .in1(out_ui_rshift_expr_FU_64_0_64_237_i2_fu_gift64_top_428528_428600));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428602 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i17_fu_gift64_top_428528_428602),
    .in1(out_UUdata_converter_FU_21_i0_fu_gift64_top_428528_428601),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428603 (.out1(out_ui_rshift_expr_FU_64_0_64_238_i0_fu_gift64_top_428528_428603),
    .in1(in_port_pt),
    .in2(out_const_19));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428604 (.out1(out_UUdata_converter_FU_22_i0_fu_gift64_top_428528_428604),
    .in1(out_ui_rshift_expr_FU_64_0_64_238_i0_fu_gift64_top_428528_428603));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428605 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i18_fu_gift64_top_428528_428605),
    .in1(out_UUdata_converter_FU_22_i0_fu_gift64_top_428528_428604),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428606 (.out1(out_ui_rshift_expr_FU_64_0_64_238_i1_fu_gift64_top_428528_428606),
    .in1(in_port_key_lo),
    .in2(out_const_19));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428607 (.out1(out_UUdata_converter_FU_23_i0_fu_gift64_top_428528_428607),
    .in1(out_ui_rshift_expr_FU_64_0_64_238_i1_fu_gift64_top_428528_428606));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428608 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i19_fu_gift64_top_428528_428608),
    .in1(out_UUdata_converter_FU_23_i0_fu_gift64_top_428528_428607),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(5),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428609 (.out1(out_ui_rshift_expr_FU_64_0_64_238_i2_fu_gift64_top_428528_428609),
    .in1(in_port_key_hi),
    .in2(out_const_19));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428610 (.out1(out_UUdata_converter_FU_24_i0_fu_gift64_top_428528_428610),
    .in1(out_ui_rshift_expr_FU_64_0_64_238_i2_fu_gift64_top_428528_428609));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428611 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i20_fu_gift64_top_428528_428611),
    .in1(out_UUdata_converter_FU_24_i0_fu_gift64_top_428528_428610),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428612 (.out1(out_ui_rshift_expr_FU_64_0_64_239_i0_fu_gift64_top_428528_428612),
    .in1(in_port_pt),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428613 (.out1(out_UUdata_converter_FU_25_i0_fu_gift64_top_428528_428613),
    .in1(out_ui_rshift_expr_FU_64_0_64_239_i0_fu_gift64_top_428528_428612));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428614 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i21_fu_gift64_top_428528_428614),
    .in1(out_UUdata_converter_FU_25_i0_fu_gift64_top_428528_428613),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428615 (.out1(out_ui_rshift_expr_FU_64_0_64_239_i1_fu_gift64_top_428528_428615),
    .in1(in_port_key_lo),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428616 (.out1(out_UUdata_converter_FU_26_i0_fu_gift64_top_428528_428616),
    .in1(out_ui_rshift_expr_FU_64_0_64_239_i1_fu_gift64_top_428528_428615));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428617 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i22_fu_gift64_top_428528_428617),
    .in1(out_UUdata_converter_FU_26_i0_fu_gift64_top_428528_428616),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428618 (.out1(out_ui_rshift_expr_FU_64_0_64_239_i2_fu_gift64_top_428528_428618),
    .in1(in_port_key_hi),
    .in2(out_const_7));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428619 (.out1(out_UUdata_converter_FU_27_i0_fu_gift64_top_428528_428619),
    .in1(out_ui_rshift_expr_FU_64_0_64_239_i2_fu_gift64_top_428528_428618));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428620 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i23_fu_gift64_top_428528_428620),
    .in1(out_UUdata_converter_FU_27_i0_fu_gift64_top_428528_428619),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428621 (.out1(out_ui_rshift_expr_FU_64_0_64_240_i0_fu_gift64_top_428528_428621),
    .in1(in_port_pt),
    .in2(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428622 (.out1(out_UUdata_converter_FU_28_i0_fu_gift64_top_428528_428622),
    .in1(out_ui_rshift_expr_FU_64_0_64_240_i0_fu_gift64_top_428528_428621));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428623 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i24_fu_gift64_top_428528_428623),
    .in1(out_UUdata_converter_FU_28_i0_fu_gift64_top_428528_428622),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428624 (.out1(out_ui_rshift_expr_FU_64_0_64_240_i1_fu_gift64_top_428528_428624),
    .in1(in_port_key_lo),
    .in2(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428625 (.out1(out_UUdata_converter_FU_29_i0_fu_gift64_top_428528_428625),
    .in1(out_ui_rshift_expr_FU_64_0_64_240_i1_fu_gift64_top_428528_428624));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428626 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i25_fu_gift64_top_428528_428626),
    .in1(out_UUdata_converter_FU_29_i0_fu_gift64_top_428528_428625),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428627 (.out1(out_ui_rshift_expr_FU_64_0_64_240_i2_fu_gift64_top_428528_428627),
    .in1(in_port_key_hi),
    .in2(out_const_8));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428628 (.out1(out_UUdata_converter_FU_30_i0_fu_gift64_top_428528_428628),
    .in1(out_ui_rshift_expr_FU_64_0_64_240_i2_fu_gift64_top_428528_428627));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428629 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i26_fu_gift64_top_428528_428629),
    .in1(out_UUdata_converter_FU_30_i0_fu_gift64_top_428528_428628),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428630 (.out1(out_ui_rshift_expr_FU_64_0_64_241_i0_fu_gift64_top_428528_428630),
    .in1(in_port_pt),
    .in2(out_const_10));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428631 (.out1(out_UUdata_converter_FU_31_i0_fu_gift64_top_428528_428631),
    .in1(out_ui_rshift_expr_FU_64_0_64_241_i0_fu_gift64_top_428528_428630));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428632 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i27_fu_gift64_top_428528_428632),
    .in1(out_UUdata_converter_FU_31_i0_fu_gift64_top_428528_428631),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428633 (.out1(out_ui_rshift_expr_FU_64_0_64_241_i1_fu_gift64_top_428528_428633),
    .in1(in_port_key_lo),
    .in2(out_const_10));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428634 (.out1(out_UUdata_converter_FU_32_i0_fu_gift64_top_428528_428634),
    .in1(out_ui_rshift_expr_FU_64_0_64_241_i1_fu_gift64_top_428528_428633));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428635 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i28_fu_gift64_top_428528_428635),
    .in1(out_UUdata_converter_FU_32_i0_fu_gift64_top_428528_428634),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428636 (.out1(out_ui_rshift_expr_FU_64_0_64_241_i2_fu_gift64_top_428528_428636),
    .in1(in_port_key_hi),
    .in2(out_const_10));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428637 (.out1(out_UUdata_converter_FU_33_i0_fu_gift64_top_428528_428637),
    .in1(out_ui_rshift_expr_FU_64_0_64_241_i2_fu_gift64_top_428528_428636));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428638 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i29_fu_gift64_top_428528_428638),
    .in1(out_UUdata_converter_FU_33_i0_fu_gift64_top_428528_428637),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428639 (.out1(out_ui_rshift_expr_FU_64_0_64_242_i0_fu_gift64_top_428528_428639),
    .in1(in_port_pt),
    .in2(out_const_11));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428640 (.out1(out_UUdata_converter_FU_34_i0_fu_gift64_top_428528_428640),
    .in1(out_ui_rshift_expr_FU_64_0_64_242_i0_fu_gift64_top_428528_428639));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428641 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i30_fu_gift64_top_428528_428641),
    .in1(out_UUdata_converter_FU_34_i0_fu_gift64_top_428528_428640),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428642 (.out1(out_ui_rshift_expr_FU_64_0_64_242_i1_fu_gift64_top_428528_428642),
    .in1(in_port_key_lo),
    .in2(out_const_11));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428643 (.out1(out_UUdata_converter_FU_35_i0_fu_gift64_top_428528_428643),
    .in1(out_ui_rshift_expr_FU_64_0_64_242_i1_fu_gift64_top_428528_428642));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428644 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i31_fu_gift64_top_428528_428644),
    .in1(out_UUdata_converter_FU_35_i0_fu_gift64_top_428528_428643),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428645 (.out1(out_ui_rshift_expr_FU_64_0_64_242_i2_fu_gift64_top_428528_428645),
    .in1(in_port_key_hi),
    .in2(out_const_11));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428646 (.out1(out_UUdata_converter_FU_36_i0_fu_gift64_top_428528_428646),
    .in1(out_ui_rshift_expr_FU_64_0_64_242_i2_fu_gift64_top_428528_428645));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428647 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i32_fu_gift64_top_428528_428647),
    .in1(out_UUdata_converter_FU_36_i0_fu_gift64_top_428528_428646),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428648 (.out1(out_ui_rshift_expr_FU_64_0_64_243_i0_fu_gift64_top_428528_428648),
    .in1(in_port_pt),
    .in2(out_const_17));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428649 (.out1(out_UUdata_converter_FU_37_i0_fu_gift64_top_428528_428649),
    .in1(out_ui_rshift_expr_FU_64_0_64_243_i0_fu_gift64_top_428528_428648));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428650 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i33_fu_gift64_top_428528_428650),
    .in1(out_UUdata_converter_FU_37_i0_fu_gift64_top_428528_428649),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428651 (.out1(out_ui_rshift_expr_FU_64_0_64_243_i1_fu_gift64_top_428528_428651),
    .in1(in_port_key_lo),
    .in2(out_const_17));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428652 (.out1(out_UUdata_converter_FU_38_i0_fu_gift64_top_428528_428652),
    .in1(out_ui_rshift_expr_FU_64_0_64_243_i1_fu_gift64_top_428528_428651));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428653 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i34_fu_gift64_top_428528_428653),
    .in1(out_UUdata_converter_FU_38_i0_fu_gift64_top_428528_428652),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428654 (.out1(out_ui_rshift_expr_FU_64_0_64_243_i2_fu_gift64_top_428528_428654),
    .in1(in_port_key_hi),
    .in2(out_const_17));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428655 (.out1(out_UUdata_converter_FU_39_i0_fu_gift64_top_428528_428655),
    .in1(out_ui_rshift_expr_FU_64_0_64_243_i2_fu_gift64_top_428528_428654));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428656 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i35_fu_gift64_top_428528_428656),
    .in1(out_UUdata_converter_FU_39_i0_fu_gift64_top_428528_428655),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428657 (.out1(out_ui_rshift_expr_FU_64_0_64_244_i0_fu_gift64_top_428528_428657),
    .in1(in_port_pt),
    .in2(out_const_18));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428658 (.out1(out_UUdata_converter_FU_40_i0_fu_gift64_top_428528_428658),
    .in1(out_ui_rshift_expr_FU_64_0_64_244_i0_fu_gift64_top_428528_428657));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428659 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i36_fu_gift64_top_428528_428659),
    .in1(out_UUdata_converter_FU_40_i0_fu_gift64_top_428528_428658),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428660 (.out1(out_ui_rshift_expr_FU_64_0_64_244_i1_fu_gift64_top_428528_428660),
    .in1(in_port_key_lo),
    .in2(out_const_18));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428661 (.out1(out_UUdata_converter_FU_41_i0_fu_gift64_top_428528_428661),
    .in1(out_ui_rshift_expr_FU_64_0_64_244_i1_fu_gift64_top_428528_428660));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428662 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i37_fu_gift64_top_428528_428662),
    .in1(out_UUdata_converter_FU_41_i0_fu_gift64_top_428528_428661),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428663 (.out1(out_ui_rshift_expr_FU_64_0_64_244_i2_fu_gift64_top_428528_428663),
    .in1(in_port_key_hi),
    .in2(out_const_18));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428664 (.out1(out_UUdata_converter_FU_42_i0_fu_gift64_top_428528_428664),
    .in1(out_ui_rshift_expr_FU_64_0_64_244_i2_fu_gift64_top_428528_428663));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428665 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i38_fu_gift64_top_428528_428665),
    .in1(out_UUdata_converter_FU_42_i0_fu_gift64_top_428528_428664),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428666 (.out1(out_ui_rshift_expr_FU_64_0_64_245_i0_fu_gift64_top_428528_428666),
    .in1(in_port_pt),
    .in2(out_const_20));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428667 (.out1(out_UUdata_converter_FU_43_i0_fu_gift64_top_428528_428667),
    .in1(out_ui_rshift_expr_FU_64_0_64_245_i0_fu_gift64_top_428528_428666));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428668 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i39_fu_gift64_top_428528_428668),
    .in1(out_UUdata_converter_FU_43_i0_fu_gift64_top_428528_428667),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428669 (.out1(out_ui_rshift_expr_FU_64_0_64_245_i1_fu_gift64_top_428528_428669),
    .in1(in_port_key_lo),
    .in2(out_const_20));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428670 (.out1(out_UUdata_converter_FU_44_i0_fu_gift64_top_428528_428670),
    .in1(out_ui_rshift_expr_FU_64_0_64_245_i1_fu_gift64_top_428528_428669));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428671 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i40_fu_gift64_top_428528_428671),
    .in1(out_UUdata_converter_FU_44_i0_fu_gift64_top_428528_428670),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428672 (.out1(out_ui_rshift_expr_FU_64_0_64_245_i2_fu_gift64_top_428528_428672),
    .in1(in_port_key_hi),
    .in2(out_const_20));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428673 (.out1(out_UUdata_converter_FU_45_i0_fu_gift64_top_428528_428673),
    .in1(out_ui_rshift_expr_FU_64_0_64_245_i2_fu_gift64_top_428528_428672));
  ui_bit_and_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428674 (.out1(out_ui_bit_and_expr_FU_8_0_8_136_i41_fu_gift64_top_428528_428674),
    .in1(out_UUdata_converter_FU_45_i0_fu_gift64_top_428528_428673),
    .in2(out_const_21));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428675 (.out1(out_ui_rshift_expr_FU_64_0_64_246_i0_fu_gift64_top_428528_428675),
    .in1(in_port_pt),
    .in2(out_const_22));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428676 (.out1(out_UUdata_converter_FU_46_i0_fu_gift64_top_428528_428676),
    .in1(out_ui_rshift_expr_FU_64_0_64_246_i0_fu_gift64_top_428528_428675));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428677 (.out1(out_ui_rshift_expr_FU_64_0_64_246_i1_fu_gift64_top_428528_428677),
    .in1(in_port_key_lo),
    .in2(out_const_22));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428678 (.out1(out_UUdata_converter_FU_47_i0_fu_gift64_top_428528_428678),
    .in1(out_ui_rshift_expr_FU_64_0_64_246_i1_fu_gift64_top_428528_428677));
  ui_rshift_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(6),
    .BITSIZE_out1(4),
    .PRECISION(64)) fu_gift64_top_428528_428679 (.out1(out_ui_rshift_expr_FU_64_0_64_246_i2_fu_gift64_top_428528_428679),
    .in1(in_port_key_hi),
    .in2(out_const_22));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_428680 (.out1(out_UUdata_converter_FU_48_i0_fu_gift64_top_428528_428680),
    .in1(out_ui_rshift_expr_FU_64_0_64_246_i2_fu_gift64_top_428528_428679));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429031 (.out1(out_UUdata_converter_FU_100_i0_fu_gift64_top_428528_429031),
    .in1(out_reg_13_reg_13));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429032 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i0_fu_gift64_top_428528_429032),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_100_i0_fu_gift64_top_428528_429031));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429034 (.out1(out_UUdata_converter_FU_101_i0_fu_gift64_top_428528_429034),
    .in1(out_reg_12_reg_12));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429035 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i1_fu_gift64_top_428528_429035),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_101_i0_fu_gift64_top_428528_429034));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429037 (.out1(out_UUdata_converter_FU_102_i0_fu_gift64_top_428528_429037),
    .in1(out_reg_11_reg_11));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429038 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i2_fu_gift64_top_428528_429038),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_102_i0_fu_gift64_top_428528_429037));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429040 (.out1(out_UUdata_converter_FU_103_i0_fu_gift64_top_428528_429040),
    .in1(out_reg_10_reg_10));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429041 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i3_fu_gift64_top_428528_429041),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_103_i0_fu_gift64_top_428528_429040));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429043 (.out1(out_UUdata_converter_FU_104_i0_fu_gift64_top_428528_429043),
    .in1(out_reg_9_reg_9));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429044 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i4_fu_gift64_top_428528_429044),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_104_i0_fu_gift64_top_428528_429043));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429046 (.out1(out_UUdata_converter_FU_105_i0_fu_gift64_top_428528_429046),
    .in1(out_reg_8_reg_8));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429047 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i5_fu_gift64_top_428528_429047),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_105_i0_fu_gift64_top_428528_429046));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429049 (.out1(out_UUdata_converter_FU_106_i0_fu_gift64_top_428528_429049),
    .in1(out_reg_7_reg_7));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429050 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i6_fu_gift64_top_428528_429050),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_106_i0_fu_gift64_top_428528_429049));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429052 (.out1(out_UUdata_converter_FU_107_i0_fu_gift64_top_428528_429052),
    .in1(out_reg_6_reg_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429053 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i7_fu_gift64_top_428528_429053),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_107_i0_fu_gift64_top_428528_429052));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429055 (.out1(out_UUdata_converter_FU_108_i0_fu_gift64_top_428528_429055),
    .in1(out_reg_5_reg_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429056 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i8_fu_gift64_top_428528_429056),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_108_i0_fu_gift64_top_428528_429055));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429058 (.out1(out_UUdata_converter_FU_109_i0_fu_gift64_top_428528_429058),
    .in1(out_reg_4_reg_4));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429059 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i9_fu_gift64_top_428528_429059),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_109_i0_fu_gift64_top_428528_429058));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429061 (.out1(out_UUdata_converter_FU_110_i0_fu_gift64_top_428528_429061),
    .in1(out_reg_15_reg_15));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429062 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i10_fu_gift64_top_428528_429062),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_110_i0_fu_gift64_top_428528_429061));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429064 (.out1(out_UUdata_converter_FU_111_i0_fu_gift64_top_428528_429064),
    .in1(out_reg_14_reg_14));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429065 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i11_fu_gift64_top_428528_429065),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_111_i0_fu_gift64_top_428528_429064));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429067 (.out1(out_UUdata_converter_FU_112_i0_fu_gift64_top_428528_429067),
    .in1(out_reg_3_reg_3));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429068 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i12_fu_gift64_top_428528_429068),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_112_i0_fu_gift64_top_428528_429067));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429070 (.out1(out_UUdata_converter_FU_113_i0_fu_gift64_top_428528_429070),
    .in1(out_reg_2_reg_2));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429071 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i13_fu_gift64_top_428528_429071),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_113_i0_fu_gift64_top_428528_429070));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429073 (.out1(out_UUdata_converter_FU_114_i0_fu_gift64_top_428528_429073),
    .in1(out_reg_1_reg_1));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429074 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i14_fu_gift64_top_428528_429074),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_114_i0_fu_gift64_top_428528_429073));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429076 (.out1(out_UUdata_converter_FU_115_i0_fu_gift64_top_428528_429076),
    .in1(out_reg_0_reg_0));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(4),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429077 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i15_fu_gift64_top_428528_429077),
    .in1(out_reg_49_reg_49),
    .in2(out_UUdata_converter_FU_115_i0_fu_gift64_top_428528_429076));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429079 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i0_fu_gift64_top_428528_429079),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i0_fu_gift64_top_428528_430359),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429080 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i1_fu_gift64_top_428528_429080),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i0_fu_gift64_top_428528_430370),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429081 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i2_fu_gift64_top_428528_429081),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i1_fu_gift64_top_428528_430377),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429082 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i3_fu_gift64_top_428528_429082),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i1_fu_gift64_top_428528_430384),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429083 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i4_fu_gift64_top_428528_429083),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i2_fu_gift64_top_428528_430391),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429084 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i5_fu_gift64_top_428528_429084),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i3_fu_gift64_top_428528_430398),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429085 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i6_fu_gift64_top_428528_429085),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i4_fu_gift64_top_428528_430405),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429086 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i7_fu_gift64_top_428528_429086),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i2_fu_gift64_top_428528_430412),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429087 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i8_fu_gift64_top_428528_429087),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i5_fu_gift64_top_428528_430419),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429088 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i9_fu_gift64_top_428528_429088),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i3_fu_gift64_top_428528_430426),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429089 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i10_fu_gift64_top_428528_429089),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i6_fu_gift64_top_428528_430433),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429090 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i11_fu_gift64_top_428528_429090),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i7_fu_gift64_top_428528_430440),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429091 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i12_fu_gift64_top_428528_429091),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i8_fu_gift64_top_428528_430447),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429092 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i13_fu_gift64_top_428528_429092),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i4_fu_gift64_top_428528_430454),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429093 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i14_fu_gift64_top_428528_429093),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i9_fu_gift64_top_428528_430461),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429094 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i15_fu_gift64_top_428528_429094),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i5_fu_gift64_top_428528_430468),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429095 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i16_fu_gift64_top_428528_429095),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i10_fu_gift64_top_428528_430475),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429096 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i17_fu_gift64_top_428528_429096),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i6_fu_gift64_top_428528_430482),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429097 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i18_fu_gift64_top_428528_429097),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i11_fu_gift64_top_428528_430489),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429098 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i19_fu_gift64_top_428528_429098),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i12_fu_gift64_top_428528_430496),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429099 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i20_fu_gift64_top_428528_429099),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i7_fu_gift64_top_428528_430503),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429100 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i21_fu_gift64_top_428528_429100),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i13_fu_gift64_top_428528_430510),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429101 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i22_fu_gift64_top_428528_429101),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i8_fu_gift64_top_428528_430517),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429102 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i23_fu_gift64_top_428528_429102),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i14_fu_gift64_top_428528_430524),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429103 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i24_fu_gift64_top_428528_429103),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i9_fu_gift64_top_428528_430531),
    .in2(out_const_2));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429104 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i25_fu_gift64_top_428528_429104),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i15_fu_gift64_top_428528_430538),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_429105 (.out1(out_ui_rshift_expr_FU_8_0_8_248_i0_fu_gift64_top_428528_429105),
    .in1(out_reg_16_reg_16),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_429106 (.out1(out_ui_rshift_expr_FU_8_0_8_249_i0_fu_gift64_top_428528_429106),
    .in1(out_reg_16_reg_16),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_429107 (.out1(out_ui_rshift_expr_FU_8_0_8_250_i0_fu_gift64_top_428528_429107),
    .in1(out_reg_16_reg_16),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_429108 (.out1(out_ui_rshift_expr_FU_8_0_8_248_i1_fu_gift64_top_428528_429108),
    .in1(out_reg_18_reg_18),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_429109 (.out1(out_ui_rshift_expr_FU_8_0_8_249_i1_fu_gift64_top_428528_429109),
    .in1(out_reg_18_reg_18),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_429110 (.out1(out_ui_rshift_expr_FU_8_0_8_250_i1_fu_gift64_top_428528_429110),
    .in1(out_reg_18_reg_18),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_429111 (.out1(out_ui_rshift_expr_FU_8_0_8_248_i2_fu_gift64_top_428528_429111),
    .in1(out_reg_20_reg_20),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_429112 (.out1(out_ui_rshift_expr_FU_8_0_8_249_i2_fu_gift64_top_428528_429112),
    .in1(out_reg_20_reg_20),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_429113 (.out1(out_ui_rshift_expr_FU_8_0_8_250_i2_fu_gift64_top_428528_429113),
    .in1(out_reg_20_reg_20),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_429114 (.out1(out_ui_rshift_expr_FU_8_0_8_248_i3_fu_gift64_top_428528_429114),
    .in1(out_reg_22_reg_22),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_429115 (.out1(out_ui_rshift_expr_FU_8_0_8_249_i3_fu_gift64_top_428528_429115),
    .in1(out_reg_22_reg_22),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_429116 (.out1(out_ui_rshift_expr_FU_8_0_8_250_i3_fu_gift64_top_428528_429116),
    .in1(out_reg_22_reg_22),
    .in2(out_const_14));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429117 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i0_fu_gift64_top_428528_429117),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_429362_0_8_4),
    .in2(out_reg_16_reg_16));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429118 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i0_fu_gift64_top_428528_429118),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i0_fu_gift64_top_428528_429117),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429119 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i1_fu_gift64_top_428528_429119),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_array_429362_2_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_248_i0_fu_gift64_top_428528_429105));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429120 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i1_fu_gift64_top_428528_429120),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i1_fu_gift64_top_428528_429119),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429121 (.out1(out_ui_bit_xor_expr_FU_8_8_8_208_i0_fu_gift64_top_428528_429121),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_array_429362_2_8_4),
    .in2(out_reg_24_reg_24));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429122 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i26_fu_gift64_top_428528_429122),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i0_fu_gift64_top_428528_430545),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429123 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i2_fu_gift64_top_428528_429123),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_array_429362_4_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_249_i0_fu_gift64_top_428528_429106));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429124 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i2_fu_gift64_top_428528_429124),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i2_fu_gift64_top_428528_429123),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429125 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i3_fu_gift64_top_428528_429125),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_array_429362_6_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_250_i0_fu_gift64_top_428528_429107));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429126 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i3_fu_gift64_top_428528_429126),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i3_fu_gift64_top_428528_429125),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429127 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i4_fu_gift64_top_428528_429127),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_array_429362_1_8_4),
    .in2(out_reg_18_reg_18));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429128 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i4_fu_gift64_top_428528_429128),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i4_fu_gift64_top_428528_429127),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429129 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i5_fu_gift64_top_428528_429129),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_array_429362_3_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_248_i1_fu_gift64_top_428528_429108));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429130 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i5_fu_gift64_top_428528_429130),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i5_fu_gift64_top_428528_429129),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429131 (.out1(out_ui_bit_xor_expr_FU_8_8_8_208_i1_fu_gift64_top_428528_429131),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_array_429362_2_8_4),
    .in2(out_reg_26_reg_26));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429132 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i27_fu_gift64_top_428528_429132),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i1_fu_gift64_top_428528_430552),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429133 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i6_fu_gift64_top_428528_429133),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_array_429362_5_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_249_i1_fu_gift64_top_428528_429109));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429134 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i6_fu_gift64_top_428528_429134),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i6_fu_gift64_top_428528_429133),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429135 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i7_fu_gift64_top_428528_429135),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_array_429362_7_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_250_i1_fu_gift64_top_428528_429110));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429136 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i7_fu_gift64_top_428528_429136),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i7_fu_gift64_top_428528_429135),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429137 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i8_fu_gift64_top_428528_429137),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_array_429362_1_8_4),
    .in2(out_reg_20_reg_20));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429138 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i8_fu_gift64_top_428528_429138),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i8_fu_gift64_top_428528_429137),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429139 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i9_fu_gift64_top_428528_429139),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_array_429362_3_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_248_i2_fu_gift64_top_428528_429111));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429140 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i9_fu_gift64_top_428528_429140),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i9_fu_gift64_top_428528_429139),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429141 (.out1(out_ui_bit_xor_expr_FU_8_8_8_208_i2_fu_gift64_top_428528_429141),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_array_429362_3_8_4),
    .in2(out_reg_28_reg_28));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429142 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i28_fu_gift64_top_428528_429142),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i2_fu_gift64_top_428528_430559),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429143 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i10_fu_gift64_top_428528_429143),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_array_429362_5_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_249_i2_fu_gift64_top_428528_429112));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429144 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i10_fu_gift64_top_428528_429144),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i10_fu_gift64_top_428528_429143),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429145 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i11_fu_gift64_top_428528_429145),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_array_429362_7_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_250_i2_fu_gift64_top_428528_429113));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429146 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i11_fu_gift64_top_428528_429146),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i11_fu_gift64_top_428528_429145),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429147 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i12_fu_gift64_top_428528_429147),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_429362_0_8_4),
    .in2(out_reg_22_reg_22));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429148 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i12_fu_gift64_top_428528_429148),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i12_fu_gift64_top_428528_429147),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429149 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i13_fu_gift64_top_428528_429149),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_array_429362_2_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_248_i3_fu_gift64_top_428528_429114));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429150 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i13_fu_gift64_top_428528_429150),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i13_fu_gift64_top_428528_429149),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429151 (.out1(out_ui_bit_xor_expr_FU_8_8_8_208_i3_fu_gift64_top_428528_429151),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_array_429362_3_8_4),
    .in2(out_reg_30_reg_30));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429152 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i29_fu_gift64_top_428528_429152),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i3_fu_gift64_top_428528_430566),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429153 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i14_fu_gift64_top_428528_429153),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_array_429362_4_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_249_i3_fu_gift64_top_428528_429115));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429154 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i14_fu_gift64_top_428528_429154),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i14_fu_gift64_top_428528_429153),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429155 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i15_fu_gift64_top_428528_429155),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_array_429362_6_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_250_i3_fu_gift64_top_428528_429116));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429156 (.out1(out_ui_bit_and_expr_FU_1_0_1_135_i15_fu_gift64_top_428528_429156),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i15_fu_gift64_top_428528_429155),
    .in2(out_const_2));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(11),
    .BITSIZE_in2(32),
    .BITSIZE_out1(11),
    .LSB_PARAMETER(0)) fu_gift64_top_428528_429157 (.out1(out_ui_pointer_plus_expr_FU_16_16_16_232_i16_fu_gift64_top_428528_429157),
    .in1(out_reg_50_reg_50),
    .in2(out_reg_48_reg_48));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429159 (.out1(out_ui_bit_xor_expr_FU_8_8_8_208_i4_fu_gift64_top_428528_429159),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_429679_0_8_6),
    .in2(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_array_429362_7_8_4));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429160 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i30_fu_gift64_top_428528_429160),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i10_fu_gift64_top_428528_430573),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_429161 (.out1(out_ui_lshift_expr_FU_8_0_8_224_i0_fu_gift64_top_428528_429161),
    .in1(out_reg_24_reg_24),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429162 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i16_fu_gift64_top_428528_429162),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i4_fu_gift64_top_428528_430580),
    .in2(out_ui_rshift_expr_FU_8_0_8_253_i5_fu_gift64_top_428528_430584));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429163 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i31_fu_gift64_top_428528_429163),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i6_fu_gift64_top_428528_430591),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429164 (.out1(out_ui_bit_ior_expr_FU_0_8_8_153_i0_fu_gift64_top_428528_429164),
    .in1(out_ui_lshift_expr_FU_8_0_8_230_i5_fu_gift64_top_428528_430595),
    .in2(out_ui_bit_and_expr_FU_1_0_1_135_i0_fu_gift64_top_428528_429118));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_gift64_top_428528_429165 (.out1(out_ui_bit_ior_expr_FU_0_8_8_154_i0_fu_gift64_top_428528_429165),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_153_i0_fu_gift64_top_428528_429164),
    .in2(out_ui_lshift_expr_FU_8_0_8_228_i2_fu_gift64_top_428528_430395));
  ui_lshift_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_429166 (.out1(out_ui_lshift_expr_FU_8_0_8_225_i0_fu_gift64_top_428528_429166),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_429679_0_8_6),
    .in2(out_const_14));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429167 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i17_fu_gift64_top_428528_429167),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i11_fu_gift64_top_428528_430598),
    .in2(out_ui_rshift_expr_FU_8_0_8_252_i12_fu_gift64_top_428528_430601));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429168 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i32_fu_gift64_top_428528_429168),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i13_fu_gift64_top_428528_430608),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429169 (.out1(out_ui_bit_ior_expr_FU_0_8_8_155_i0_fu_gift64_top_428528_429169),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_154_i0_fu_gift64_top_428528_429165),
    .in2(out_ui_lshift_expr_FU_8_0_8_229_i12_fu_gift64_top_428528_430612));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429170 (.out1(out_ui_bit_ior_expr_FU_0_8_8_156_i0_fu_gift64_top_428528_429170),
    .in1(out_ui_lshift_expr_FU_8_0_8_230_i0_fu_gift64_top_428528_430549),
    .in2(out_ui_bit_and_expr_FU_1_0_1_135_i1_fu_gift64_top_428528_429120));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_gift64_top_428528_429171 (.out1(out_ui_bit_ior_expr_FU_0_8_8_157_i0_fu_gift64_top_428528_429171),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_156_i0_fu_gift64_top_428528_429170),
    .in2(out_ui_lshift_expr_FU_8_0_8_228_i6_fu_gift64_top_428528_430437));
  ui_lshift_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_429172 (.out1(out_ui_lshift_expr_FU_8_0_8_226_i0_fu_gift64_top_428528_429172),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_429679_0_8_6),
    .in2(out_const_3));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429173 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i18_fu_gift64_top_428528_429173),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i14_fu_gift64_top_428528_430615),
    .in2(out_ui_rshift_expr_FU_8_0_8_252_i15_fu_gift64_top_428528_430618));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429174 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i33_fu_gift64_top_428528_429174),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i16_fu_gift64_top_428528_430625),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429175 (.out1(out_ui_bit_ior_expr_FU_0_8_8_158_i0_fu_gift64_top_428528_429175),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_157_i0_fu_gift64_top_428528_429171),
    .in2(out_ui_lshift_expr_FU_8_0_8_229_i14_fu_gift64_top_428528_430629));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_429176 (.out1(out_ui_rshift_expr_FU_8_0_8_248_i4_fu_gift64_top_428528_429176),
    .in1(out_reg_24_reg_24),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429177 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i19_fu_gift64_top_428528_429177),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i7_fu_gift64_top_428528_430632),
    .in2(out_ui_rshift_expr_FU_8_0_8_253_i8_fu_gift64_top_428528_430635));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429178 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i34_fu_gift64_top_428528_429178),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i9_fu_gift64_top_428528_430642),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429179 (.out1(out_ui_bit_ior_expr_FU_0_8_8_159_i0_fu_gift64_top_428528_429179),
    .in1(out_ui_lshift_expr_FU_8_0_8_230_i7_fu_gift64_top_428528_430646),
    .in2(out_ui_bit_and_expr_FU_1_0_1_135_i2_fu_gift64_top_428528_429124));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_gift64_top_428528_429180 (.out1(out_ui_bit_ior_expr_FU_0_8_8_160_i0_fu_gift64_top_428528_429180),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_159_i0_fu_gift64_top_428528_429179),
    .in2(out_ui_lshift_expr_FU_8_0_8_228_i10_fu_gift64_top_428528_430479));
  ui_lshift_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(1),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_429181 (.out1(out_ui_lshift_expr_FU_8_0_8_224_i1_fu_gift64_top_428528_429181),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_429679_0_8_6),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429182 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i20_fu_gift64_top_428528_429182),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i17_fu_gift64_top_428528_430649),
    .in2(out_ui_rshift_expr_FU_8_0_8_252_i18_fu_gift64_top_428528_430652));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429183 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i35_fu_gift64_top_428528_429183),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i19_fu_gift64_top_428528_430659),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429184 (.out1(out_ui_bit_ior_expr_FU_0_8_8_161_i0_fu_gift64_top_428528_429184),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_160_i0_fu_gift64_top_428528_429180),
    .in2(out_ui_lshift_expr_FU_8_0_8_229_i16_fu_gift64_top_428528_430663));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_429185 (.out1(out_ui_rshift_expr_FU_8_0_8_249_i4_fu_gift64_top_428528_429185),
    .in1(out_reg_24_reg_24),
    .in2(out_const_3));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429186 (.out1(out_ui_bit_xor_expr_FU_8_8_8_208_i5_fu_gift64_top_428528_429186),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_array_429362_6_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_249_i4_fu_gift64_top_428528_429185));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429187 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i36_fu_gift64_top_428528_429187),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i10_fu_gift64_top_428528_430666),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429188 (.out1(out_ui_bit_ior_expr_FU_0_8_8_162_i0_fu_gift64_top_428528_429188),
    .in1(out_ui_lshift_expr_FU_8_0_8_230_i8_fu_gift64_top_428528_430670),
    .in2(out_ui_bit_and_expr_FU_1_0_1_135_i3_fu_gift64_top_428528_429126));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_gift64_top_428528_429189 (.out1(out_ui_bit_ior_expr_FU_0_8_8_163_i0_fu_gift64_top_428528_429189),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_162_i0_fu_gift64_top_428528_429188),
    .in2(out_ui_lshift_expr_FU_8_0_8_228_i14_fu_gift64_top_428528_430528));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429190 (.out1(out_ui_bit_ior_expr_FU_0_8_8_164_i0_fu_gift64_top_428528_429190),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_163_i0_fu_gift64_top_428528_429189),
    .in2(out_ui_lshift_expr_FU_8_0_8_229_i10_fu_gift64_top_428528_430577));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_429191 (.out1(out_ui_lshift_expr_FU_8_0_8_224_i2_fu_gift64_top_428528_429191),
    .in1(out_reg_26_reg_26),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429192 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i21_fu_gift64_top_428528_429192),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i11_fu_gift64_top_428528_430673),
    .in2(out_ui_rshift_expr_FU_8_0_8_253_i12_fu_gift64_top_428528_430676));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429193 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i37_fu_gift64_top_428528_429193),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i13_fu_gift64_top_428528_430683),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(1),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_429194 (.out1(out_ui_rshift_expr_FU_8_0_8_248_i5_fu_gift64_top_428528_429194),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_429679_0_8_6),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429195 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i22_fu_gift64_top_428528_429195),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i20_fu_gift64_top_428528_430690),
    .in2(out_ui_rshift_expr_FU_8_0_8_252_i21_fu_gift64_top_428528_430693));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429196 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i38_fu_gift64_top_428528_429196),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i22_fu_gift64_top_428528_430700),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu_gift64_top_428528_429197 (.out1(out_ui_bit_ior_expr_FU_0_8_8_165_i0_fu_gift64_top_428528_429197),
    .in1(out_ui_lshift_expr_FU_8_0_8_228_i1_fu_gift64_top_428528_430381),
    .in2(out_ui_lshift_expr_FU_8_0_8_230_i10_fu_gift64_top_428528_430687));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(1),
    .BITSIZE_out1(3)) fu_gift64_top_428528_429198 (.out1(out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu_gift64_top_428528_429198),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_165_i0_fu_gift64_top_428528_429197),
    .in2(out_ui_bit_and_expr_FU_1_0_1_135_i4_fu_gift64_top_428528_429128));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429199 (.out1(out_ui_bit_ior_expr_FU_0_8_8_167_i0_fu_gift64_top_428528_429199),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_166_i0_fu_gift64_top_428528_429198),
    .in2(out_ui_lshift_expr_FU_8_0_8_229_i18_fu_gift64_top_428528_430704));
  ui_rshift_expr_FU #(.BITSIZE_in1(6),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_429200 (.out1(out_ui_rshift_expr_FU_8_0_8_249_i5_fu_gift64_top_428528_429200),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_429679_0_8_6),
    .in2(out_const_3));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429201 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i23_fu_gift64_top_428528_429201),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i23_fu_gift64_top_428528_430707),
    .in2(out_ui_rshift_expr_FU_8_0_8_252_i24_fu_gift64_top_428528_430710));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429202 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i39_fu_gift64_top_428528_429202),
    .in1(out_ui_rshift_expr_FU_8_0_8_252_i25_fu_gift64_top_428528_430717),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3)) fu_gift64_top_428528_429203 (.out1(out_ui_bit_ior_expr_FU_0_8_8_168_i0_fu_gift64_top_428528_429203),
    .in1(out_ui_lshift_expr_FU_8_0_8_228_i5_fu_gift64_top_428528_430423),
    .in2(out_ui_lshift_expr_FU_8_0_8_230_i1_fu_gift64_top_428528_430556));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(1),
    .BITSIZE_out1(3)) fu_gift64_top_428528_429204 (.out1(out_ui_bit_ior_expr_FU_0_8_8_169_i0_fu_gift64_top_428528_429204),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_168_i0_fu_gift64_top_428528_429203),
    .in2(out_ui_bit_and_expr_FU_1_0_1_135_i5_fu_gift64_top_428528_429130));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429205 (.out1(out_ui_bit_ior_expr_FU_0_8_8_170_i0_fu_gift64_top_428528_429205),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_169_i0_fu_gift64_top_428528_429204),
    .in2(out_ui_lshift_expr_FU_8_0_8_229_i20_fu_gift64_top_428528_430721));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_429206 (.out1(out_ui_rshift_expr_FU_8_0_8_248_i6_fu_gift64_top_428528_429206),
    .in1(out_reg_26_reg_26),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429207 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i24_fu_gift64_top_428528_429207),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i14_fu_gift64_top_428528_430724),
    .in2(out_ui_rshift_expr_FU_8_0_8_253_i15_fu_gift64_top_428528_430727));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429208 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i40_fu_gift64_top_428528_429208),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i16_fu_gift64_top_428528_430734),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_gift64_top_428528_429209 (.out1(out_ui_bit_ior_expr_FU_0_8_8_171_i0_fu_gift64_top_428528_429209),
    .in1(out_ui_lshift_expr_FU_8_0_8_230_i12_fu_gift64_top_428528_430738),
    .in2(out_ui_lshift_expr_FU_8_0_8_228_i9_fu_gift64_top_428528_430465));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429210 (.out1(out_ui_bit_ior_expr_FU_0_8_8_172_i0_fu_gift64_top_428528_429210),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_171_i0_fu_gift64_top_428528_429209),
    .in2(out_ui_lshift_expr_FU_8_0_8_229_i6_fu_gift64_top_428528_430486));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429211 (.out1(out_ui_bit_ior_expr_FU_0_8_8_173_i0_fu_gift64_top_428528_429211),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_172_i0_fu_gift64_top_428528_429210),
    .in2(out_ui_bit_and_expr_FU_1_0_1_135_i6_fu_gift64_top_428528_429134));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_429212 (.out1(out_ui_rshift_expr_FU_8_0_8_249_i6_fu_gift64_top_428528_429212),
    .in1(out_reg_26_reg_26),
    .in2(out_const_3));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429213 (.out1(out_ui_bit_xor_expr_FU_8_8_8_208_i6_fu_gift64_top_428528_429213),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_array_429362_6_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_249_i6_fu_gift64_top_428528_429212));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429214 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i41_fu_gift64_top_428528_429214),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i17_fu_gift64_top_428528_430741),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(3),
    .BITSIZE_out1(3)) fu_gift64_top_428528_429215 (.out1(out_ui_bit_ior_expr_FU_0_8_8_174_i0_fu_gift64_top_428528_429215),
    .in1(out_ui_lshift_expr_FU_8_0_8_230_i13_fu_gift64_top_428528_430745),
    .in2(out_ui_lshift_expr_FU_8_0_8_228_i13_fu_gift64_top_428528_430514));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429216 (.out1(out_ui_bit_ior_expr_FU_0_8_8_175_i0_fu_gift64_top_428528_429216),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_174_i0_fu_gift64_top_428528_429215),
    .in2(out_ui_lshift_expr_FU_8_0_8_229_i9_fu_gift64_top_428528_430535));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429217 (.out1(out_ui_bit_ior_expr_FU_0_8_8_176_i0_fu_gift64_top_428528_429217),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_175_i0_fu_gift64_top_428528_429216),
    .in2(out_ui_bit_and_expr_FU_1_0_1_135_i7_fu_gift64_top_428528_429136));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_429218 (.out1(out_ui_lshift_expr_FU_8_0_8_224_i3_fu_gift64_top_428528_429218),
    .in1(out_reg_28_reg_28),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429219 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i25_fu_gift64_top_428528_429219),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i18_fu_gift64_top_428528_430748),
    .in2(out_ui_rshift_expr_FU_8_0_8_253_i19_fu_gift64_top_428528_430751));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429220 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i42_fu_gift64_top_428528_429220),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i20_fu_gift64_top_428528_430758),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429221 (.out1(out_ui_bit_ior_expr_FU_0_8_8_177_i0_fu_gift64_top_428528_429221),
    .in1(out_ui_lshift_expr_FU_8_0_8_229_i1_fu_gift64_top_428528_430388),
    .in2(out_ui_lshift_expr_FU_8_0_8_228_i0_fu_gift64_top_428528_430366));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429222 (.out1(out_ui_bit_ior_expr_FU_0_8_8_178_i0_fu_gift64_top_428528_429222),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_177_i0_fu_gift64_top_428528_429221),
    .in2(out_ui_bit_and_expr_FU_1_0_1_135_i8_fu_gift64_top_428528_429138));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429223 (.out1(out_ui_bit_ior_expr_FU_0_8_8_179_i0_fu_gift64_top_428528_429223),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_178_i0_fu_gift64_top_428528_429222),
    .in2(out_ui_lshift_expr_FU_8_0_8_230_i15_fu_gift64_top_428528_430762));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429224 (.out1(out_ui_bit_ior_expr_FU_0_8_8_180_i0_fu_gift64_top_428528_429224),
    .in1(out_ui_lshift_expr_FU_8_0_8_229_i3_fu_gift64_top_428528_430430),
    .in2(out_ui_lshift_expr_FU_8_0_8_228_i4_fu_gift64_top_428528_430409));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429225 (.out1(out_ui_bit_ior_expr_FU_0_8_8_181_i0_fu_gift64_top_428528_429225),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_180_i0_fu_gift64_top_428528_429224),
    .in2(out_ui_bit_and_expr_FU_1_0_1_135_i9_fu_gift64_top_428528_429140));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429226 (.out1(out_ui_bit_ior_expr_FU_0_8_8_182_i0_fu_gift64_top_428528_429226),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_181_i0_fu_gift64_top_428528_429225),
    .in2(out_ui_lshift_expr_FU_8_0_8_230_i2_fu_gift64_top_428528_430563));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_429227 (.out1(out_ui_rshift_expr_FU_8_0_8_248_i7_fu_gift64_top_428528_429227),
    .in1(out_reg_28_reg_28),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429228 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i26_fu_gift64_top_428528_429228),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i21_fu_gift64_top_428528_430765),
    .in2(out_ui_rshift_expr_FU_8_0_8_253_i22_fu_gift64_top_428528_430768));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429229 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i43_fu_gift64_top_428528_429229),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i23_fu_gift64_top_428528_430775),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429230 (.out1(out_ui_bit_ior_expr_FU_0_8_8_183_i0_fu_gift64_top_428528_429230),
    .in1(out_ui_lshift_expr_FU_8_0_8_229_i5_fu_gift64_top_428528_430472),
    .in2(out_ui_lshift_expr_FU_8_0_8_228_i8_fu_gift64_top_428528_430451));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429231 (.out1(out_ui_bit_ior_expr_FU_0_8_8_184_i0_fu_gift64_top_428528_429231),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_183_i0_fu_gift64_top_428528_429230),
    .in2(out_ui_bit_and_expr_FU_1_0_1_135_i10_fu_gift64_top_428528_429144));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429232 (.out1(out_ui_bit_ior_expr_FU_0_8_8_185_i0_fu_gift64_top_428528_429232),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_184_i0_fu_gift64_top_428528_429231),
    .in2(out_ui_lshift_expr_FU_8_0_8_230_i17_fu_gift64_top_428528_430779));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_429233 (.out1(out_ui_rshift_expr_FU_8_0_8_249_i7_fu_gift64_top_428528_429233),
    .in1(out_reg_28_reg_28),
    .in2(out_const_3));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429234 (.out1(out_ui_bit_xor_expr_FU_8_8_8_208_i7_fu_gift64_top_428528_429234),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_array_429362_7_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_249_i7_fu_gift64_top_428528_429233));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429235 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i44_fu_gift64_top_428528_429235),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i24_fu_gift64_top_428528_430782),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429236 (.out1(out_ui_bit_ior_expr_FU_0_8_8_186_i0_fu_gift64_top_428528_429236),
    .in1(out_ui_lshift_expr_FU_8_0_8_229_i8_fu_gift64_top_428528_430521),
    .in2(out_ui_lshift_expr_FU_8_0_8_228_i12_fu_gift64_top_428528_430500));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429237 (.out1(out_ui_bit_ior_expr_FU_0_8_8_187_i0_fu_gift64_top_428528_429237),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_186_i0_fu_gift64_top_428528_429236),
    .in2(out_ui_bit_and_expr_FU_1_0_1_135_i11_fu_gift64_top_428528_429146));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429238 (.out1(out_ui_bit_ior_expr_FU_0_8_8_188_i0_fu_gift64_top_428528_429238),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_187_i0_fu_gift64_top_428528_429237),
    .in2(out_ui_lshift_expr_FU_8_0_8_230_i18_fu_gift64_top_428528_430786));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_429239 (.out1(out_ui_lshift_expr_FU_8_0_8_224_i4_fu_gift64_top_428528_429239),
    .in1(out_reg_30_reg_30),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429240 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i27_fu_gift64_top_428528_429240),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i25_fu_gift64_top_428528_430789),
    .in2(out_ui_rshift_expr_FU_8_0_8_253_i26_fu_gift64_top_428528_430792));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429241 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i45_fu_gift64_top_428528_429241),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i27_fu_gift64_top_428528_430799),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429242 (.out1(out_ui_bit_ior_expr_FU_0_8_8_189_i0_fu_gift64_top_428528_429242),
    .in1(out_ui_bit_and_expr_FU_1_0_1_135_i12_fu_gift64_top_428528_429148),
    .in2(out_ui_lshift_expr_FU_8_0_8_229_i0_fu_gift64_top_428528_430374));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429243 (.out1(out_ui_bit_ior_expr_FU_0_8_8_190_i0_fu_gift64_top_428528_429243),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_189_i0_fu_gift64_top_428528_429242),
    .in2(out_ui_lshift_expr_FU_8_0_8_230_i20_fu_gift64_top_428528_430803));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429244 (.out1(out_ui_bit_ior_expr_FU_0_8_8_191_i0_fu_gift64_top_428528_429244),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_190_i0_fu_gift64_top_428528_429243),
    .in2(out_ui_lshift_expr_FU_8_0_8_228_i3_fu_gift64_top_428528_430402));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429245 (.out1(out_ui_bit_ior_expr_FU_0_8_8_192_i0_fu_gift64_top_428528_429245),
    .in1(out_ui_bit_and_expr_FU_1_0_1_135_i13_fu_gift64_top_428528_429150),
    .in2(out_ui_lshift_expr_FU_8_0_8_229_i2_fu_gift64_top_428528_430416));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429246 (.out1(out_ui_bit_ior_expr_FU_0_8_8_193_i0_fu_gift64_top_428528_429246),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_192_i0_fu_gift64_top_428528_429245),
    .in2(out_ui_lshift_expr_FU_8_0_8_230_i3_fu_gift64_top_428528_430570));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429247 (.out1(out_ui_bit_ior_expr_FU_0_8_8_194_i0_fu_gift64_top_428528_429247),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_193_i0_fu_gift64_top_428528_429246),
    .in2(out_ui_lshift_expr_FU_8_0_8_228_i7_fu_gift64_top_428528_430444));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_429248 (.out1(out_ui_rshift_expr_FU_8_0_8_248_i8_fu_gift64_top_428528_429248),
    .in1(out_reg_30_reg_30),
    .in2(out_const_2));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429249 (.out1(out_ui_bit_xor_expr_FU_1_1_1_206_i28_fu_gift64_top_428528_429249),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i28_fu_gift64_top_428528_430806),
    .in2(out_ui_rshift_expr_FU_8_0_8_253_i29_fu_gift64_top_428528_430809));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429250 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i46_fu_gift64_top_428528_429250),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i30_fu_gift64_top_428528_430816),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429251 (.out1(out_ui_bit_ior_expr_FU_0_8_8_195_i0_fu_gift64_top_428528_429251),
    .in1(out_ui_bit_and_expr_FU_1_0_1_135_i14_fu_gift64_top_428528_429154),
    .in2(out_ui_lshift_expr_FU_8_0_8_229_i4_fu_gift64_top_428528_430458));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429252 (.out1(out_ui_bit_ior_expr_FU_0_8_8_196_i0_fu_gift64_top_428528_429252),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_195_i0_fu_gift64_top_428528_429251),
    .in2(out_ui_lshift_expr_FU_8_0_8_230_i22_fu_gift64_top_428528_430820));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429253 (.out1(out_ui_bit_ior_expr_FU_0_8_8_197_i0_fu_gift64_top_428528_429253),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_196_i0_fu_gift64_top_428528_429252),
    .in2(out_ui_lshift_expr_FU_8_0_8_228_i11_fu_gift64_top_428528_430493));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_429254 (.out1(out_ui_rshift_expr_FU_8_0_8_249_i8_fu_gift64_top_428528_429254),
    .in1(out_reg_30_reg_30),
    .in2(out_const_3));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429255 (.out1(out_ui_bit_xor_expr_FU_8_8_8_208_i8_fu_gift64_top_428528_429255),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_array_429362_7_8_4),
    .in2(out_ui_rshift_expr_FU_8_0_8_249_i8_fu_gift64_top_428528_429254));
  ui_bit_and_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429256 (.out1(out_ui_bit_and_expr_FU_1_0_1_134_i47_fu_gift64_top_428528_429256),
    .in1(out_ui_rshift_expr_FU_8_0_8_253_i31_fu_gift64_top_428528_430823),
    .in2(out_const_2));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429257 (.out1(out_ui_bit_ior_expr_FU_0_8_8_198_i0_fu_gift64_top_428528_429257),
    .in1(out_ui_bit_and_expr_FU_1_0_1_135_i15_fu_gift64_top_428528_429156),
    .in2(out_ui_lshift_expr_FU_8_0_8_229_i7_fu_gift64_top_428528_430507));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429258 (.out1(out_ui_bit_ior_expr_FU_0_8_8_199_i0_fu_gift64_top_428528_429258),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_198_i0_fu_gift64_top_428528_429257),
    .in2(out_ui_lshift_expr_FU_8_0_8_230_i23_fu_gift64_top_428528_430827));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(3),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429259 (.out1(out_ui_bit_ior_expr_FU_0_8_8_200_i0_fu_gift64_top_428528_429259),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_199_i0_fu_gift64_top_428528_429258),
    .in2(out_ui_lshift_expr_FU_8_0_8_228_i15_fu_gift64_top_428528_430542));
  ui_bit_xor_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429260 (.out1(out_ui_bit_xor_expr_FU_8_0_8_207_i0_fu_gift64_top_428528_429260),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_200_i0_fu_gift64_top_428528_429259),
    .in2(out_const_5));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429261 (.out1(out_ui_bit_and_expr_FU_8_0_8_137_i0_fu_gift64_top_428528_429261),
    .in1(out_ui_rshift_expr_FU_8_0_8_249_i4_fu_gift64_top_428528_429185),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_429262 (.out1(out_ui_lshift_expr_FU_8_0_8_226_i1_fu_gift64_top_428528_429262),
    .in1(out_reg_26_reg_26),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429263 (.out1(out_ui_bit_and_expr_FU_8_0_8_138_i0_fu_gift64_top_428528_429263),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i16_fu_gift64_top_428528_430830),
    .in2(out_const_14));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429264 (.out1(out_ui_bit_ior_expr_FU_0_8_8_201_i0_fu_gift64_top_428528_429264),
    .in1(out_ui_lshift_expr_FU_8_0_8_228_i16_fu_gift64_top_428528_430834),
    .in2(out_ui_bit_and_expr_FU_8_0_8_137_i0_fu_gift64_top_428528_429261));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429265 (.out1(out_ui_bit_and_expr_FU_8_0_8_137_i1_fu_gift64_top_428528_429265),
    .in1(out_ui_rshift_expr_FU_8_0_8_249_i6_fu_gift64_top_428528_429212),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_429266 (.out1(out_ui_lshift_expr_FU_8_0_8_226_i2_fu_gift64_top_428528_429266),
    .in1(out_reg_28_reg_28),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429267 (.out1(out_ui_bit_and_expr_FU_8_0_8_138_i1_fu_gift64_top_428528_429267),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i17_fu_gift64_top_428528_430837),
    .in2(out_const_14));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429268 (.out1(out_ui_bit_ior_expr_FU_0_8_8_202_i0_fu_gift64_top_428528_429268),
    .in1(out_ui_lshift_expr_FU_8_0_8_228_i17_fu_gift64_top_428528_430841),
    .in2(out_ui_bit_and_expr_FU_8_0_8_137_i1_fu_gift64_top_428528_429265));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429269 (.out1(out_ui_bit_and_expr_FU_8_0_8_137_i2_fu_gift64_top_428528_429269),
    .in1(out_ui_rshift_expr_FU_8_0_8_249_i7_fu_gift64_top_428528_429233),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_429270 (.out1(out_ui_lshift_expr_FU_8_0_8_226_i3_fu_gift64_top_428528_429270),
    .in1(out_reg_30_reg_30),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429271 (.out1(out_ui_bit_and_expr_FU_8_0_8_138_i2_fu_gift64_top_428528_429271),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i18_fu_gift64_top_428528_430844),
    .in2(out_const_14));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429272 (.out1(out_ui_bit_ior_expr_FU_0_8_8_203_i0_fu_gift64_top_428528_429272),
    .in1(out_ui_lshift_expr_FU_8_0_8_228_i18_fu_gift64_top_428528_430848),
    .in2(out_ui_bit_and_expr_FU_8_0_8_137_i2_fu_gift64_top_428528_429269));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_429273 (.out1(out_ui_lshift_expr_FU_8_0_8_226_i4_fu_gift64_top_428528_429273),
    .in1(out_reg_24_reg_24),
    .in2(out_const_3));
  ui_bit_and_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2)) fu_gift64_top_428528_429274 (.out1(out_ui_bit_and_expr_FU_8_0_8_138_i3_fu_gift64_top_428528_429274),
    .in1(out_ui_rshift_expr_FU_8_0_8_251_i19_fu_gift64_top_428528_430851),
    .in2(out_const_14));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_429275 (.out1(out_ui_bit_ior_expr_FU_0_8_8_204_i0_fu_gift64_top_428528_429275),
    .in1(out_ui_rshift_expr_FU_8_0_8_249_i8_fu_gift64_top_428528_429254),
    .in2(out_ui_lshift_expr_FU_8_0_8_228_i19_fu_gift64_top_428528_430855));
  ui_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_gift64_top_428528_429276 (.out1(out_ui_plus_expr_FU_32_0_32_231_i0_fu_gift64_top_428528_429276),
    .in1(out_reg_48_reg_48),
    .in2(out_const_2));
  UUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_gift64_top_428528_429277 (.out1(out_UUdata_converter_FU_116_i0_fu_gift64_top_428528_429277),
    .in1(out_ui_eq_expr_FU_32_0_32_209_i0_fu_gift64_top_428528_430278));
  read_cond_FU #(.BITSIZE_in1(1)) fu_gift64_top_428528_429278 (.out1(out_read_cond_FU_117_i0_fu_gift64_top_428528_429278),
    .in1(out_UUdata_converter_FU_116_i0_fu_gift64_top_428528_429277));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(3),
    .BITSIZE_out1(8),
    .PRECISION(8)) fu_gift64_top_428528_430007 (.out1(out_ui_lshift_expr_FU_8_0_8_227_i0_fu_gift64_top_428528_430007),
    .in1(out_reg_12_reg_12),
    .in2(out_const_4));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(8),
    .BITSIZE_in2(4),
    .BITSIZE_out1(8)) fu_gift64_top_428528_430008 (.out1(out_ui_bit_ior_expr_FU_0_8_8_205_i0_fu_gift64_top_428528_430008),
    .in1(out_ui_lshift_expr_FU_8_0_8_227_i0_fu_gift64_top_428528_430007),
    .in2(out_reg_13_reg_13));
  UUdata_converter_FU #(.BITSIZE_in1(8),
    .BITSIZE_out1(8)) fu_gift64_top_428528_430009 (.out1(out_UUdata_converter_FU_118_i0_fu_gift64_top_428528_430009),
    .in1(out_ui_bit_ior_expr_FU_0_8_8_205_i0_fu_gift64_top_428528_430008));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_430010 (.out1(out_UUdata_converter_FU_119_i0_fu_gift64_top_428528_430010),
    .in1(out_reg_11_reg_11));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(12),
    .PRECISION(64)) fu_gift64_top_428528_430011 (.out1(out_ui_lshift_expr_FU_16_0_16_210_i0_fu_gift64_top_428528_430011),
    .in1(out_UUdata_converter_FU_119_i0_fu_gift64_top_428528_430010),
    .in2(out_const_5));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(12),
    .BITSIZE_in2(8),
    .BITSIZE_out1(12)) fu_gift64_top_428528_430012 (.out1(out_ui_bit_ior_expr_FU_0_16_16_139_i0_fu_gift64_top_428528_430012),
    .in1(out_ui_lshift_expr_FU_16_0_16_210_i0_fu_gift64_top_428528_430011),
    .in2(out_UUdata_converter_FU_118_i0_fu_gift64_top_428528_430009));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_430013 (.out1(out_UUdata_converter_FU_120_i0_fu_gift64_top_428528_430013),
    .in1(out_reg_10_reg_10));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(4),
    .BITSIZE_out1(16),
    .PRECISION(64)) fu_gift64_top_428528_430014 (.out1(out_ui_lshift_expr_FU_16_0_16_211_i0_fu_gift64_top_428528_430014),
    .in1(out_UUdata_converter_FU_120_i0_fu_gift64_top_428528_430013),
    .in2(out_const_15));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(16),
    .BITSIZE_in2(12),
    .BITSIZE_out1(16)) fu_gift64_top_428528_430015 (.out1(out_ui_bit_ior_expr_FU_0_16_16_140_i0_fu_gift64_top_428528_430015),
    .in1(out_ui_lshift_expr_FU_16_0_16_211_i0_fu_gift64_top_428528_430014),
    .in2(out_ui_bit_ior_expr_FU_0_16_16_139_i0_fu_gift64_top_428528_430012));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_430016 (.out1(out_UUdata_converter_FU_121_i0_fu_gift64_top_428528_430016),
    .in1(out_reg_9_reg_9));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(5),
    .BITSIZE_out1(20),
    .PRECISION(64)) fu_gift64_top_428528_430017 (.out1(out_ui_lshift_expr_FU_32_0_32_212_i0_fu_gift64_top_428528_430017),
    .in1(out_UUdata_converter_FU_121_i0_fu_gift64_top_428528_430016),
    .in2(out_const_6));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(20),
    .BITSIZE_in2(16),
    .BITSIZE_out1(20)) fu_gift64_top_428528_430018 (.out1(out_ui_bit_ior_expr_FU_0_32_32_141_i0_fu_gift64_top_428528_430018),
    .in1(out_ui_lshift_expr_FU_32_0_32_212_i0_fu_gift64_top_428528_430017),
    .in2(out_ui_bit_ior_expr_FU_0_16_16_140_i0_fu_gift64_top_428528_430015));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_430019 (.out1(out_UUdata_converter_FU_122_i0_fu_gift64_top_428528_430019),
    .in1(out_reg_8_reg_8));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(5),
    .BITSIZE_out1(24),
    .PRECISION(64)) fu_gift64_top_428528_430020 (.out1(out_ui_lshift_expr_FU_32_0_32_213_i0_fu_gift64_top_428528_430020),
    .in1(out_UUdata_converter_FU_122_i0_fu_gift64_top_428528_430019),
    .in2(out_const_9));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(24),
    .BITSIZE_in2(20),
    .BITSIZE_out1(24)) fu_gift64_top_428528_430021 (.out1(out_ui_bit_ior_expr_FU_0_32_32_142_i0_fu_gift64_top_428528_430021),
    .in1(out_ui_lshift_expr_FU_32_0_32_213_i0_fu_gift64_top_428528_430020),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_141_i0_fu_gift64_top_428528_430018));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_430022 (.out1(out_UUdata_converter_FU_123_i0_fu_gift64_top_428528_430022),
    .in1(out_reg_7_reg_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(5),
    .BITSIZE_out1(28),
    .PRECISION(64)) fu_gift64_top_428528_430023 (.out1(out_ui_lshift_expr_FU_32_0_32_214_i0_fu_gift64_top_428528_430023),
    .in1(out_UUdata_converter_FU_123_i0_fu_gift64_top_428528_430022),
    .in2(out_const_16));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(28),
    .BITSIZE_in2(24),
    .BITSIZE_out1(28)) fu_gift64_top_428528_430024 (.out1(out_ui_bit_ior_expr_FU_0_32_32_143_i0_fu_gift64_top_428528_430024),
    .in1(out_ui_lshift_expr_FU_32_0_32_214_i0_fu_gift64_top_428528_430023),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_142_i0_fu_gift64_top_428528_430021));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_430025 (.out1(out_UUdata_converter_FU_124_i0_fu_gift64_top_428528_430025),
    .in1(out_reg_6_reg_6));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(5),
    .BITSIZE_out1(32),
    .PRECISION(64)) fu_gift64_top_428528_430026 (.out1(out_ui_lshift_expr_FU_32_0_32_215_i0_fu_gift64_top_428528_430026),
    .in1(out_UUdata_converter_FU_124_i0_fu_gift64_top_428528_430025),
    .in2(out_const_19));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(28),
    .BITSIZE_out1(32)) fu_gift64_top_428528_430027 (.out1(out_ui_bit_ior_expr_FU_0_32_32_144_i0_fu_gift64_top_428528_430027),
    .in1(out_ui_lshift_expr_FU_32_0_32_215_i0_fu_gift64_top_428528_430026),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_143_i0_fu_gift64_top_428528_430024));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_430028 (.out1(out_UUdata_converter_FU_125_i0_fu_gift64_top_428528_430028),
    .in1(out_reg_5_reg_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(6),
    .BITSIZE_out1(36),
    .PRECISION(64)) fu_gift64_top_428528_430029 (.out1(out_ui_lshift_expr_FU_64_0_64_216_i0_fu_gift64_top_428528_430029),
    .in1(out_UUdata_converter_FU_125_i0_fu_gift64_top_428528_430028),
    .in2(out_const_7));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(36),
    .BITSIZE_in2(32),
    .BITSIZE_out1(36)) fu_gift64_top_428528_430030 (.out1(out_ui_bit_ior_expr_FU_0_64_64_145_i0_fu_gift64_top_428528_430030),
    .in1(out_ui_lshift_expr_FU_64_0_64_216_i0_fu_gift64_top_428528_430029),
    .in2(out_ui_bit_ior_expr_FU_0_32_32_144_i0_fu_gift64_top_428528_430027));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_430031 (.out1(out_UUdata_converter_FU_126_i0_fu_gift64_top_428528_430031),
    .in1(out_reg_4_reg_4));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(6),
    .BITSIZE_out1(40),
    .PRECISION(64)) fu_gift64_top_428528_430032 (.out1(out_ui_lshift_expr_FU_64_0_64_217_i0_fu_gift64_top_428528_430032),
    .in1(out_UUdata_converter_FU_126_i0_fu_gift64_top_428528_430031),
    .in2(out_const_8));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(40),
    .BITSIZE_in2(36),
    .BITSIZE_out1(40)) fu_gift64_top_428528_430033 (.out1(out_ui_bit_ior_expr_FU_0_64_64_146_i0_fu_gift64_top_428528_430033),
    .in1(out_ui_lshift_expr_FU_64_0_64_217_i0_fu_gift64_top_428528_430032),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_145_i0_fu_gift64_top_428528_430030));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_430034 (.out1(out_UUdata_converter_FU_127_i0_fu_gift64_top_428528_430034),
    .in1(out_reg_15_reg_15));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(6),
    .BITSIZE_out1(44),
    .PRECISION(64)) fu_gift64_top_428528_430035 (.out1(out_ui_lshift_expr_FU_64_0_64_218_i0_fu_gift64_top_428528_430035),
    .in1(out_UUdata_converter_FU_127_i0_fu_gift64_top_428528_430034),
    .in2(out_const_10));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(44),
    .BITSIZE_in2(40),
    .BITSIZE_out1(44)) fu_gift64_top_428528_430036 (.out1(out_ui_bit_ior_expr_FU_0_64_64_147_i0_fu_gift64_top_428528_430036),
    .in1(out_ui_lshift_expr_FU_64_0_64_218_i0_fu_gift64_top_428528_430035),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_146_i0_fu_gift64_top_428528_430033));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_430037 (.out1(out_UUdata_converter_FU_128_i0_fu_gift64_top_428528_430037),
    .in1(out_reg_14_reg_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(6),
    .BITSIZE_out1(48),
    .PRECISION(64)) fu_gift64_top_428528_430038 (.out1(out_ui_lshift_expr_FU_64_0_64_219_i0_fu_gift64_top_428528_430038),
    .in1(out_UUdata_converter_FU_128_i0_fu_gift64_top_428528_430037),
    .in2(out_const_11));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(48),
    .BITSIZE_in2(44),
    .BITSIZE_out1(48)) fu_gift64_top_428528_430039 (.out1(out_ui_bit_ior_expr_FU_0_64_64_148_i0_fu_gift64_top_428528_430039),
    .in1(out_ui_lshift_expr_FU_64_0_64_219_i0_fu_gift64_top_428528_430038),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_147_i0_fu_gift64_top_428528_430036));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_430040 (.out1(out_UUdata_converter_FU_129_i0_fu_gift64_top_428528_430040),
    .in1(out_reg_3_reg_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(6),
    .BITSIZE_out1(52),
    .PRECISION(64)) fu_gift64_top_428528_430041 (.out1(out_ui_lshift_expr_FU_64_0_64_220_i0_fu_gift64_top_428528_430041),
    .in1(out_UUdata_converter_FU_129_i0_fu_gift64_top_428528_430040),
    .in2(out_const_17));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(52),
    .BITSIZE_in2(48),
    .BITSIZE_out1(52)) fu_gift64_top_428528_430042 (.out1(out_ui_bit_ior_expr_FU_0_64_64_149_i0_fu_gift64_top_428528_430042),
    .in1(out_ui_lshift_expr_FU_64_0_64_220_i0_fu_gift64_top_428528_430041),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_148_i0_fu_gift64_top_428528_430039));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_430043 (.out1(out_UUdata_converter_FU_130_i0_fu_gift64_top_428528_430043),
    .in1(out_reg_2_reg_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(6),
    .BITSIZE_out1(56),
    .PRECISION(64)) fu_gift64_top_428528_430044 (.out1(out_ui_lshift_expr_FU_64_0_64_221_i0_fu_gift64_top_428528_430044),
    .in1(out_UUdata_converter_FU_130_i0_fu_gift64_top_428528_430043),
    .in2(out_const_18));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(56),
    .BITSIZE_in2(52),
    .BITSIZE_out1(56)) fu_gift64_top_428528_430045 (.out1(out_ui_bit_ior_expr_FU_0_64_64_150_i0_fu_gift64_top_428528_430045),
    .in1(out_ui_lshift_expr_FU_64_0_64_221_i0_fu_gift64_top_428528_430044),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_149_i0_fu_gift64_top_428528_430042));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_430046 (.out1(out_UUdata_converter_FU_131_i0_fu_gift64_top_428528_430046),
    .in1(out_reg_1_reg_1));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(6),
    .BITSIZE_out1(60),
    .PRECISION(64)) fu_gift64_top_428528_430047 (.out1(out_ui_lshift_expr_FU_64_0_64_222_i0_fu_gift64_top_428528_430047),
    .in1(out_UUdata_converter_FU_131_i0_fu_gift64_top_428528_430046),
    .in2(out_const_20));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(60),
    .BITSIZE_in2(56),
    .BITSIZE_out1(60)) fu_gift64_top_428528_430048 (.out1(out_ui_bit_ior_expr_FU_0_64_64_151_i0_fu_gift64_top_428528_430048),
    .in1(out_ui_lshift_expr_FU_64_0_64_222_i0_fu_gift64_top_428528_430047),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_150_i0_fu_gift64_top_428528_430045));
  UUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) fu_gift64_top_428528_430049 (.out1(out_UUdata_converter_FU_132_i0_fu_gift64_top_428528_430049),
    .in1(out_reg_0_reg_0));
  ui_lshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(6),
    .BITSIZE_out1(64),
    .PRECISION(64)) fu_gift64_top_428528_430050 (.out1(out_ui_lshift_expr_FU_64_0_64_223_i0_fu_gift64_top_428528_430050),
    .in1(out_UUdata_converter_FU_132_i0_fu_gift64_top_428528_430049),
    .in2(out_const_22));
  ui_bit_ior_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_in2(60),
    .BITSIZE_out1(64)) fu_gift64_top_428528_430051 (.out1(out_ui_bit_ior_expr_FU_0_64_64_152_i0_fu_gift64_top_428528_430051),
    .in1(out_ui_lshift_expr_FU_64_0_64_223_i0_fu_gift64_top_428528_430050),
    .in2(out_ui_bit_ior_expr_FU_0_64_64_151_i0_fu_gift64_top_428528_430048));
  ui_eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(5),
    .BITSIZE_out1(1)) fu_gift64_top_428528_430278 (.out1(out_ui_eq_expr_FU_32_0_32_209_i0_fu_gift64_top_428528_430278),
    .in1(out_ui_plus_expr_FU_32_0_32_231_i0_fu_gift64_top_428528_429276),
    .in2(out_const_19));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(11)) fu_gift64_top_428528_430283 (.out1(out_addr_expr_FU_49_i0_fu_gift64_top_428528_430283),
    .in1(out_conv_out_const_12_11_32));
  addr_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(11)) fu_gift64_top_428528_430348 (.out1(out_addr_expr_FU_50_i0_fu_gift64_top_428528_430348),
    .in1(out_conv_out_const_13_11_32));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430359 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i0_fu_gift64_top_428528_430359),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_429362_0_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430366 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i0_fu_gift64_top_428528_430366),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i0_fu_gift64_top_428528_429079),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430370 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i0_fu_gift64_top_428528_430370),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_429362_0_8_4),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430374 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i0_fu_gift64_top_428528_430374),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i1_fu_gift64_top_428528_429080),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430377 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i1_fu_gift64_top_428528_430377),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_429362_0_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430381 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i1_fu_gift64_top_428528_430381),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i2_fu_gift64_top_428528_429081),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430384 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i1_fu_gift64_top_428528_430384),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_429362_0_8_4),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430388 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i1_fu_gift64_top_428528_430388),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i3_fu_gift64_top_428528_429082),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430391 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i2_fu_gift64_top_428528_430391),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_array_429362_1_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430395 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i2_fu_gift64_top_428528_430395),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i4_fu_gift64_top_428528_429083),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430398 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i3_fu_gift64_top_428528_430398),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_array_429362_1_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430402 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i3_fu_gift64_top_428528_430402),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i5_fu_gift64_top_428528_429084),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430405 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i4_fu_gift64_top_428528_430405),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_array_429362_2_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430409 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i4_fu_gift64_top_428528_430409),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i6_fu_gift64_top_428528_429085),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430412 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i2_fu_gift64_top_428528_430412),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_array_429362_2_8_4),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430416 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i2_fu_gift64_top_428528_430416),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i7_fu_gift64_top_428528_429086),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430419 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i5_fu_gift64_top_428528_430419),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_array_429362_2_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430423 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i5_fu_gift64_top_428528_430423),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i8_fu_gift64_top_428528_429087),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430426 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i3_fu_gift64_top_428528_430426),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_array_429362_2_8_4),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430430 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i3_fu_gift64_top_428528_430430),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i9_fu_gift64_top_428528_429088),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430433 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i6_fu_gift64_top_428528_430433),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_array_429362_3_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430437 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i6_fu_gift64_top_428528_430437),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i10_fu_gift64_top_428528_429089),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430440 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i7_fu_gift64_top_428528_430440),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_array_429362_3_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430444 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i7_fu_gift64_top_428528_430444),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i11_fu_gift64_top_428528_429090),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430447 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i8_fu_gift64_top_428528_430447),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_array_429362_4_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430451 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i8_fu_gift64_top_428528_430451),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i12_fu_gift64_top_428528_429091),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430454 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i4_fu_gift64_top_428528_430454),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_array_429362_4_8_4),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430458 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i4_fu_gift64_top_428528_430458),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i13_fu_gift64_top_428528_429092),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430461 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i9_fu_gift64_top_428528_430461),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_array_429362_4_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430465 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i9_fu_gift64_top_428528_430465),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i14_fu_gift64_top_428528_429093),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430468 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i5_fu_gift64_top_428528_430468),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_array_429362_4_8_4),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430472 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i5_fu_gift64_top_428528_430472),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i15_fu_gift64_top_428528_429094),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430475 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i10_fu_gift64_top_428528_430475),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_array_429362_5_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430479 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i10_fu_gift64_top_428528_430479),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i16_fu_gift64_top_428528_429095),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430482 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i6_fu_gift64_top_428528_430482),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_array_429362_5_8_4),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430486 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i6_fu_gift64_top_428528_430486),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i17_fu_gift64_top_428528_429096),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430489 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i11_fu_gift64_top_428528_430489),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_array_429362_5_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430493 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i11_fu_gift64_top_428528_430493),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i18_fu_gift64_top_428528_429097),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430496 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i12_fu_gift64_top_428528_430496),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_array_429362_6_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430500 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i12_fu_gift64_top_428528_430500),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i19_fu_gift64_top_428528_429098),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430503 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i7_fu_gift64_top_428528_430503),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_array_429362_6_8_4),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430507 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i7_fu_gift64_top_428528_430507),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i20_fu_gift64_top_428528_429099),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430510 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i13_fu_gift64_top_428528_430510),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_array_429362_6_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430514 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i13_fu_gift64_top_428528_430514),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i21_fu_gift64_top_428528_429100),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430517 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i8_fu_gift64_top_428528_430517),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_array_429362_6_8_4),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430521 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i8_fu_gift64_top_428528_430521),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i22_fu_gift64_top_428528_429101),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430524 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i14_fu_gift64_top_428528_430524),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_array_429362_7_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430528 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i14_fu_gift64_top_428528_430528),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i23_fu_gift64_top_428528_429102),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430531 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i9_fu_gift64_top_428528_430531),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_array_429362_7_8_4),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430535 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i9_fu_gift64_top_428528_430535),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i24_fu_gift64_top_428528_429103),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430538 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i15_fu_gift64_top_428528_430538),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_array_429362_7_8_4),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(3),
    .PRECISION(8)) fu_gift64_top_428528_430542 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i15_fu_gift64_top_428528_430542),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i25_fu_gift64_top_428528_429104),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430545 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i0_fu_gift64_top_428528_430545),
    .in1(out_ui_bit_xor_expr_FU_8_8_8_208_i0_fu_gift64_top_428528_429121),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430549 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i0_fu_gift64_top_428528_430549),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i26_fu_gift64_top_428528_429122),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430552 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i1_fu_gift64_top_428528_430552),
    .in1(out_ui_bit_xor_expr_FU_8_8_8_208_i1_fu_gift64_top_428528_429131),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430556 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i1_fu_gift64_top_428528_430556),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i27_fu_gift64_top_428528_429132),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430559 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i2_fu_gift64_top_428528_430559),
    .in1(out_ui_bit_xor_expr_FU_8_8_8_208_i2_fu_gift64_top_428528_429141),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430563 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i2_fu_gift64_top_428528_430563),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i28_fu_gift64_top_428528_429142),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430566 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i3_fu_gift64_top_428528_430566),
    .in1(out_ui_bit_xor_expr_FU_8_8_8_208_i3_fu_gift64_top_428528_429151),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430570 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i3_fu_gift64_top_428528_430570),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i29_fu_gift64_top_428528_429152),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430573 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i10_fu_gift64_top_428528_430573),
    .in1(out_ui_bit_xor_expr_FU_8_8_8_208_i4_fu_gift64_top_428528_429159),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430577 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i10_fu_gift64_top_428528_430577),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i30_fu_gift64_top_428528_429160),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430580 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i4_fu_gift64_top_428528_430580),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_array_429362_0_8_4),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430584 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i5_fu_gift64_top_428528_430584),
    .in1(out_ui_lshift_expr_FU_8_0_8_224_i0_fu_gift64_top_428528_429161),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430588 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i4_fu_gift64_top_428528_430588),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i16_fu_gift64_top_428528_429162),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430591 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i6_fu_gift64_top_428528_430591),
    .in1(out_ui_lshift_expr_FU_8_0_8_230_i4_fu_gift64_top_428528_430588),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430595 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i5_fu_gift64_top_428528_430595),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i31_fu_gift64_top_428528_429163),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430598 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i11_fu_gift64_top_428528_430598),
    .in1(out_ui_lshift_expr_FU_8_0_8_225_i0_fu_gift64_top_428528_429166),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430601 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i12_fu_gift64_top_428528_430601),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_array_429362_1_8_4),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430605 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i11_fu_gift64_top_428528_430605),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i17_fu_gift64_top_428528_429167),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430608 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i13_fu_gift64_top_428528_430608),
    .in1(out_ui_lshift_expr_FU_8_0_8_229_i11_fu_gift64_top_428528_430605),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430612 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i12_fu_gift64_top_428528_430612),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i32_fu_gift64_top_428528_429168),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430615 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i14_fu_gift64_top_428528_430615),
    .in1(out_ui_lshift_expr_FU_8_0_8_226_i0_fu_gift64_top_428528_429172),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430618 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i15_fu_gift64_top_428528_430618),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_array_429362_3_8_4),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430622 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i13_fu_gift64_top_428528_430622),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i18_fu_gift64_top_428528_429173),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430625 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i16_fu_gift64_top_428528_430625),
    .in1(out_ui_lshift_expr_FU_8_0_8_229_i13_fu_gift64_top_428528_430622),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430629 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i14_fu_gift64_top_428528_430629),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i33_fu_gift64_top_428528_429174),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430632 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i7_fu_gift64_top_428528_430632),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_array_429362_4_8_4),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430635 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i8_fu_gift64_top_428528_430635),
    .in1(out_ui_rshift_expr_FU_8_0_8_248_i4_fu_gift64_top_428528_429176),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430639 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i6_fu_gift64_top_428528_430639),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i19_fu_gift64_top_428528_429177),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430642 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i9_fu_gift64_top_428528_430642),
    .in1(out_ui_lshift_expr_FU_8_0_8_230_i6_fu_gift64_top_428528_430639),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430646 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i7_fu_gift64_top_428528_430646),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i34_fu_gift64_top_428528_429178),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430649 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i17_fu_gift64_top_428528_430649),
    .in1(out_ui_lshift_expr_FU_8_0_8_224_i1_fu_gift64_top_428528_429181),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430652 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i18_fu_gift64_top_428528_430652),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_array_429362_5_8_4),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430656 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i15_fu_gift64_top_428528_430656),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i20_fu_gift64_top_428528_429182),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430659 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i19_fu_gift64_top_428528_430659),
    .in1(out_ui_lshift_expr_FU_8_0_8_229_i15_fu_gift64_top_428528_430656),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430663 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i16_fu_gift64_top_428528_430663),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i35_fu_gift64_top_428528_429183),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430666 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i10_fu_gift64_top_428528_430666),
    .in1(out_ui_bit_xor_expr_FU_8_8_8_208_i5_fu_gift64_top_428528_429186),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430670 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i8_fu_gift64_top_428528_430670),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i36_fu_gift64_top_428528_429187),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430673 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i11_fu_gift64_top_428528_430673),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_429362_0_8_4),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430676 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i12_fu_gift64_top_428528_430676),
    .in1(out_ui_lshift_expr_FU_8_0_8_224_i2_fu_gift64_top_428528_429191),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430680 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i9_fu_gift64_top_428528_430680),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i21_fu_gift64_top_428528_429192),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430683 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i13_fu_gift64_top_428528_430683),
    .in1(out_ui_lshift_expr_FU_8_0_8_230_i9_fu_gift64_top_428528_430680),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430687 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i10_fu_gift64_top_428528_430687),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i37_fu_gift64_top_428528_429193),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430690 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i20_fu_gift64_top_428528_430690),
    .in1(out_ui_rshift_expr_FU_8_0_8_248_i5_fu_gift64_top_428528_429194),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430693 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i21_fu_gift64_top_428528_430693),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_array_429362_1_8_4),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430697 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i17_fu_gift64_top_428528_430697),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i22_fu_gift64_top_428528_429195),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430700 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i22_fu_gift64_top_428528_430700),
    .in1(out_ui_lshift_expr_FU_8_0_8_229_i17_fu_gift64_top_428528_430697),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430704 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i18_fu_gift64_top_428528_430704),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i38_fu_gift64_top_428528_429196),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430707 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i23_fu_gift64_top_428528_430707),
    .in1(out_ui_rshift_expr_FU_8_0_8_249_i5_fu_gift64_top_428528_429200),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430710 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i24_fu_gift64_top_428528_430710),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_array_429362_3_8_4),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430714 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i19_fu_gift64_top_428528_430714),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i23_fu_gift64_top_428528_429201),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430717 (.out1(out_ui_rshift_expr_FU_8_0_8_252_i25_fu_gift64_top_428528_430717),
    .in1(out_ui_lshift_expr_FU_8_0_8_229_i19_fu_gift64_top_428528_430714),
    .in2(out_const_14));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430721 (.out1(out_ui_lshift_expr_FU_8_0_8_229_i20_fu_gift64_top_428528_430721),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i39_fu_gift64_top_428528_429202),
    .in2(out_const_14));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430724 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i14_fu_gift64_top_428528_430724),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_array_429362_4_8_4),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430727 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i15_fu_gift64_top_428528_430727),
    .in1(out_ui_rshift_expr_FU_8_0_8_248_i6_fu_gift64_top_428528_429206),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430731 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i11_fu_gift64_top_428528_430731),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i24_fu_gift64_top_428528_429207),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430734 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i16_fu_gift64_top_428528_430734),
    .in1(out_ui_lshift_expr_FU_8_0_8_230_i11_fu_gift64_top_428528_430731),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430738 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i12_fu_gift64_top_428528_430738),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i40_fu_gift64_top_428528_429208),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430741 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i17_fu_gift64_top_428528_430741),
    .in1(out_ui_bit_xor_expr_FU_8_8_8_208_i6_fu_gift64_top_428528_429213),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430745 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i13_fu_gift64_top_428528_430745),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i41_fu_gift64_top_428528_429214),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430748 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i18_fu_gift64_top_428528_430748),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_array_429362_1_8_4),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430751 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i19_fu_gift64_top_428528_430751),
    .in1(out_ui_lshift_expr_FU_8_0_8_224_i3_fu_gift64_top_428528_429218),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430755 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i14_fu_gift64_top_428528_430755),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i25_fu_gift64_top_428528_429219),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430758 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i20_fu_gift64_top_428528_430758),
    .in1(out_ui_lshift_expr_FU_8_0_8_230_i14_fu_gift64_top_428528_430755),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430762 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i15_fu_gift64_top_428528_430762),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i42_fu_gift64_top_428528_429220),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430765 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i21_fu_gift64_top_428528_430765),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_array_429362_5_8_4),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430768 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i22_fu_gift64_top_428528_430768),
    .in1(out_ui_rshift_expr_FU_8_0_8_248_i7_fu_gift64_top_428528_429227),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430772 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i16_fu_gift64_top_428528_430772),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i26_fu_gift64_top_428528_429228),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430775 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i23_fu_gift64_top_428528_430775),
    .in1(out_ui_lshift_expr_FU_8_0_8_230_i16_fu_gift64_top_428528_430772),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430779 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i17_fu_gift64_top_428528_430779),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i43_fu_gift64_top_428528_429229),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430782 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i24_fu_gift64_top_428528_430782),
    .in1(out_ui_bit_xor_expr_FU_8_8_8_208_i7_fu_gift64_top_428528_429234),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430786 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i18_fu_gift64_top_428528_430786),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i44_fu_gift64_top_428528_429235),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430789 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i25_fu_gift64_top_428528_430789),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_array_429362_1_8_4),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430792 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i26_fu_gift64_top_428528_430792),
    .in1(out_ui_lshift_expr_FU_8_0_8_224_i4_fu_gift64_top_428528_429239),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430796 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i19_fu_gift64_top_428528_430796),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i27_fu_gift64_top_428528_429240),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430799 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i27_fu_gift64_top_428528_430799),
    .in1(out_ui_lshift_expr_FU_8_0_8_230_i19_fu_gift64_top_428528_430796),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430803 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i20_fu_gift64_top_428528_430803),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i45_fu_gift64_top_428528_429241),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430806 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i28_fu_gift64_top_428528_430806),
    .in1(out_conv_out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_array_429362_5_8_4),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430809 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i29_fu_gift64_top_428528_430809),
    .in1(out_ui_rshift_expr_FU_8_0_8_248_i8_fu_gift64_top_428528_429248),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430813 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i21_fu_gift64_top_428528_430813),
    .in1(out_ui_bit_xor_expr_FU_1_1_1_206_i28_fu_gift64_top_428528_429249),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430816 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i30_fu_gift64_top_428528_430816),
    .in1(out_ui_lshift_expr_FU_8_0_8_230_i21_fu_gift64_top_428528_430813),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430820 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i22_fu_gift64_top_428528_430820),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i46_fu_gift64_top_428528_429250),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1),
    .PRECISION(8)) fu_gift64_top_428528_430823 (.out1(out_ui_rshift_expr_FU_8_0_8_253_i31_fu_gift64_top_428528_430823),
    .in1(out_ui_bit_xor_expr_FU_8_8_8_208_i8_fu_gift64_top_428528_429255),
    .in2(out_const_2));
  ui_lshift_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(1),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430827 (.out1(out_ui_lshift_expr_FU_8_0_8_230_i23_fu_gift64_top_428528_430827),
    .in1(out_ui_bit_and_expr_FU_1_0_1_134_i47_fu_gift64_top_428528_429256),
    .in2(out_const_2));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430830 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i16_fu_gift64_top_428528_430830),
    .in1(out_ui_lshift_expr_FU_8_0_8_226_i1_fu_gift64_top_428528_429262),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430834 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i16_fu_gift64_top_428528_430834),
    .in1(out_ui_bit_and_expr_FU_8_0_8_138_i0_fu_gift64_top_428528_429263),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430837 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i17_fu_gift64_top_428528_430837),
    .in1(out_ui_lshift_expr_FU_8_0_8_226_i2_fu_gift64_top_428528_429266),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430841 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i17_fu_gift64_top_428528_430841),
    .in1(out_ui_bit_and_expr_FU_8_0_8_138_i1_fu_gift64_top_428528_429267),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430844 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i18_fu_gift64_top_428528_430844),
    .in1(out_ui_lshift_expr_FU_8_0_8_226_i3_fu_gift64_top_428528_429270),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430848 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i18_fu_gift64_top_428528_430848),
    .in1(out_ui_bit_and_expr_FU_8_0_8_138_i2_fu_gift64_top_428528_429271),
    .in2(out_const_3));
  ui_rshift_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_in2(2),
    .BITSIZE_out1(2),
    .PRECISION(8)) fu_gift64_top_428528_430851 (.out1(out_ui_rshift_expr_FU_8_0_8_251_i19_fu_gift64_top_428528_430851),
    .in1(out_ui_lshift_expr_FU_8_0_8_226_i4_fu_gift64_top_428528_429273),
    .in2(out_const_3));
  ui_lshift_expr_FU #(.BITSIZE_in1(2),
    .BITSIZE_in2(2),
    .BITSIZE_out1(4),
    .PRECISION(8)) fu_gift64_top_428528_430855 (.out1(out_ui_lshift_expr_FU_8_0_8_228_i19_fu_gift64_top_428528_430855),
    .in1(out_ui_bit_and_expr_FU_8_0_8_138_i3_fu_gift64_top_428528_429274),
    .in2(out_const_3));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_133_reg_0_0_0_0),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_134_reg_1_0_0_0),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_135_reg_10_0_0_0),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_136_reg_11_0_0_0),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_137_reg_12_0_0_0),
    .wenable(wrenable_reg_12));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_138_reg_13_0_0_0),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_139_reg_14_0_0_0),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_140_reg_15_0_0_0),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_141_reg_16_0_0_0),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_142_reg_17_0_0_0),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_143_reg_18_0_0_0),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_144_reg_19_0_0_0),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_145_reg_2_0_0_0),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_146_reg_20_0_0_0),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_147_reg_21_0_0_0),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_148_reg_22_0_0_0),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_149_reg_23_0_0_0),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_150_reg_24_0_0_0),
    .wenable(wrenable_reg_24));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_151_reg_25_0_0_0),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_152_reg_26_0_0_0),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_153_reg_27_0_0_0),
    .wenable(wrenable_reg_27));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_154_reg_28_0_0_0),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_155_reg_29_0_0_0),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_156_reg_3_0_0_0),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_157_reg_30_0_0_0),
    .wenable(wrenable_reg_30));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_158_reg_31_0_0_0),
    .wenable(wrenable_reg_31));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_159_reg_32_0_0_0),
    .wenable(wrenable_reg_32));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_160_reg_33_0_0_0),
    .wenable(wrenable_reg_33));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_161_reg_34_0_0_0),
    .wenable(wrenable_reg_34));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_162_reg_35_0_0_0),
    .wenable(wrenable_reg_35));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_36 (.out1(out_reg_36_reg_36),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_163_reg_36_0_0_0),
    .wenable(wrenable_reg_36));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_37 (.out1(out_reg_37_reg_37),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_164_reg_37_0_0_0),
    .wenable(wrenable_reg_37));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_38 (.out1(out_reg_38_reg_38),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_165_reg_38_0_0_0),
    .wenable(wrenable_reg_38));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_39 (.out1(out_reg_39_reg_39),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_166_reg_39_0_0_0),
    .wenable(wrenable_reg_39));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_167_reg_4_0_0_0),
    .wenable(wrenable_reg_4));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_40 (.out1(out_reg_40_reg_40),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_168_reg_40_0_0_0),
    .wenable(wrenable_reg_40));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_41 (.out1(out_reg_41_reg_41),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_169_reg_41_0_0_0),
    .wenable(wrenable_reg_41));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_42 (.out1(out_reg_42_reg_42),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_170_reg_42_0_0_0),
    .wenable(wrenable_reg_42));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_43 (.out1(out_reg_43_reg_43),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_171_reg_43_0_0_0),
    .wenable(wrenable_reg_43));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_44 (.out1(out_reg_44_reg_44),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_172_reg_44_0_0_0),
    .wenable(wrenable_reg_44));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_45 (.out1(out_reg_45_reg_45),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_173_reg_45_0_0_0),
    .wenable(wrenable_reg_45));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_46 (.out1(out_reg_46_reg_46),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_174_reg_46_0_0_0),
    .wenable(wrenable_reg_46));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_47 (.out1(out_reg_47_reg_47),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_175_reg_47_0_0_0),
    .wenable(wrenable_reg_47));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_48 (.out1(out_reg_48_reg_48),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_176_reg_48_0_0_0),
    .wenable(wrenable_reg_48));
  register_SE #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_49 (.out1(out_reg_49_reg_49),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_49_i0_fu_gift64_top_428528_430283),
    .wenable(wrenable_reg_49));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_178_reg_5_0_0_0),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(11),
    .BITSIZE_out1(11)) reg_50 (.out1(out_reg_50_reg_50),
    .clock(clock),
    .reset(reset),
    .in1(out_addr_expr_FU_50_i0_fu_gift64_top_428528_430348),
    .wenable(wrenable_reg_50));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_180_reg_6_0_0_0),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_181_reg_7_0_0_0),
    .wenable(wrenable_reg_7));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_182_reg_8_0_0_0),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_183_reg_9_0_0_0),
    .wenable(wrenable_reg_9));
  // io-signal post fix
  assign return_port = out_ui_bit_ior_expr_FU_0_64_64_152_i0_fu_gift64_top_428528_430051;
  assign OUT_CONDITION_gift64_top_428528_429278 = out_read_cond_FU_117_i0_fu_gift64_top_428528_429278;

endmodule

// FSM based controller description for gift64_top
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_gift64_top(done_port,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_STORE,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD,
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE,
  selector_MUX_133_reg_0_0_0_0,
  selector_MUX_134_reg_1_0_0_0,
  selector_MUX_135_reg_10_0_0_0,
  selector_MUX_136_reg_11_0_0_0,
  selector_MUX_137_reg_12_0_0_0,
  selector_MUX_138_reg_13_0_0_0,
  selector_MUX_139_reg_14_0_0_0,
  selector_MUX_140_reg_15_0_0_0,
  selector_MUX_141_reg_16_0_0_0,
  selector_MUX_142_reg_17_0_0_0,
  selector_MUX_143_reg_18_0_0_0,
  selector_MUX_144_reg_19_0_0_0,
  selector_MUX_145_reg_2_0_0_0,
  selector_MUX_146_reg_20_0_0_0,
  selector_MUX_147_reg_21_0_0_0,
  selector_MUX_148_reg_22_0_0_0,
  selector_MUX_149_reg_23_0_0_0,
  selector_MUX_150_reg_24_0_0_0,
  selector_MUX_151_reg_25_0_0_0,
  selector_MUX_152_reg_26_0_0_0,
  selector_MUX_153_reg_27_0_0_0,
  selector_MUX_154_reg_28_0_0_0,
  selector_MUX_155_reg_29_0_0_0,
  selector_MUX_156_reg_3_0_0_0,
  selector_MUX_157_reg_30_0_0_0,
  selector_MUX_158_reg_31_0_0_0,
  selector_MUX_159_reg_32_0_0_0,
  selector_MUX_160_reg_33_0_0_0,
  selector_MUX_161_reg_34_0_0_0,
  selector_MUX_162_reg_35_0_0_0,
  selector_MUX_163_reg_36_0_0_0,
  selector_MUX_164_reg_37_0_0_0,
  selector_MUX_165_reg_38_0_0_0,
  selector_MUX_166_reg_39_0_0_0,
  selector_MUX_167_reg_4_0_0_0,
  selector_MUX_168_reg_40_0_0_0,
  selector_MUX_169_reg_41_0_0_0,
  selector_MUX_170_reg_42_0_0_0,
  selector_MUX_171_reg_43_0_0_0,
  selector_MUX_172_reg_44_0_0_0,
  selector_MUX_173_reg_45_0_0_0,
  selector_MUX_174_reg_46_0_0_0,
  selector_MUX_175_reg_47_0_0_0,
  selector_MUX_176_reg_48_0_0_0,
  selector_MUX_178_reg_5_0_0_0,
  selector_MUX_180_reg_6_0_0_0,
  selector_MUX_181_reg_7_0_0_0,
  selector_MUX_182_reg_8_0_0_0,
  selector_MUX_183_reg_9_0_0_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_36,
  wrenable_reg_37,
  wrenable_reg_38,
  wrenable_reg_39,
  wrenable_reg_4,
  wrenable_reg_40,
  wrenable_reg_41,
  wrenable_reg_42,
  wrenable_reg_43,
  wrenable_reg_44,
  wrenable_reg_45,
  wrenable_reg_46,
  wrenable_reg_47,
  wrenable_reg_48,
  wrenable_reg_49,
  wrenable_reg_5,
  wrenable_reg_50,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_gift64_top_428528_429278,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_gift64_top_428528_429278;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_STORE;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD;
  output fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE;
  output selector_MUX_133_reg_0_0_0_0;
  output selector_MUX_134_reg_1_0_0_0;
  output selector_MUX_135_reg_10_0_0_0;
  output selector_MUX_136_reg_11_0_0_0;
  output selector_MUX_137_reg_12_0_0_0;
  output selector_MUX_138_reg_13_0_0_0;
  output selector_MUX_139_reg_14_0_0_0;
  output selector_MUX_140_reg_15_0_0_0;
  output selector_MUX_141_reg_16_0_0_0;
  output selector_MUX_142_reg_17_0_0_0;
  output selector_MUX_143_reg_18_0_0_0;
  output selector_MUX_144_reg_19_0_0_0;
  output selector_MUX_145_reg_2_0_0_0;
  output selector_MUX_146_reg_20_0_0_0;
  output selector_MUX_147_reg_21_0_0_0;
  output selector_MUX_148_reg_22_0_0_0;
  output selector_MUX_149_reg_23_0_0_0;
  output selector_MUX_150_reg_24_0_0_0;
  output selector_MUX_151_reg_25_0_0_0;
  output selector_MUX_152_reg_26_0_0_0;
  output selector_MUX_153_reg_27_0_0_0;
  output selector_MUX_154_reg_28_0_0_0;
  output selector_MUX_155_reg_29_0_0_0;
  output selector_MUX_156_reg_3_0_0_0;
  output selector_MUX_157_reg_30_0_0_0;
  output selector_MUX_158_reg_31_0_0_0;
  output selector_MUX_159_reg_32_0_0_0;
  output selector_MUX_160_reg_33_0_0_0;
  output selector_MUX_161_reg_34_0_0_0;
  output selector_MUX_162_reg_35_0_0_0;
  output selector_MUX_163_reg_36_0_0_0;
  output selector_MUX_164_reg_37_0_0_0;
  output selector_MUX_165_reg_38_0_0_0;
  output selector_MUX_166_reg_39_0_0_0;
  output selector_MUX_167_reg_4_0_0_0;
  output selector_MUX_168_reg_40_0_0_0;
  output selector_MUX_169_reg_41_0_0_0;
  output selector_MUX_170_reg_42_0_0_0;
  output selector_MUX_171_reg_43_0_0_0;
  output selector_MUX_172_reg_44_0_0_0;
  output selector_MUX_173_reg_45_0_0_0;
  output selector_MUX_174_reg_46_0_0_0;
  output selector_MUX_175_reg_47_0_0_0;
  output selector_MUX_176_reg_48_0_0_0;
  output selector_MUX_178_reg_5_0_0_0;
  output selector_MUX_180_reg_6_0_0_0;
  output selector_MUX_181_reg_7_0_0_0;
  output selector_MUX_182_reg_8_0_0_0;
  output selector_MUX_183_reg_9_0_0_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_20;
  output wrenable_reg_21;
  output wrenable_reg_22;
  output wrenable_reg_23;
  output wrenable_reg_24;
  output wrenable_reg_25;
  output wrenable_reg_26;
  output wrenable_reg_27;
  output wrenable_reg_28;
  output wrenable_reg_29;
  output wrenable_reg_3;
  output wrenable_reg_30;
  output wrenable_reg_31;
  output wrenable_reg_32;
  output wrenable_reg_33;
  output wrenable_reg_34;
  output wrenable_reg_35;
  output wrenable_reg_36;
  output wrenable_reg_37;
  output wrenable_reg_38;
  output wrenable_reg_39;
  output wrenable_reg_4;
  output wrenable_reg_40;
  output wrenable_reg_41;
  output wrenable_reg_42;
  output wrenable_reg_43;
  output wrenable_reg_44;
  output wrenable_reg_45;
  output wrenable_reg_46;
  output wrenable_reg_47;
  output wrenable_reg_48;
  output wrenable_reg_49;
  output wrenable_reg_5;
  output wrenable_reg_50;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [1:0] S_0 = 2'd0,
    S_1 = 2'd1,
    S_2 = 2'd2;
  reg [1:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_STORE;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD;
  reg fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE;
  reg selector_MUX_133_reg_0_0_0_0;
  reg selector_MUX_134_reg_1_0_0_0;
  reg selector_MUX_135_reg_10_0_0_0;
  reg selector_MUX_136_reg_11_0_0_0;
  reg selector_MUX_137_reg_12_0_0_0;
  reg selector_MUX_138_reg_13_0_0_0;
  reg selector_MUX_139_reg_14_0_0_0;
  reg selector_MUX_140_reg_15_0_0_0;
  reg selector_MUX_141_reg_16_0_0_0;
  reg selector_MUX_142_reg_17_0_0_0;
  reg selector_MUX_143_reg_18_0_0_0;
  reg selector_MUX_144_reg_19_0_0_0;
  reg selector_MUX_145_reg_2_0_0_0;
  reg selector_MUX_146_reg_20_0_0_0;
  reg selector_MUX_147_reg_21_0_0_0;
  reg selector_MUX_148_reg_22_0_0_0;
  reg selector_MUX_149_reg_23_0_0_0;
  reg selector_MUX_150_reg_24_0_0_0;
  reg selector_MUX_151_reg_25_0_0_0;
  reg selector_MUX_152_reg_26_0_0_0;
  reg selector_MUX_153_reg_27_0_0_0;
  reg selector_MUX_154_reg_28_0_0_0;
  reg selector_MUX_155_reg_29_0_0_0;
  reg selector_MUX_156_reg_3_0_0_0;
  reg selector_MUX_157_reg_30_0_0_0;
  reg selector_MUX_158_reg_31_0_0_0;
  reg selector_MUX_159_reg_32_0_0_0;
  reg selector_MUX_160_reg_33_0_0_0;
  reg selector_MUX_161_reg_34_0_0_0;
  reg selector_MUX_162_reg_35_0_0_0;
  reg selector_MUX_163_reg_36_0_0_0;
  reg selector_MUX_164_reg_37_0_0_0;
  reg selector_MUX_165_reg_38_0_0_0;
  reg selector_MUX_166_reg_39_0_0_0;
  reg selector_MUX_167_reg_4_0_0_0;
  reg selector_MUX_168_reg_40_0_0_0;
  reg selector_MUX_169_reg_41_0_0_0;
  reg selector_MUX_170_reg_42_0_0_0;
  reg selector_MUX_171_reg_43_0_0_0;
  reg selector_MUX_172_reg_44_0_0_0;
  reg selector_MUX_173_reg_45_0_0_0;
  reg selector_MUX_174_reg_46_0_0_0;
  reg selector_MUX_175_reg_47_0_0_0;
  reg selector_MUX_176_reg_48_0_0_0;
  reg selector_MUX_178_reg_5_0_0_0;
  reg selector_MUX_180_reg_6_0_0_0;
  reg selector_MUX_181_reg_7_0_0_0;
  reg selector_MUX_182_reg_8_0_0_0;
  reg selector_MUX_183_reg_9_0_0_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_19;
  reg wrenable_reg_2;
  reg wrenable_reg_20;
  reg wrenable_reg_21;
  reg wrenable_reg_22;
  reg wrenable_reg_23;
  reg wrenable_reg_24;
  reg wrenable_reg_25;
  reg wrenable_reg_26;
  reg wrenable_reg_27;
  reg wrenable_reg_28;
  reg wrenable_reg_29;
  reg wrenable_reg_3;
  reg wrenable_reg_30;
  reg wrenable_reg_31;
  reg wrenable_reg_32;
  reg wrenable_reg_33;
  reg wrenable_reg_34;
  reg wrenable_reg_35;
  reg wrenable_reg_36;
  reg wrenable_reg_37;
  reg wrenable_reg_38;
  reg wrenable_reg_39;
  reg wrenable_reg_4;
  reg wrenable_reg_40;
  reg wrenable_reg_41;
  reg wrenable_reg_42;
  reg wrenable_reg_43;
  reg wrenable_reg_44;
  reg wrenable_reg_45;
  reg wrenable_reg_46;
  reg wrenable_reg_47;
  reg wrenable_reg_48;
  reg wrenable_reg_49;
  reg wrenable_reg_5;
  reg wrenable_reg_50;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_STORE = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD = 1'b0;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE = 1'b0;
    selector_MUX_133_reg_0_0_0_0 = 1'b0;
    selector_MUX_134_reg_1_0_0_0 = 1'b0;
    selector_MUX_135_reg_10_0_0_0 = 1'b0;
    selector_MUX_136_reg_11_0_0_0 = 1'b0;
    selector_MUX_137_reg_12_0_0_0 = 1'b0;
    selector_MUX_138_reg_13_0_0_0 = 1'b0;
    selector_MUX_139_reg_14_0_0_0 = 1'b0;
    selector_MUX_140_reg_15_0_0_0 = 1'b0;
    selector_MUX_141_reg_16_0_0_0 = 1'b0;
    selector_MUX_142_reg_17_0_0_0 = 1'b0;
    selector_MUX_143_reg_18_0_0_0 = 1'b0;
    selector_MUX_144_reg_19_0_0_0 = 1'b0;
    selector_MUX_145_reg_2_0_0_0 = 1'b0;
    selector_MUX_146_reg_20_0_0_0 = 1'b0;
    selector_MUX_147_reg_21_0_0_0 = 1'b0;
    selector_MUX_148_reg_22_0_0_0 = 1'b0;
    selector_MUX_149_reg_23_0_0_0 = 1'b0;
    selector_MUX_150_reg_24_0_0_0 = 1'b0;
    selector_MUX_151_reg_25_0_0_0 = 1'b0;
    selector_MUX_152_reg_26_0_0_0 = 1'b0;
    selector_MUX_153_reg_27_0_0_0 = 1'b0;
    selector_MUX_154_reg_28_0_0_0 = 1'b0;
    selector_MUX_155_reg_29_0_0_0 = 1'b0;
    selector_MUX_156_reg_3_0_0_0 = 1'b0;
    selector_MUX_157_reg_30_0_0_0 = 1'b0;
    selector_MUX_158_reg_31_0_0_0 = 1'b0;
    selector_MUX_159_reg_32_0_0_0 = 1'b0;
    selector_MUX_160_reg_33_0_0_0 = 1'b0;
    selector_MUX_161_reg_34_0_0_0 = 1'b0;
    selector_MUX_162_reg_35_0_0_0 = 1'b0;
    selector_MUX_163_reg_36_0_0_0 = 1'b0;
    selector_MUX_164_reg_37_0_0_0 = 1'b0;
    selector_MUX_165_reg_38_0_0_0 = 1'b0;
    selector_MUX_166_reg_39_0_0_0 = 1'b0;
    selector_MUX_167_reg_4_0_0_0 = 1'b0;
    selector_MUX_168_reg_40_0_0_0 = 1'b0;
    selector_MUX_169_reg_41_0_0_0 = 1'b0;
    selector_MUX_170_reg_42_0_0_0 = 1'b0;
    selector_MUX_171_reg_43_0_0_0 = 1'b0;
    selector_MUX_172_reg_44_0_0_0 = 1'b0;
    selector_MUX_173_reg_45_0_0_0 = 1'b0;
    selector_MUX_174_reg_46_0_0_0 = 1'b0;
    selector_MUX_175_reg_47_0_0_0 = 1'b0;
    selector_MUX_176_reg_48_0_0_0 = 1'b0;
    selector_MUX_178_reg_5_0_0_0 = 1'b0;
    selector_MUX_180_reg_6_0_0_0 = 1'b0;
    selector_MUX_181_reg_7_0_0_0 = 1'b0;
    selector_MUX_182_reg_8_0_0_0 = 1'b0;
    selector_MUX_183_reg_9_0_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_19 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_20 = 1'b0;
    wrenable_reg_21 = 1'b0;
    wrenable_reg_22 = 1'b0;
    wrenable_reg_23 = 1'b0;
    wrenable_reg_24 = 1'b0;
    wrenable_reg_25 = 1'b0;
    wrenable_reg_26 = 1'b0;
    wrenable_reg_27 = 1'b0;
    wrenable_reg_28 = 1'b0;
    wrenable_reg_29 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_30 = 1'b0;
    wrenable_reg_31 = 1'b0;
    wrenable_reg_32 = 1'b0;
    wrenable_reg_33 = 1'b0;
    wrenable_reg_34 = 1'b0;
    wrenable_reg_35 = 1'b0;
    wrenable_reg_36 = 1'b0;
    wrenable_reg_37 = 1'b0;
    wrenable_reg_38 = 1'b0;
    wrenable_reg_39 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_40 = 1'b0;
    wrenable_reg_41 = 1'b0;
    wrenable_reg_42 = 1'b0;
    wrenable_reg_43 = 1'b0;
    wrenable_reg_44 = 1'b0;
    wrenable_reg_45 = 1'b0;
    wrenable_reg_46 = 1'b0;
    wrenable_reg_47 = 1'b0;
    wrenable_reg_48 = 1'b0;
    wrenable_reg_49 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_50 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          selector_MUX_133_reg_0_0_0_0 = 1'b1;
          selector_MUX_134_reg_1_0_0_0 = 1'b1;
          selector_MUX_135_reg_10_0_0_0 = 1'b1;
          selector_MUX_136_reg_11_0_0_0 = 1'b1;
          selector_MUX_138_reg_13_0_0_0 = 1'b1;
          selector_MUX_139_reg_14_0_0_0 = 1'b1;
          selector_MUX_140_reg_15_0_0_0 = 1'b1;
          selector_MUX_145_reg_2_0_0_0 = 1'b1;
          selector_MUX_156_reg_3_0_0_0 = 1'b1;
          selector_MUX_167_reg_4_0_0_0 = 1'b1;
          selector_MUX_172_reg_44_0_0_0 = 1'b1;
          selector_MUX_173_reg_45_0_0_0 = 1'b1;
          selector_MUX_174_reg_46_0_0_0 = 1'b1;
          selector_MUX_175_reg_47_0_0_0 = 1'b1;
          selector_MUX_178_reg_5_0_0_0 = 1'b1;
          selector_MUX_180_reg_6_0_0_0 = 1'b1;
          selector_MUX_181_reg_7_0_0_0 = 1'b1;
          selector_MUX_182_reg_8_0_0_0 = 1'b1;
          selector_MUX_183_reg_9_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_31 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
          wrenable_reg_38 = 1'b1;
          wrenable_reg_39 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_40 = 1'b1;
          wrenable_reg_41 = 1'b1;
          wrenable_reg_42 = 1'b1;
          wrenable_reg_43 = 1'b1;
          wrenable_reg_44 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_47 = 1'b1;
          wrenable_reg_48 = 1'b1;
          wrenable_reg_49 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_50 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          _next_state = S_1;
        end
        else
        begin
          _next_state = S_0;
        end
      S_1 :
        begin
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_LOAD = 1'b1;
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD = 1'b1;
          selector_MUX_137_reg_12_0_0_0 = 1'b1;
          selector_MUX_141_reg_16_0_0_0 = 1'b1;
          selector_MUX_142_reg_17_0_0_0 = 1'b1;
          selector_MUX_143_reg_18_0_0_0 = 1'b1;
          selector_MUX_144_reg_19_0_0_0 = 1'b1;
          selector_MUX_146_reg_20_0_0_0 = 1'b1;
          selector_MUX_147_reg_21_0_0_0 = 1'b1;
          selector_MUX_148_reg_22_0_0_0 = 1'b1;
          selector_MUX_149_reg_23_0_0_0 = 1'b1;
          selector_MUX_150_reg_24_0_0_0 = 1'b1;
          selector_MUX_151_reg_25_0_0_0 = 1'b1;
          selector_MUX_152_reg_26_0_0_0 = 1'b1;
          selector_MUX_153_reg_27_0_0_0 = 1'b1;
          selector_MUX_154_reg_28_0_0_0 = 1'b1;
          selector_MUX_155_reg_29_0_0_0 = 1'b1;
          selector_MUX_157_reg_30_0_0_0 = 1'b1;
          selector_MUX_158_reg_31_0_0_0 = 1'b1;
          selector_MUX_159_reg_32_0_0_0 = 1'b1;
          selector_MUX_160_reg_33_0_0_0 = 1'b1;
          selector_MUX_161_reg_34_0_0_0 = 1'b1;
          selector_MUX_162_reg_35_0_0_0 = 1'b1;
          selector_MUX_163_reg_36_0_0_0 = 1'b1;
          selector_MUX_164_reg_37_0_0_0 = 1'b1;
          selector_MUX_165_reg_38_0_0_0 = 1'b1;
          selector_MUX_166_reg_39_0_0_0 = 1'b1;
          selector_MUX_168_reg_40_0_0_0 = 1'b1;
          selector_MUX_169_reg_41_0_0_0 = 1'b1;
          selector_MUX_170_reg_42_0_0_0 = 1'b1;
          selector_MUX_171_reg_43_0_0_0 = 1'b1;
          selector_MUX_176_reg_48_0_0_0 = 1'b1;
          wrenable_reg_0 = 1'b1;
          wrenable_reg_1 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_13 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_16 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          wrenable_reg_2 = 1'b1;
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          wrenable_reg_22 = 1'b1;
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          wrenable_reg_3 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_31 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_33 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          wrenable_reg_36 = 1'b1;
          wrenable_reg_37 = 1'b1;
          wrenable_reg_38 = 1'b1;
          wrenable_reg_39 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_40 = 1'b1;
          wrenable_reg_41 = 1'b1;
          wrenable_reg_42 = 1'b1;
          wrenable_reg_43 = 1'b1;
          wrenable_reg_44 = 1'b1;
          wrenable_reg_45 = 1'b1;
          wrenable_reg_46 = 1'b1;
          wrenable_reg_47 = 1'b1;
          wrenable_reg_48 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION_gift64_top_428528_429278 == 1'b1)
            begin
              _next_state = S_2;
              done_port = 1'b1;
              selector_MUX_141_reg_16_0_0_0 = 1'b0;
              selector_MUX_142_reg_17_0_0_0 = 1'b0;
              selector_MUX_143_reg_18_0_0_0 = 1'b0;
              selector_MUX_144_reg_19_0_0_0 = 1'b0;
              selector_MUX_146_reg_20_0_0_0 = 1'b0;
              selector_MUX_147_reg_21_0_0_0 = 1'b0;
              selector_MUX_148_reg_22_0_0_0 = 1'b0;
              selector_MUX_149_reg_23_0_0_0 = 1'b0;
              selector_MUX_150_reg_24_0_0_0 = 1'b0;
              selector_MUX_151_reg_25_0_0_0 = 1'b0;
              selector_MUX_152_reg_26_0_0_0 = 1'b0;
              selector_MUX_153_reg_27_0_0_0 = 1'b0;
              selector_MUX_154_reg_28_0_0_0 = 1'b0;
              selector_MUX_155_reg_29_0_0_0 = 1'b0;
              selector_MUX_157_reg_30_0_0_0 = 1'b0;
              selector_MUX_158_reg_31_0_0_0 = 1'b0;
              selector_MUX_159_reg_32_0_0_0 = 1'b0;
              selector_MUX_160_reg_33_0_0_0 = 1'b0;
              selector_MUX_161_reg_34_0_0_0 = 1'b0;
              selector_MUX_162_reg_35_0_0_0 = 1'b0;
              selector_MUX_163_reg_36_0_0_0 = 1'b0;
              selector_MUX_164_reg_37_0_0_0 = 1'b0;
              selector_MUX_165_reg_38_0_0_0 = 1'b0;
              selector_MUX_166_reg_39_0_0_0 = 1'b0;
              selector_MUX_168_reg_40_0_0_0 = 1'b0;
              selector_MUX_169_reg_41_0_0_0 = 1'b0;
              selector_MUX_170_reg_42_0_0_0 = 1'b0;
              selector_MUX_171_reg_43_0_0_0 = 1'b0;
              selector_MUX_176_reg_48_0_0_0 = 1'b0;
              wrenable_reg_16 = 1'b0;
              wrenable_reg_17 = 1'b0;
              wrenable_reg_18 = 1'b0;
              wrenable_reg_19 = 1'b0;
              wrenable_reg_20 = 1'b0;
              wrenable_reg_21 = 1'b0;
              wrenable_reg_22 = 1'b0;
              wrenable_reg_23 = 1'b0;
              wrenable_reg_24 = 1'b0;
              wrenable_reg_25 = 1'b0;
              wrenable_reg_26 = 1'b0;
              wrenable_reg_27 = 1'b0;
              wrenable_reg_28 = 1'b0;
              wrenable_reg_29 = 1'b0;
              wrenable_reg_30 = 1'b0;
              wrenable_reg_31 = 1'b0;
              wrenable_reg_32 = 1'b0;
              wrenable_reg_33 = 1'b0;
              wrenable_reg_34 = 1'b0;
              wrenable_reg_35 = 1'b0;
              wrenable_reg_36 = 1'b0;
              wrenable_reg_37 = 1'b0;
              wrenable_reg_38 = 1'b0;
              wrenable_reg_39 = 1'b0;
              wrenable_reg_40 = 1'b0;
              wrenable_reg_41 = 1'b0;
              wrenable_reg_42 = 1'b0;
              wrenable_reg_43 = 1'b0;
              wrenable_reg_44 = 1'b0;
              wrenable_reg_45 = 1'b0;
              wrenable_reg_46 = 1'b0;
              wrenable_reg_47 = 1'b0;
              wrenable_reg_48 = 1'b0;
            end
          else
            begin
              _next_state = S_1;
            end
        end
      S_2 :
        begin
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Marco Lattuada <marco.lattuada@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module flipflop_AR(clock,
  reset,
  in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input in1;
  // OUT
  output out1;
  
  reg reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock or negedge reset)
    if (reset == 1'b0)
      reg_out1 <= {BITSIZE_out1{1'b0}};
    else
      reg_out1 <= in1;
endmodule

// Top component for gift64_top
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _gift64_top(clock,
  reset,
  start_port,
  done_port,
  pt,
  key_hi,
  key_lo,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input [63:0] pt;
  input [63:0] key_hi;
  input [63:0] key_lo;
  // OUT
  output done_port;
  output [63:0] return_port;
  // Component and signal declarations
  wire OUT_CONDITION_gift64_top_428528_429278;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_STORE;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD;
  wire fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE;
  wire selector_MUX_133_reg_0_0_0_0;
  wire selector_MUX_134_reg_1_0_0_0;
  wire selector_MUX_135_reg_10_0_0_0;
  wire selector_MUX_136_reg_11_0_0_0;
  wire selector_MUX_137_reg_12_0_0_0;
  wire selector_MUX_138_reg_13_0_0_0;
  wire selector_MUX_139_reg_14_0_0_0;
  wire selector_MUX_140_reg_15_0_0_0;
  wire selector_MUX_141_reg_16_0_0_0;
  wire selector_MUX_142_reg_17_0_0_0;
  wire selector_MUX_143_reg_18_0_0_0;
  wire selector_MUX_144_reg_19_0_0_0;
  wire selector_MUX_145_reg_2_0_0_0;
  wire selector_MUX_146_reg_20_0_0_0;
  wire selector_MUX_147_reg_21_0_0_0;
  wire selector_MUX_148_reg_22_0_0_0;
  wire selector_MUX_149_reg_23_0_0_0;
  wire selector_MUX_150_reg_24_0_0_0;
  wire selector_MUX_151_reg_25_0_0_0;
  wire selector_MUX_152_reg_26_0_0_0;
  wire selector_MUX_153_reg_27_0_0_0;
  wire selector_MUX_154_reg_28_0_0_0;
  wire selector_MUX_155_reg_29_0_0_0;
  wire selector_MUX_156_reg_3_0_0_0;
  wire selector_MUX_157_reg_30_0_0_0;
  wire selector_MUX_158_reg_31_0_0_0;
  wire selector_MUX_159_reg_32_0_0_0;
  wire selector_MUX_160_reg_33_0_0_0;
  wire selector_MUX_161_reg_34_0_0_0;
  wire selector_MUX_162_reg_35_0_0_0;
  wire selector_MUX_163_reg_36_0_0_0;
  wire selector_MUX_164_reg_37_0_0_0;
  wire selector_MUX_165_reg_38_0_0_0;
  wire selector_MUX_166_reg_39_0_0_0;
  wire selector_MUX_167_reg_4_0_0_0;
  wire selector_MUX_168_reg_40_0_0_0;
  wire selector_MUX_169_reg_41_0_0_0;
  wire selector_MUX_170_reg_42_0_0_0;
  wire selector_MUX_171_reg_43_0_0_0;
  wire selector_MUX_172_reg_44_0_0_0;
  wire selector_MUX_173_reg_45_0_0_0;
  wire selector_MUX_174_reg_46_0_0_0;
  wire selector_MUX_175_reg_47_0_0_0;
  wire selector_MUX_176_reg_48_0_0_0;
  wire selector_MUX_178_reg_5_0_0_0;
  wire selector_MUX_180_reg_6_0_0_0;
  wire selector_MUX_181_reg_7_0_0_0;
  wire selector_MUX_182_reg_8_0_0_0;
  wire selector_MUX_183_reg_9_0_0_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_20;
  wire wrenable_reg_21;
  wire wrenable_reg_22;
  wire wrenable_reg_23;
  wire wrenable_reg_24;
  wire wrenable_reg_25;
  wire wrenable_reg_26;
  wire wrenable_reg_27;
  wire wrenable_reg_28;
  wire wrenable_reg_29;
  wire wrenable_reg_3;
  wire wrenable_reg_30;
  wire wrenable_reg_31;
  wire wrenable_reg_32;
  wire wrenable_reg_33;
  wire wrenable_reg_34;
  wire wrenable_reg_35;
  wire wrenable_reg_36;
  wire wrenable_reg_37;
  wire wrenable_reg_38;
  wire wrenable_reg_39;
  wire wrenable_reg_4;
  wire wrenable_reg_40;
  wire wrenable_reg_41;
  wire wrenable_reg_42;
  wire wrenable_reg_43;
  wire wrenable_reg_44;
  wire wrenable_reg_45;
  wire wrenable_reg_46;
  wire wrenable_reg_47;
  wire wrenable_reg_48;
  wire wrenable_reg_49;
  wire wrenable_reg_5;
  wire wrenable_reg_50;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;
  
  controller_gift64_top Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE),
    .selector_MUX_133_reg_0_0_0_0(selector_MUX_133_reg_0_0_0_0),
    .selector_MUX_134_reg_1_0_0_0(selector_MUX_134_reg_1_0_0_0),
    .selector_MUX_135_reg_10_0_0_0(selector_MUX_135_reg_10_0_0_0),
    .selector_MUX_136_reg_11_0_0_0(selector_MUX_136_reg_11_0_0_0),
    .selector_MUX_137_reg_12_0_0_0(selector_MUX_137_reg_12_0_0_0),
    .selector_MUX_138_reg_13_0_0_0(selector_MUX_138_reg_13_0_0_0),
    .selector_MUX_139_reg_14_0_0_0(selector_MUX_139_reg_14_0_0_0),
    .selector_MUX_140_reg_15_0_0_0(selector_MUX_140_reg_15_0_0_0),
    .selector_MUX_141_reg_16_0_0_0(selector_MUX_141_reg_16_0_0_0),
    .selector_MUX_142_reg_17_0_0_0(selector_MUX_142_reg_17_0_0_0),
    .selector_MUX_143_reg_18_0_0_0(selector_MUX_143_reg_18_0_0_0),
    .selector_MUX_144_reg_19_0_0_0(selector_MUX_144_reg_19_0_0_0),
    .selector_MUX_145_reg_2_0_0_0(selector_MUX_145_reg_2_0_0_0),
    .selector_MUX_146_reg_20_0_0_0(selector_MUX_146_reg_20_0_0_0),
    .selector_MUX_147_reg_21_0_0_0(selector_MUX_147_reg_21_0_0_0),
    .selector_MUX_148_reg_22_0_0_0(selector_MUX_148_reg_22_0_0_0),
    .selector_MUX_149_reg_23_0_0_0(selector_MUX_149_reg_23_0_0_0),
    .selector_MUX_150_reg_24_0_0_0(selector_MUX_150_reg_24_0_0_0),
    .selector_MUX_151_reg_25_0_0_0(selector_MUX_151_reg_25_0_0_0),
    .selector_MUX_152_reg_26_0_0_0(selector_MUX_152_reg_26_0_0_0),
    .selector_MUX_153_reg_27_0_0_0(selector_MUX_153_reg_27_0_0_0),
    .selector_MUX_154_reg_28_0_0_0(selector_MUX_154_reg_28_0_0_0),
    .selector_MUX_155_reg_29_0_0_0(selector_MUX_155_reg_29_0_0_0),
    .selector_MUX_156_reg_3_0_0_0(selector_MUX_156_reg_3_0_0_0),
    .selector_MUX_157_reg_30_0_0_0(selector_MUX_157_reg_30_0_0_0),
    .selector_MUX_158_reg_31_0_0_0(selector_MUX_158_reg_31_0_0_0),
    .selector_MUX_159_reg_32_0_0_0(selector_MUX_159_reg_32_0_0_0),
    .selector_MUX_160_reg_33_0_0_0(selector_MUX_160_reg_33_0_0_0),
    .selector_MUX_161_reg_34_0_0_0(selector_MUX_161_reg_34_0_0_0),
    .selector_MUX_162_reg_35_0_0_0(selector_MUX_162_reg_35_0_0_0),
    .selector_MUX_163_reg_36_0_0_0(selector_MUX_163_reg_36_0_0_0),
    .selector_MUX_164_reg_37_0_0_0(selector_MUX_164_reg_37_0_0_0),
    .selector_MUX_165_reg_38_0_0_0(selector_MUX_165_reg_38_0_0_0),
    .selector_MUX_166_reg_39_0_0_0(selector_MUX_166_reg_39_0_0_0),
    .selector_MUX_167_reg_4_0_0_0(selector_MUX_167_reg_4_0_0_0),
    .selector_MUX_168_reg_40_0_0_0(selector_MUX_168_reg_40_0_0_0),
    .selector_MUX_169_reg_41_0_0_0(selector_MUX_169_reg_41_0_0_0),
    .selector_MUX_170_reg_42_0_0_0(selector_MUX_170_reg_42_0_0_0),
    .selector_MUX_171_reg_43_0_0_0(selector_MUX_171_reg_43_0_0_0),
    .selector_MUX_172_reg_44_0_0_0(selector_MUX_172_reg_44_0_0_0),
    .selector_MUX_173_reg_45_0_0_0(selector_MUX_173_reg_45_0_0_0),
    .selector_MUX_174_reg_46_0_0_0(selector_MUX_174_reg_46_0_0_0),
    .selector_MUX_175_reg_47_0_0_0(selector_MUX_175_reg_47_0_0_0),
    .selector_MUX_176_reg_48_0_0_0(selector_MUX_176_reg_48_0_0_0),
    .selector_MUX_178_reg_5_0_0_0(selector_MUX_178_reg_5_0_0_0),
    .selector_MUX_180_reg_6_0_0_0(selector_MUX_180_reg_6_0_0_0),
    .selector_MUX_181_reg_7_0_0_0(selector_MUX_181_reg_7_0_0_0),
    .selector_MUX_182_reg_8_0_0_0(selector_MUX_182_reg_8_0_0_0),
    .selector_MUX_183_reg_9_0_0_0(selector_MUX_183_reg_9_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_36(wrenable_reg_36),
    .wrenable_reg_37(wrenable_reg_37),
    .wrenable_reg_38(wrenable_reg_38),
    .wrenable_reg_39(wrenable_reg_39),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_40(wrenable_reg_40),
    .wrenable_reg_41(wrenable_reg_41),
    .wrenable_reg_42(wrenable_reg_42),
    .wrenable_reg_43(wrenable_reg_43),
    .wrenable_reg_44(wrenable_reg_44),
    .wrenable_reg_45(wrenable_reg_45),
    .wrenable_reg_46(wrenable_reg_46),
    .wrenable_reg_47(wrenable_reg_47),
    .wrenable_reg_48(wrenable_reg_48),
    .wrenable_reg_49(wrenable_reg_49),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_50(wrenable_reg_50),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_gift64_top_428528_429278(OUT_CONDITION_gift64_top_428528_429278),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_gift64_top #(.MEM_var_429362_428528(1024),
    .MEM_var_429679_428528(1024)) Datapath_i (.return_port(return_port),
    .OUT_CONDITION_gift64_top_428528_429278(OUT_CONDITION_gift64_top_428528_429278),
    .clock(clock),
    .reset(reset),
    .in_port_pt(pt),
    .in_port_key_hi(key_hi),
    .in_port_key_lo(key_lo),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i1_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i10_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i11_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i12_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i13_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i14_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i15_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i2_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i3_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i4_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i5_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i6_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i7_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i8_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i9_STORE),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD),
    .fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE(fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE),
    .selector_MUX_133_reg_0_0_0_0(selector_MUX_133_reg_0_0_0_0),
    .selector_MUX_134_reg_1_0_0_0(selector_MUX_134_reg_1_0_0_0),
    .selector_MUX_135_reg_10_0_0_0(selector_MUX_135_reg_10_0_0_0),
    .selector_MUX_136_reg_11_0_0_0(selector_MUX_136_reg_11_0_0_0),
    .selector_MUX_137_reg_12_0_0_0(selector_MUX_137_reg_12_0_0_0),
    .selector_MUX_138_reg_13_0_0_0(selector_MUX_138_reg_13_0_0_0),
    .selector_MUX_139_reg_14_0_0_0(selector_MUX_139_reg_14_0_0_0),
    .selector_MUX_140_reg_15_0_0_0(selector_MUX_140_reg_15_0_0_0),
    .selector_MUX_141_reg_16_0_0_0(selector_MUX_141_reg_16_0_0_0),
    .selector_MUX_142_reg_17_0_0_0(selector_MUX_142_reg_17_0_0_0),
    .selector_MUX_143_reg_18_0_0_0(selector_MUX_143_reg_18_0_0_0),
    .selector_MUX_144_reg_19_0_0_0(selector_MUX_144_reg_19_0_0_0),
    .selector_MUX_145_reg_2_0_0_0(selector_MUX_145_reg_2_0_0_0),
    .selector_MUX_146_reg_20_0_0_0(selector_MUX_146_reg_20_0_0_0),
    .selector_MUX_147_reg_21_0_0_0(selector_MUX_147_reg_21_0_0_0),
    .selector_MUX_148_reg_22_0_0_0(selector_MUX_148_reg_22_0_0_0),
    .selector_MUX_149_reg_23_0_0_0(selector_MUX_149_reg_23_0_0_0),
    .selector_MUX_150_reg_24_0_0_0(selector_MUX_150_reg_24_0_0_0),
    .selector_MUX_151_reg_25_0_0_0(selector_MUX_151_reg_25_0_0_0),
    .selector_MUX_152_reg_26_0_0_0(selector_MUX_152_reg_26_0_0_0),
    .selector_MUX_153_reg_27_0_0_0(selector_MUX_153_reg_27_0_0_0),
    .selector_MUX_154_reg_28_0_0_0(selector_MUX_154_reg_28_0_0_0),
    .selector_MUX_155_reg_29_0_0_0(selector_MUX_155_reg_29_0_0_0),
    .selector_MUX_156_reg_3_0_0_0(selector_MUX_156_reg_3_0_0_0),
    .selector_MUX_157_reg_30_0_0_0(selector_MUX_157_reg_30_0_0_0),
    .selector_MUX_158_reg_31_0_0_0(selector_MUX_158_reg_31_0_0_0),
    .selector_MUX_159_reg_32_0_0_0(selector_MUX_159_reg_32_0_0_0),
    .selector_MUX_160_reg_33_0_0_0(selector_MUX_160_reg_33_0_0_0),
    .selector_MUX_161_reg_34_0_0_0(selector_MUX_161_reg_34_0_0_0),
    .selector_MUX_162_reg_35_0_0_0(selector_MUX_162_reg_35_0_0_0),
    .selector_MUX_163_reg_36_0_0_0(selector_MUX_163_reg_36_0_0_0),
    .selector_MUX_164_reg_37_0_0_0(selector_MUX_164_reg_37_0_0_0),
    .selector_MUX_165_reg_38_0_0_0(selector_MUX_165_reg_38_0_0_0),
    .selector_MUX_166_reg_39_0_0_0(selector_MUX_166_reg_39_0_0_0),
    .selector_MUX_167_reg_4_0_0_0(selector_MUX_167_reg_4_0_0_0),
    .selector_MUX_168_reg_40_0_0_0(selector_MUX_168_reg_40_0_0_0),
    .selector_MUX_169_reg_41_0_0_0(selector_MUX_169_reg_41_0_0_0),
    .selector_MUX_170_reg_42_0_0_0(selector_MUX_170_reg_42_0_0_0),
    .selector_MUX_171_reg_43_0_0_0(selector_MUX_171_reg_43_0_0_0),
    .selector_MUX_172_reg_44_0_0_0(selector_MUX_172_reg_44_0_0_0),
    .selector_MUX_173_reg_45_0_0_0(selector_MUX_173_reg_45_0_0_0),
    .selector_MUX_174_reg_46_0_0_0(selector_MUX_174_reg_46_0_0_0),
    .selector_MUX_175_reg_47_0_0_0(selector_MUX_175_reg_47_0_0_0),
    .selector_MUX_176_reg_48_0_0_0(selector_MUX_176_reg_48_0_0_0),
    .selector_MUX_178_reg_5_0_0_0(selector_MUX_178_reg_5_0_0_0),
    .selector_MUX_180_reg_6_0_0_0(selector_MUX_180_reg_6_0_0_0),
    .selector_MUX_181_reg_7_0_0_0(selector_MUX_181_reg_7_0_0_0),
    .selector_MUX_182_reg_8_0_0_0(selector_MUX_182_reg_8_0_0_0),
    .selector_MUX_183_reg_9_0_0_0(selector_MUX_183_reg_9_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_36(wrenable_reg_36),
    .wrenable_reg_37(wrenable_reg_37),
    .wrenable_reg_38(wrenable_reg_38),
    .wrenable_reg_39(wrenable_reg_39),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_40(wrenable_reg_40),
    .wrenable_reg_41(wrenable_reg_41),
    .wrenable_reg_42(wrenable_reg_42),
    .wrenable_reg_43(wrenable_reg_43),
    .wrenable_reg_44(wrenable_reg_44),
    .wrenable_reg_45(wrenable_reg_45),
    .wrenable_reg_46(wrenable_reg_46),
    .wrenable_reg_47(wrenable_reg_47),
    .wrenable_reg_48(wrenable_reg_48),
    .wrenable_reg_49(wrenable_reg_49),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_50(wrenable_reg_50),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2024 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_view_convert_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// Minimal interface for function: gift64_top
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module gift64_top(clock,
  reset,
  start_port,
  pt,
  key_hi,
  key_lo,
  done_port,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input [63:0] pt;
  input [63:0] key_hi;
  input [63:0] key_lo;
  // OUT
  output done_port;
  output [63:0] return_port;
  // Component and signal declarations
  wire [63:0] out_return_port_ui_view_convert_expr_FU;
  
  _gift64_top _gift64_top_i0 (.done_port(done_port),
    .return_port(out_return_port_ui_view_convert_expr_FU),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .pt(pt),
    .key_hi(key_hi),
    .key_lo(key_lo));
  ui_view_convert_expr_FU #(.BITSIZE_in1(64),
    .BITSIZE_out1(64)) return_port_ui_view_convert_expr_FU (.out1(return_port),
    .in1(out_return_port_ui_view_convert_expr_FU));

endmodule


