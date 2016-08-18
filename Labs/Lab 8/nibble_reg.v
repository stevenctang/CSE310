// name: Nibble_Reg
// desc: four bit register with output enable (low),
//        made from D flip-flops
// date:
// by  : 
module Nibble_Reg(data_out,data_in,load,out_en);
  input  [3:0] data_in;
  input        load,out_en;
  output [3:0] data_out;

  // wires between flip-flops and tri-state gates
  wire   [3:0] dff_out;

  // instantiate tri-state gates to do output enable
  bufif0 tri3(data_out[3],dff_out[3],out_en);
  bufif0 tri2(data_out[2],dff_out[2],out_en);
  bufif0 tri11(data_out[1],dff_out[1],out_en); // tri1 is a gate type
  bufif0 tri00(data_out[0],dff_out[0],out_en); // tri0 is a gate type


  //instantiate D flip-flops here
  D_FF Reg_Bit_3(dff_out[3],data_in[3],load);

     // finish making instances

endmodule
