//door security system 

/*
                    password_input  <-------------------|
                         |                              |
                         |                              |
                         |                              |
                         |                              |
                         |                              |
preset_password ----> compare                           |
                         |                              |
                         |                              |
access_granted           |             access_denied    |
      |          ___________________         |          |
      |          |                 |         |          |
      |          |                 |         |          |
      |          |                 |         |          |
      |-------Correct            wrong -------          |
              count=0              |                    |
                                   |                    |
                                   |                    |
                               increment                |
                                   |                    |
                                   |                    |
                                   |                    |
    reset count=0              count<3(attempt)-----------
      |                            |
      |                            |
      |                            |
      |---->off<---->alram<-----count==3



*/



module door_security(clk,reset,set_password,passin,enter, access,count,alram);
  input reset,enter,clk;
  input [11:0] set_password,passin;
  output access,alram;
  output [1:0] count;
  wire check;
  
  assign check=!(set_password^passin);
  main_module dut(clk,enter,check,reset,count,access,alram);
endmodule

//// module modN_ctr

module main_module(clk,enter,E,rstn,cnt,access,alram);
  parameter N=4;
  parameter width=2;
  input enter,rstn,E,clk;
  output reg access,alram;
  output reg [width-1:0] cnt;
  
  always@(posedge enter,posedge rstn,posedge clk)
    if(rstn) begin
      access<=0;
      alram<=0;
      cnt<=0;
    end
  else if(enter)
    begin
      if(E)
        begin
        access<=1;
      alram<=0;
        end
      else begin
        access<=0;
        alram<=1;
        cnt<=cnt+1;
        if(cnt==3)
          begin
            access<=0;
            alram<=1;
          end
      end
    end
  else begin
    cnt<=0;
    access<=0;
    alram<=0;
  end
  
endmodule
