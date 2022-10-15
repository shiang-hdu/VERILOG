module  complex_adder
#(parameter WID = 58)
(
  input                   clk,
  input                   rst_n,
  input      [WID-1:0]    ina,    
  input      [WID-1:0]    inb,
  
  output reg [WID+1:0]    result
); 


always@(posedge clk, negedge rst_n)
begin
  if(~rst_n)
     result   <=  0;
  else begin
     result[WID/2 : 0]       <=  ina[WID/2-1 : 0]    +  inb[WID/2-1 : 0]; 
     result[WID+1 : WID/2+1] <=  ina[WID-1 : WID/2]  +  inb[WID-1 : WID/2];    //57:29 
  end 
end


endmodule

 
 
 