module cpu(input [3:0]btn,output [5:0]leds,low,input Abtn,Bbtn);
    assign low=0;
    assign leds[0]=btn[0];
    assign leds[1]=btn[1];   
    assign leds[2]=btn[2];
    assign leds[3]=btn[3];
    assign leds[4]=Abtn;
    assign leds[5]=Bbtn;
endmodule

