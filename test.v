// Code your testbench here
// or browse Examples
module tb();
  reg  reset,enter,clk;
  reg [11:0] set_password,passin;
  wire access,alram;
  wire [1:0] count;
  
  door_security dut (.clk(clk),.reset(reset),.set_password(set_password),.passin(passin),.enter(enter),.access(access),.count(count),.alram(alram));
  
  initial begin
    clk=0;
    repeat(11) begin
    #05 clk=~clk;
  end
  end
  
  initial

    begin
      
      set_password=8'hA8;
      reset=1'b1;
      passin=8'hff;
      enter=1'b1;
      #10;
      set_password=8'hA8;
      reset=1'b0;
      passin=8'hff;
      enter=1'b1;
      #10;
      set_password=8'hA8;
      reset=1'b0;
      passin=8'hA8;
      enter=1'b1;
      
      #10;
      set_password=8'hA8;
      reset=1'b0;
      passin=8'hfe;
      enter=1'b1;
      #10;
      set_password=8'hA8;
      reset=1'b0;
      passin=8'hA8;
      enter=1'b1;
      
      #10;
      set_password=8'hA8;
      reset=1'b0;
      passin=8'hfe;
      enter=1'b0;
      
      #10;
      set_password=8'hA8;
      reset=1'b0;
      passin=8'hAE;
      enter=1'b1;
      
      #10;
      set_password=8'hA8;
      reset=1'b0;
      passin=8'hfe;
      enter=1'b1;
      #10;
      set_password=8'hA8;
      reset=1'b0;
      passin=8'hA8;
      enter=1'b1;
      #10;
      set_password=8'hA8;
      reset=1'b0;
      passin=8'hA9;
      enter=1'b1;
      #10;
      set_password=8'hA8;
      reset=1'b0;
      passin=8'hA8;
      enter=1'b0;
      
    end
  
  initial begin
  $dumpfile("dump.vcd"); $dumpvars;
end
endmodule
