
module TaxiMeter(
input clock,
input vip_enable,
input moving,
input reset_income,
input seat_0, seat_1, seat_2, seat_3,
output reg [0:13] s0cost, s1cost, s2cost, s3cost,
output reg [0:13] vip_cost,
output reg [0:13] overall_income
);


initial begin 
  s0cost  = 1'b0 ;
  s1cost  = 1'b0  ;
  s2cost  = 1'b0  ;
  s3cost  = 1'b0  ;
  vip_cost  = 1'b0 ;
  overall_income = 1'b0;
end 



always @(posedge clock)begin 
  if (vip_enable == 0) begin

    if (seat_0 == 1 && s0cost == 0) begin
      overall_income = overall_income + 4'b1010;
      s0cost = 4'b1010;
      end

    if (seat_1 == 1 && s1cost == 0) begin
      overall_income = overall_income + 4'b1010;
      s1cost = 4'b1010;
      end;

    if (seat_2 == 1 && s2cost == 0) begin
      overall_income = overall_income + 4'b1010;
      s2cost = 4'b1010;
      end
    
    if (seat_3 == 1 && s3cost == 0) begin
      overall_income = overall_income + 4'b1010;
      s3cost = 4'b1010;
      end

  end else if (vip_enable == 1 && vip_cost == 0) begin             
    overall_income = overall_income + 4'b1010;
    vip_cost = 4'b1010;
    end









if(vip_enable == 0)begin
vip_cost  = 1'b0 ;

if(moving==0)begin
if( seat_0 ==1)begin overall_income=3'b101+overall_income;       s0cost=3'b101+s0cost;    end 
if( seat_1 ==1)begin overall_income=3'b101+overall_income;       s1cost=3'b101+s1cost;    end 
if( seat_2 ==1)begin overall_income=3'b101+overall_income;       s2cost=3'b101+s2cost;    end 
if( seat_3 ==1)begin overall_income=3'b101+overall_income;       s3cost=3'b101+s3cost;    end 

end else if (moving ==1)begin 
if( seat_0 ==1)begin overall_income=4'b1000+overall_income;       s0cost=4'b1000+s0cost;     end 
if( seat_1 ==1)begin overall_income=4'b1000+overall_income;       s1cost=4'b1000+s1cost;     end 
if( seat_2 ==1)begin overall_income=4'b1000+overall_income;       s2cost=4'b1000+s2cost;     end 
if( seat_3 ==1)begin overall_income=4'b1000+overall_income;       s3cost=4'b1000+s3cost;     end 
end

end else if (vip_enable==1)begin
s0cost  = 1'b0 ;
s1cost  = 1'b0  ;
s2cost  = 1'b0  ;
s3cost  = 1'b0  ;
if(moving==0)begin
vip_cost  = 3'b101+vip_cost;
overall_income  =3'b101+overall_income;
end else if(moving ==1)begin 
vip_cost  = 16'b10000+vip_cost;
overall_income  =16'b10000+overall_income;
end

end 

end 

always @(posedge reset_income)begin 
s0cost  = 1'b0 ;
s1cost  = 1'b0  ;
s2cost  = 1'b0  ;
s3cost  = 1'b0  ;
vip_cost  = 1'b0 ;
overall_income = 1'b0;
end 

endmodule 
