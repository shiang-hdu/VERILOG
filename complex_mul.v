module  complex_mul
#(parameter WIDTH = 32)
(
  input                     clk,
  input                     rst_n,
  input      [WIDTH-1:0]    mula,    
  input      [WIDTH-1:0]    mulb,
  
  output reg [2*WIDTH-1:0]  result
 ); 
 
 /* define internal reg */
 wire     [WIDTH/2-1:0]  areal;
 wire     [WIDTH/2-1:0]  aimg;
 wire     [WIDTH/2-1:0]  breal;
 wire     [WIDTH/2-1:0]  bimg;
 reg      [WIDTH-1:0]    res_real;
 reg      [WIDTH-1:0]    res_img;
 
 
 assign  areal = mula[WIDTH/2-1:0];
 assign  aimg  = mula[WIDTH-1:WIDTH/2];
 assign  breal = mulb[WIDTH/2-1:0];
 assign  bimg  = mulb[WIDTH-1:WIDTH/2];
 
 // two stage complex multiplier
 always@(posedge clk, negedge rst_n)
 begin
   if(~rst_n) 
     res_real <= 0;
   else
     res_real <= areal*breal - aimg*bimg;        
 end
 
 
 always@(posedge clk, negedge rst_n)
 begin
   if(~rst_n) 
     res_img <= 0;
   else
     res_img <= areal*bimg + aimg*breal;        
 end
 
 
 always@(posedge clk, negedge rst_n)
 begin
   if(~rst_n) 
     result <= 0;
   else
     result <= {res_real,res_img};
 end
 
 endmodule      