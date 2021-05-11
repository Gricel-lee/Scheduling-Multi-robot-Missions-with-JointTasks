mdp 
label "r1_0_done" = (r1_0_at4_0=true) & (r1_0_at2_2=true) & (r1_0_at1_2=true) ;
label "r2_0_done" = (r2_0_at2_0=true) & (r2_0_at2_1=true) & (r2_0_at1_0=true) & (r2_0_at1_1=true) ;

//sequential over multiple robots
// (!((r1_0_at1_2) | (r2_0_at2_0))) U (r1_0_at4_0)

module R1_0
   //robotr1_0 has 3 tasks to schedule 
   //task 1: at4_0
   //task 2: at2_2
   //task 3: at1_2
   r1_0 : [0..3];
   r1_0_at4_0 : bool;
   r1_0_at2_2 : bool;
   r1_0_at1_2 : bool;

   //instead of r1_0_at1_2 do ct12 

   // travel from state 0
   [r1_0_cost0_1] r1_0=0 & r1_0_at4_0=false -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_cost0_2] r1_0=0 & r1_0_at2_2=false -> (r1_0' = 2) & (r1_0_at2_2'=true);
   [r1_0_cost0_3] r1_0=0 & r1_0_at1_2=false -> (r1_0' = 3) & (r1_0_at1_2'=true);
   // travel from state 1
   [r1_0_cost1_1] r1_0=1 & r1_0_at4_0=false -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_cost1_2] r1_0=1 & r1_0_at2_2=false -> (r1_0' = 2) & (r1_0_at2_2'=true);
   [r1_0_cost1_3] r1_0=1 & r1_0_at1_2=false -> (r1_0' = 3) & (r1_0_at1_2'=true);
   // travel from state 2  -- if robot get here, and r2_0_at1_1 is not done, do it
   [do_ct1_0_2] r1_0=2 & r2_0_at1_1=false -> (r1_0'=2);
   [do_ct1_0_1] r2_0=4 & r1_0_at2_2=false -> (r1_0'=2)  & (r1_0_at2_2'=true);
   
   [r1_0_cost2_1] r1_0=2 & r1_0_at4_0=false & r2_0_at1_1=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_cost2_3] r1_0=2 & r1_0_at1_2=false & r2_0_at1_1=true -> (r1_0' = 3) & (r1_0_at1_2'=true);
   // travel from state 3 -- if robot get here, and r2_0_at2_0 is not done, do it
   [do_ct1_2_2] r1_0=3 & r2_0_at2_0=false -> (r1_0'=3);
   [do_ct1_2_1] r2_0=1 & r1_0_at1_2=false -> (r1_0'=3) & (r1_0_at1_2'=true);

   [r1_0_cost3_1] r1_0=3 & r1_0_at4_0=false & r2_0_at2_0=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_cost3_2] r1_0=3 & r1_0_at2_2=false & r2_0_at2_0=true -> (r1_0' = 2) & (r1_0_at2_2'=true);
   
endmodule
module R2_0
   //robotr2_0 has 4 tasks to schedule 
   //task 1: at2_0
   //task 2: at2_1
   //task 3: at1_0
   //task 4: at1_1
   r2_0 : [0..4];
   r2_0_at2_0 : bool;
   r2_0_at2_1 : bool;
   r2_0_at1_0 : bool;
   r2_0_at1_1 : bool;
   // travel from state 0
   [r2_0_cost0_1] r2_0=0 & r2_0_at2_0=false -> (r2_0' = 1) & (r2_0_at2_0'=true);
   [r2_0_cost0_2] r2_0=0 & r2_0_at2_1=false -> (r2_0' = 2) & (r2_0_at2_1'=true);
   [r2_0_cost0_3] r2_0=0 & r2_0_at1_0=false -> (r2_0' = 3) & (r2_0_at1_0'=true);
   [r2_0_cost0_4] r2_0=0 & r2_0_at1_1=false -> (r2_0' = 4) & (r2_0_at1_1'=true);
   // travel from state 1 -- if robot get here, and r1_0_at1_2 is not done, do it
   [do_ct1_2_1] r2_0=1 & r1_0_at1_2=false -> (r2_0'=1);
   [do_ct1_2_2] r1_0=3 & r2_0_at2_0=false -> (r2_0'=1) & (r2_0_at2_0'=true);

   [r2_0_cost1_2] r2_0=1 & r2_0_at2_1=false & r1_0_at1_2=true -> (r2_0' = 2) & (r2_0_at2_1'=true);
   [r2_0_cost1_3] r2_0=1 & r2_0_at1_0=false & r1_0_at1_2=true -> (r2_0' = 3) & (r2_0_at1_0'=true);
   [r2_0_cost1_4] r2_0=1 & r2_0_at1_1=false & r1_0_at1_2=true -> (r2_0' = 4) & (r2_0_at1_1'=true);
   // travel from state 2
   [r2_0_cost2_1] r2_0=2 & r2_0_at2_0=false -> (r2_0' = 1) & (r2_0_at2_0'=true);
   [r2_0_cost2_3] r2_0=2 & r2_0_at1_0=false -> (r2_0' = 3) & (r2_0_at1_0'=true);
   [r2_0_cost2_4] r2_0=2 & r2_0_at1_1=false -> (r2_0' = 4) & (r2_0_at1_1'=true);
   // travel from state 3
   [r2_0_cost3_1] r2_0=3 & r2_0_at2_0=false -> (r2_0' = 1) & (r2_0_at2_0'=true);
   [r2_0_cost3_2] r2_0=3 & r2_0_at2_1=false -> (r2_0' = 2) & (r2_0_at2_1'=true);
   [r2_0_cost3_4] r2_0=3 & r2_0_at1_1=false -> (r2_0' = 4) & (r2_0_at1_1'=true);
   // travel from state 4 -- if robot get here, and r1_0_at2_2 is not done, do it
   [do_ct1_0_1] r2_0=4 & r1_0_at2_2=false -> (r2_0'=4);
   [do_ct1_0_2] r1_0=2 & r2_0_at1_1=false -> (r2_0'=4) & (r2_0_at1_1'=true);

   [r2_0_cost4_1] r2_0=4 & r2_0_at2_0=false &  r1_0_at1_2=true -> (r2_0' = 1) & (r2_0_at2_0'=true);
   [r2_0_cost4_2] r2_0=4 & r2_0_at2_1=false &  r1_0_at1_2=true -> (r2_0' = 2) & (r2_0_at2_1'=true);
   [r2_0_cost4_3] r2_0=4 & r2_0_at1_0=false &  r1_0_at1_2=true -> (r2_0' = 3) & (r2_0_at1_0'=true);
   endmodule

rewards
   [r1_0_cost0_1] true: 1;
   [r1_0_cost0_2] true: 1;
   [r1_0_cost0_3] true: 1;
   [r1_0_cost1_1] true: 1;
   [r1_0_cost1_2] true: 1;
   [r1_0_cost1_3] true: 1;
   [r1_0_cost2_1] true: 1;
   [r1_0_cost2_3] true: 1;
   [r1_0_cost3_1] true: 1;
   [r1_0_cost3_2] true: 1;
   [r2_0_cost0_1] true: 1;
   [r2_0_cost0_2] true: 1;
   [r2_0_cost0_3] true: 1;
   [r2_0_cost0_4] true: 1;
   [r2_0_cost1_2] true: 1;
   [r2_0_cost1_3] true: 1;
   [r2_0_cost1_4] true: 1;
   [r2_0_cost2_1] true: 1;
   [r2_0_cost2_3] true: 1;
   [r2_0_cost2_4] true: 1;
   [r2_0_cost3_1] true: 1;
   [r2_0_cost3_2] true: 1;
   [r2_0_cost3_4] true: 1;
   [r2_0_cost4_1] true: 1;
   [r2_0_cost4_2] true: 1;
   [r2_0_cost4_3] true: 1;
endrewards
