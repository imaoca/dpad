module dpad2(input rst,clk,btn3,[3:0]btn,output low,input Abtn,Bbtn,output [7:0]col,[7:0]row);
    assign low=0;
	reg [7:0]regs[7:0];
    reg [28:0] counter;
    reg [2:0] x,y;

    assign col=(btn3==1)?(((counter[15:13]==y)&& (counter[21]))?1<<x:0)^(regs[counter[15:13]] ):regs[counter[15:13]];
//  assign col=(((counter[15:13]==y)&& (counter[21]))?1<<x:0)^(regs[counter[15:13]] );
    assign row = ~(1<<counter[15:13]);

	always @(posedge counter[21]  or negedge rst)
	  if(rst==0) {regs[0],regs[1],regs[2],regs[3],regs[4],regs[5],regs[6],regs[7],x,y}=0;
	  else begin 
      if (btn3==1) begin
      case(btn)
        4'b0111: x=x+1;
        4'b1101: y=y+1;
        4'b1011: y=y-1;
        4'b1110: x=x-1;
	  endcase
      if (Abtn==0) regs[y][x]=1;
      if (Bbtn==0) regs[y][x]=0;
    end
   end

   always @(posedge clk) counter <= counter + 1;
endmodule