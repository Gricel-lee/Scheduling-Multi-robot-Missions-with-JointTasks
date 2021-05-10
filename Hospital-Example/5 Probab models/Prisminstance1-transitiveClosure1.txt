mdp 
label "r1_0_done" = (r1_0_at4_0=true) & (r1_0_at2_0=true) & (r1_0_at2_1=true) & (r1_0_at2_2=true) & (r1_0_at1_0=true) & (r1_0_at1_1=true) & (r1_0_at1_2=true) ;

label "ct1_0" = (r1_0_at1_2 = true) | (r1_0_at2_2 = true) ;

module R1_0
   //robotr1_0 has 7 tasks to schedule 
   //task 1: at4_0
   //task 2: at2_0
   //task 3: at2_1
   //task 4: at2_2
   //task 5: at1_0
   //task 6: at1_1
   //task 7: at1_2
   r1_0 : [0..7];
   r1_0_at4_0 : bool;
   r1_0_at2_0 : bool;
   r1_0_at2_1 : bool;
   r1_0_at2_2 : bool;
   r1_0_at1_0 : bool;
   r1_0_at1_1 : bool;
   r1_0_at1_2 : bool;
   // travel from state 0
   [r1_0_cost0_1] r1_0=0 & r1_0_at4_0=false -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_cost0_2] r1_0=0 & r1_0_at2_0=false -> (r1_0' = 2) & (r1_0_at2_0'=true);
   [r1_0_cost0_3] r1_0=0 & r1_0_at2_1=false -> (r1_0' = 3) & (r1_0_at2_1'=true);
   [r1_0_cost0_4] r1_0=0 & r1_0_at2_2=false -> (r1_0' = 4) & (r1_0_at2_2'=true);
   [r1_0_cost0_5] r1_0=0 & r1_0_at1_0=false -> (r1_0' = 5) & (r1_0_at1_0'=true);
   [r1_0_cost0_6] r1_0=0 & r1_0_at1_1=false -> (r1_0' = 6) & (r1_0_at1_1'=true);
   [r1_0_cost0_7] r1_0=0 & r1_0_at1_2=false -> (r1_0' = 7) & (r1_0_at1_2'=true);
   // travel from state 1
   [r1_0_cost1_1] r1_0=1 & r1_0_at4_0=false -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_cost1_4] r1_0=1 & r1_0_at2_2=false -> (r1_0' = 4) & (r1_0_at2_2'=true);
   [r1_0_cost1_7] r1_0=1 & r1_0_at1_2=false -> (r1_0' = 7) & (r1_0_at1_2'=true);
   // travel from state 2 - require state5(at1_0) to be done, otherwise go to 5
   [r1_0_cost2_1] r1_0=2 & r1_0_at4_0=false & r1_0_at1_0=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_cost2_2] r1_0=2 & r1_0_at2_0=false & r1_0_at1_0=true -> (r1_0' = 2) & (r1_0_at2_0'=true);
   [r1_0_cost2_3] r1_0=2 & r1_0_at2_1=false & r1_0_at1_0=true -> (r1_0' = 3) & (r1_0_at2_1'=true);
   [r1_0_cost2_4] r1_0=2 & r1_0_at2_2=false & r1_0_at1_0=true -> (r1_0' = 4) & (r1_0_at2_2'=true);
   [r1_0_cost2_5] r1_0=2 & r1_0_at1_0=false & r1_0_at1_0=false -> (r1_0' = 5) & (r1_0_at1_0'=true);
   [r1_0_cost2_6] r1_0=2 & r1_0_at1_1=false & r1_0_at1_0=true -> (r1_0' = 6) & (r1_0_at1_1'=true);
   [r1_0_cost2_7] r1_0=2 & r1_0_at1_2=false & r1_0_at1_0=true -> (r1_0' = 7) & (r1_0_at1_2'=true);
   // travel from state 3 - requires state 6(at1_1) to be done, otherwise go to 6
   [r1_0_cost3_1] r1_0=3 & r1_0_at4_0=false & r1_0_at1_1=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_cost3_2] r1_0=3 & r1_0_at2_0=false & r1_0_at1_1=true -> (r1_0' = 2) & (r1_0_at2_0'=true);
   [r1_0_cost3_3] r1_0=3 & r1_0_at2_1=false & r1_0_at1_1=true -> (r1_0' = 3) & (r1_0_at2_1'=true);
   [r1_0_cost3_4] r1_0=3 & r1_0_at2_2=false & r1_0_at1_1=true -> (r1_0' = 4) & (r1_0_at2_2'=true);
   [r1_0_cost3_5] r1_0=3 & r1_0_at1_0=false & r1_0_at1_1=true -> (r1_0' = 5) & (r1_0_at1_0'=true);
   [r1_0_cost3_6] r1_0=3 & r1_0_at1_1=false & r1_0_at1_1=false -> (r1_0' = 6) & (r1_0_at1_1'=true);
   [r1_0_cost3_7] r1_0=3 & r1_0_at1_2=false & r1_0_at1_1=true -> (r1_0' = 7) & (r1_0_at1_2'=true);
   // travel from state 4 - requires state 7(at1_2) to be done, otherwise go do 7
   [r1_0_cost4_1] r1_0=4 & r1_0_at4_0=false & r1_0_at1_2=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_cost4_2] r1_0=4 & r1_0_at2_0=false & r1_0_at1_2=true -> (r1_0' = 2) & (r1_0_at2_0'=true);
   [r1_0_cost4_3] r1_0=4 & r1_0_at2_1=false & r1_0_at1_2=true -> (r1_0' = 3) & (r1_0_at2_1'=true);
   [r1_0_cost4_4] r1_0=4 & r1_0_at2_2=false & r1_0_at1_2=true -> (r1_0' = 4) & (r1_0_at2_2'=true);
   [r1_0_cost4_5] r1_0=4 & r1_0_at1_0=false & r1_0_at1_2=true -> (r1_0' = 5) & (r1_0_at1_0'=true);
   [r1_0_cost4_6] r1_0=4 & r1_0_at1_1=false & r1_0_at1_2=true -> (r1_0' = 6) & (r1_0_at1_1'=true);
   [r1_0_cost4_7] r1_0=4 & r1_0_at1_2=false & r1_0_at1_2=false -> (r1_0' = 7) & (r1_0_at1_2'=true);
   // travel from state 5 - requires state 2(at2_0) to be done, otherwise go do 2
   [r1_0_cost5_1] r1_0=5 & r1_0_at4_0=false & r1_0_at2_0=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_cost5_2] r1_0=5 & r1_0_at2_0=false & r1_0_at2_0=false -> (r1_0' = 2) & (r1_0_at2_0'=true);
   [r1_0_cost5_3] r1_0=5 & r1_0_at2_1=false & r1_0_at2_0=true -> (r1_0' = 3) & (r1_0_at2_1'=true);
   [r1_0_cost5_4] r1_0=5 & r1_0_at2_2=false & r1_0_at2_0=true -> (r1_0' = 4) & (r1_0_at2_2'=true);
   [r1_0_cost5_5] r1_0=5 & r1_0_at1_0=false & r1_0_at2_0=true -> (r1_0' = 5) & (r1_0_at1_0'=true);
   [r1_0_cost5_6] r1_0=5 & r1_0_at1_1=false & r1_0_at2_0=true -> (r1_0' = 6) & (r1_0_at1_1'=true);
   [r1_0_cost5_7] r1_0=5 & r1_0_at1_2=false & r1_0_at2_0=true -> (r1_0' = 7) & (r1_0_at1_2'=true);
   // travel from state 6 - requires state 3(at2_1) to be done, otherwise go to 3
   [r1_0_cost6_1] r1_0=6 & r1_0_at4_0=false & r1_0_at2_1=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_cost6_2] r1_0=6 & r1_0_at2_0=false & r1_0_at2_1=true -> (r1_0' = 2) & (r1_0_at2_0'=true);
   [r1_0_cost6_3] r1_0=6 & r1_0_at2_1=false & r1_0_at2_1=false -> (r1_0' = 3) & (r1_0_at2_1'=true);
   [r1_0_cost6_4] r1_0=6 & r1_0_at2_2=false & r1_0_at2_1=true -> (r1_0' = 4) & (r1_0_at2_2'=true);
   [r1_0_cost6_5] r1_0=6 & r1_0_at1_0=false & r1_0_at2_1=true -> (r1_0' = 5) & (r1_0_at1_0'=true);
   [r1_0_cost6_6] r1_0=6 & r1_0_at1_1=false & r1_0_at2_1=true -> (r1_0' = 6) & (r1_0_at1_1'=true);
   [r1_0_cost6_7] r1_0=6 & r1_0_at1_2=false & r1_0_at2_1=true -> (r1_0' = 7) & (r1_0_at1_2'=true);
   // travel from state 7 - requires state 4(at2_2) to be done, otherwise go to 4
   [r1_0_cost7_1] r1_0=7 & r1_0_at4_0=false & r1_0_at2_2=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_cost7_2] r1_0=7 & r1_0_at2_0=false & r1_0_at2_2=true -> (r1_0' = 2) & (r1_0_at2_0'=true);
   [r1_0_cost7_3] r1_0=7 & r1_0_at2_1=false & r1_0_at2_2=true -> (r1_0' = 3) & (r1_0_at2_1'=true);
   [r1_0_cost7_4] r1_0=7 & r1_0_at2_2=false & r1_0_at2_2=false -> (r1_0' = 4) & (r1_0_at2_2'=true);
   [r1_0_cost7_5] r1_0=7 & r1_0_at1_0=false & r1_0_at2_2=true -> (r1_0' = 5) & (r1_0_at1_0'=true);
   [r1_0_cost7_6] r1_0=7 & r1_0_at1_1=false & r1_0_at2_2=true -> (r1_0' = 6) & (r1_0_at1_1'=true);
   [r1_0_cost7_7] r1_0=7 & r1_0_at1_2=false & r1_0_at2_2=true -> (r1_0' = 7) & (r1_0_at1_2'=true);
endmodule


rewards
   [r1_0_cost0_1] true: 1;
   [r1_0_cost0_2] true: 1;
   [r1_0_cost0_3] true: 1;
   [r1_0_cost0_4] true: 1;
   [r1_0_cost0_5] true: 1;
   [r1_0_cost0_6] true: 1;
   [r1_0_cost0_7] true: 1;
   [r1_0_cost1_1] true: 1;
   [r1_0_cost1_4] true: 1;
   [r1_0_cost1_7] true: 1;
   [r1_0_cost2_1] true: 1;
   [r1_0_cost2_2] true: 1;
   [r1_0_cost2_3] true: 1;
   [r1_0_cost2_4] true: 1;
   [r1_0_cost2_5] true: 1;
   [r1_0_cost2_6] true: 1;
   [r1_0_cost2_7] true: 1;
   [r1_0_cost3_1] true: 1;
   [r1_0_cost3_2] true: 1;
   [r1_0_cost3_3] true: 1;
   [r1_0_cost3_4] true: 1;
   [r1_0_cost3_5] true: 1;
   [r1_0_cost3_6] true: 1;
   [r1_0_cost3_7] true: 1;
   [r1_0_cost4_1] true: 1;
   [r1_0_cost4_2] true: 1;
   [r1_0_cost4_3] true: 1;
   [r1_0_cost4_4] true: 1;
   [r1_0_cost4_5] true: 1;
   [r1_0_cost4_6] true: 1;
   [r1_0_cost4_7] true: 1;
   [r1_0_cost5_1] true: 1;
   [r1_0_cost5_2] true: 1;
   [r1_0_cost5_3] true: 1;
   [r1_0_cost5_4] true: 1;
   [r1_0_cost5_5] true: 1;
   [r1_0_cost5_6] true: 1;
   [r1_0_cost5_7] true: 1;
   [r1_0_cost6_1] true: 1;
   [r1_0_cost6_2] true: 1;
   [r1_0_cost6_3] true: 1;
   [r1_0_cost6_4] true: 1;
   [r1_0_cost6_5] true: 1;
   [r1_0_cost6_6] true: 1;
   [r1_0_cost6_7] true: 1;
   [r1_0_cost7_1] true: 1;
   [r1_0_cost7_2] true: 1;
   [r1_0_cost7_3] true: 1;
   [r1_0_cost7_4] true: 1;
   [r1_0_cost7_5] true: 1;
   [r1_0_cost7_6] true: 1;
   [r1_0_cost7_7] true: 1;
endrewards
