module cpu(input rst,input clk,input [3:0]btn,
    output [7:0]col, output [7:0]row,
    output [5:0]leds,
    output low,low2,high,
    input Abtn,Bbtn,
    input dip,dip2
);

    assign low=0;
    assign low=2;
    assign high=1;
    wire [7:0]dout;
	reg c_flag;
	reg [7:0]regs[7:0];
    reg [7:0]ram[15:0];
    reg [28:0] counter;
    reg [2:0] i,j;

    assign leds[0]=0;
    assign leds[1]=!Bbtn;   
    assign leds[2]=!dip;
    assign leds[3]=!dip2;
    assign leds[4]=!Abtn;
    assign leds[5]=!c_flag;
//    assign col={4'b0000,regs[counter[15:13]]};
//    assign col=regs[ counter[15:13]] | 1<<i;
//    assign col=(regs[ counter[15:13]] | (counter[15:13]==j)?(1<<i):0);
//    assign col=regs[counter[15:13]];
//    assign col=counter[28:21];
  
//   assign col=regs[counter[15:13]] | (counter[15:13]==3'b001)?8'b10000000:0;

//   assign col=(counter[15:13]==0)?regs[0]:0;

    assign col=(((counter[15:13]==j)&& (counter[21]))?1<<i:0)|(regs[counter[15:13]] );
//    assign col=(((counter[15:13]==j)&& (counter[21]))?1<<i:~(1<<i))|(regs[counter[15:13]] );
    assign row[0]=(counter[15:13]==0?0:1);
    assign row[1]=(counter[15:13]==1?0:1);
    assign row[2]=(counter[15:13]==2?0:1);
    assign row[3]=(counter[15:13]==3?0:1);
    assign row[4]=(counter[15:13]==4?0:1);
    assign row[5]=(counter[15:13]==5?0:1);
    assign row[6]=(counter[15:13]==6?0:1);
    assign row[7]=(counter[15:13]==7?0:1);

/*
    assign row[0]=(counter[15:13]==0?0:1)|(j!=0);
    assign row[1]=(counter[15:13]==1?0:1)|(j!=1);
    assign row[2]=(counter[15:13]==2?0:1)|(j!=2);
    assign row[3]=(counter[15:13]==3?0:1)|(j!=3);
    assign row[4]=(counter[15:13]==4?0:1)|(j!=4);
    assign row[5]=(counter[15:13]==5?0:1)|(j!=5);
    assign row[6]=(counter[15:13]==6?0:1)|(j!=6);
    assign row[7]=(counter[15:13]==7?0:1)|(j!=7);
*/

//    assign dout = ram[regs[7]];

    initial begin
//       `include "sensor1.asm"
          regs[0]= 8'b00000001;
          regs[1]= 8'b00000010;
          regs[2]= 8'b00000100;
          regs[3]= 8'b00001000;
          regs[4]= 8'b00010000;
          regs[5]= 8'b00100000;
          regs[6]= 8'b01000000;
          regs[7]= 8'b10000000;
    end
  /*   
	always @(posedge counter[21]  or negedge rst)
	  if(rst==0) {regs[0],regs[1],regs[2],regs[3],regs[4],regs[5],regs[6],regs[7],i,j,c_flag}=0;
*/
	always @(posedge counter[21]  or negedge rst)
	  if(rst==0) {i,j,c_flag}=0;
	  else begin   
//      if (Abtn==1) regs[j][i]=0;
      case(btn)
        4'b0111: i=i+1;
        4'b1101: j=j+1;
        4'b1011: j=j-1;
        4'b1110: i=i-1;
	  endcase
      if (Abtn==0) regs[j][i]=1;
      if (Bbtn==0) regs[j][i]=0;
end
    always @(posedge clk) counter <= counter + 1;

endmodule