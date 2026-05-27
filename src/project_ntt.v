`default_nettype none
module tt_um_examplei (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);
    reg [7:0] ntt_out;
    reg ready_flag;
    reg done_flag;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ntt_out    <= 8'h00;
            ready_flag <= 1'b0;
            done_flag  <= 1'b0;
        end else begin
            ready_flag <= 1'b1;
            ntt_out    <= (ui_in * 8'd3) % 8'd17;
            done_flag  <= 1'b1;
        end
    end

    assign uo_out  = ntt_out;
    assign uio_out = {6'b0, done_flag, ready_flag};
    assign uio_oe  = 8'b0000_0011;
    wire _unused = &{ena, uio_in, 1'b0};
endmodule
