
module dual_port (  input clk,
                    input rst,
                    input we,
                    input re,
                    input [4:0] addr,
                    input [7:0] wdata,
                    output reg [7:0] rdata
                 );

    //memory
    reg [7:0] mem[32];

    //reset
    always @(posedge rst)
    begin
        for(int i=0; i<32; i++)
        mem[i] <= 8'h00;
    end

    //write data
    always @(posedge clk)
    begin
        if(we)
            mem[addr] <= wdata;
    end


    //read data
    always @(posedge clk)
    begin
        if(re)
            rdata <= mem[addr];
    end


endmodule
