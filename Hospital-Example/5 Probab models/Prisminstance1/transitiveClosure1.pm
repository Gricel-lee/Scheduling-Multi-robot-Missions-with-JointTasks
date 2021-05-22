mdp 
label "r1_0_done" = (r1_0_at4_0=true) & (r1_0_at2_0=true) & (r1_0_at2_1=true) & (r1_0_at2_2=true) & (r1_0_at1_0=true) & (r1_0_at1_1=true) & (r1_0_at1_2=true) ;

label "ct1_0" = (r1_0_at1_2 = true) | (r1_0_at2_2 = true) ;

module R1_0
   //robotr1_0 has 7 tasks to schedule 
   //state 1: task at4_0
   //state 2: task at2_0
   //state 3: task at2_1
   //state 4: task at2_2
   //state 5: task at1_0
   //state 6: task at1_1
   //state 7: task at1_2
   r1_0 : [0..7];
   r1_0_at4_0 : bool;
   r1_0_at2_0 : bool;
   r1_0_at2_1 : bool;
   r1_0_at2_2 : bool;
   r1_0_at1_0 : bool;
   r1_0_at1_1 : bool;
   r1_0_at1_2 : bool;
   // travel from state 0
   [r1_0_0_to_1] r1_0=0 & r1_0_at4_0=false -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_0_to_2] r1_0=0 & r1_0_at2_0=false -> (r1_0' = 2) & (r1_0_at2_0'=true);
   [r1_0_0_to_3] r1_0=0 & r1_0_at2_1=false -> (r1_0' = 3) & (r1_0_at2_1'=true);
   [r1_0_0_to_5] r1_0=0 & r1_0_at1_0=false -> (r1_0' = 5) & (r1_0_at1_0'=true);
   [r1_0_0_to_6] r1_0=0 & r1_0_at1_1=false -> (r1_0' = 6) & (r1_0_at1_1'=true);
   // travel from state 1
   [r1_0_1_to_4] r1_0=1 & r1_0_at2_2=false -> (r1_0' = 4) & (r1_0_at2_2'=true);
   [r1_0_1_to_7] r1_0=1 & r1_0_at1_2=false -> (r1_0' = 7) & (r1_0_at1_2'=true);
   // travel from state 2 - require state5(at1_0) to be done, otherwise go to 5
   [r1_0_2_to_1] r1_0=2 & r1_0_at4_0=false & r1_0_at1_0=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_2_to_3] r1_0=2 & r1_0_at2_1=false & r1_0_at1_0=true -> (r1_0' = 3) & (r1_0_at2_1'=true);
   [r1_0_2_to_5] r1_0=2 & r1_0_at1_0=false & r1_0_at1_0=false -> (r1_0' = 5) & (r1_0_at1_0'=true);
   [r1_0_2_to_6] r1_0=2 & r1_0_at1_1=false & r1_0_at1_0=true -> (r1_0' = 6) & (r1_0_at1_1'=true);
   // travel from state 3 - requires state 6(at1_1) to be done, otherwise go to 6
   [r1_0_3_to_1] r1_0=3 & r1_0_at4_0=false & r1_0_at1_1=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_3_to_2] r1_0=3 & r1_0_at2_0=false & r1_0_at1_1=true -> (r1_0' = 2) & (r1_0_at2_0'=true);
   [r1_0_3_to_5] r1_0=3 & r1_0_at1_0=false & r1_0_at1_1=true -> (r1_0' = 5) & (r1_0_at1_0'=true);
   [r1_0_3_to_6] r1_0=3 & r1_0_at1_1=false & r1_0_at1_1=false -> (r1_0' = 6) & (r1_0_at1_1'=true);
   // travel from state 4 - requires state 7(at1_2) to be done, otherwise go do 7
   [r1_0_4_to_1] r1_0=4 & r1_0_at4_0=false & r1_0_at1_2=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_4_to_2] r1_0=4 & r1_0_at2_0=false & r1_0_at1_2=true -> (r1_0' = 2) & (r1_0_at2_0'=true);
   [r1_0_4_to_3] r1_0=4 & r1_0_at2_1=false & r1_0_at1_2=true -> (r1_0' = 3) & (r1_0_at2_1'=true);
   [r1_0_4_to_5] r1_0=4 & r1_0_at1_0=false & r1_0_at1_2=true -> (r1_0' = 5) & (r1_0_at1_0'=true);
   [r1_0_4_to_6] r1_0=4 & r1_0_at1_1=false & r1_0_at1_2=true -> (r1_0' = 6) & (r1_0_at1_1'=true);
   [r1_0_4_to_7] r1_0=4 & r1_0_at1_2=false -> (r1_0' = 7) & (r1_0_at1_2'=true);
   // travel from state 5 - requires state 2(at2_0) to be done, otherwise go do 2
   [r1_0_5_to_1] r1_0=5 & r1_0_at4_0=false & r1_0_at2_0=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_5_to_2] r1_0=5 & r1_0_at2_0=false & r1_0_at2_0=false -> (r1_0' = 2) & (r1_0_at2_0'=true);
   [r1_0_5_to_3] r1_0=5 & r1_0_at2_1=false & r1_0_at2_0=true -> (r1_0' = 3) & (r1_0_at2_1'=true);
   [r1_0_5_to_6] r1_0=5 & r1_0_at1_1=false & r1_0_at2_0=true -> (r1_0' = 6) & (r1_0_at1_1'=true);
   // travel from state 6 - requires state 3(at2_1) to be done, otherwise go to 3
   [r1_0_6_to_1] r1_0=6 & r1_0_at4_0=false & r1_0_at2_1=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_6_to_2] r1_0=6 & r1_0_at2_0=false & r1_0_at2_1=true -> (r1_0' = 2) & (r1_0_at2_0'=true);
   [r1_0_6_to_3] r1_0=6 & r1_0_at2_1=false & r1_0_at2_1=false -> (r1_0' = 3) & (r1_0_at2_1'=true);
   [r1_0_6_to_5] r1_0=6 & r1_0_at1_0=false & r1_0_at2_1=true -> (r1_0' = 5) & (r1_0_at1_0'=true);
   // travel from state 7 - requires state 4(at2_2) to be done, otherwise go to 4
   [r1_0_7_to_1] r1_0=7 & r1_0_at4_0=false & r1_0_at2_2=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_7_to_2] r1_0=7 & r1_0_at2_0=false & r1_0_at2_2=true -> (r1_0' = 2) & (r1_0_at2_0'=true);
   [r1_0_7_to_3] r1_0=7 & r1_0_at2_1=false & r1_0_at2_2=true -> (r1_0' = 3) & (r1_0_at2_1'=true);
   [r1_0_7_to_4] r1_0=7 & r1_0_at2_2=false -> (r1_0' = 4) & (r1_0_at2_2'=true);
   [r1_0_7_to_5] r1_0=7 & r1_0_at1_0=false & r1_0_at2_2=true -> (r1_0' = 5) & (r1_0_at1_0'=true);
   [r1_0_7_to_6] r1_0=7 & r1_0_at1_1=false & r1_0_at2_2=true -> (r1_0' = 6) & (r1_0_at1_1'=true);
endmodule


rewards
   [r1_0_0_to_1] true: 302; //cost from initial position of robot 
   [r1_0_0_to_2] true: 176; //cost from initial position of robot 
   [r1_0_0_to_3] true: 127; //cost from initial position of robot 
   [r1_0_0_to_5] true: 176; //cost from initial position of robot 
   [r1_0_0_to_6] true: 127; //cost from initial position of robot 
   [r1_0_1_to_4] true: 0;
   [r1_0_1_to_7] true: 0;
   [r1_0_2_to_1] true: 400;
   [r1_0_2_to_3] true: 100;
   [r1_0_2_to_5] true: 0;
   [r1_0_2_to_6] true: 100;
   [r1_0_3_to_1] true: 412;
   [r1_0_3_to_2] true: 100;
   [r1_0_3_to_5] true: 100;
   [r1_0_3_to_6] true: 0;
   [r1_0_4_to_1] true: 0;
   [r1_0_4_to_2] true: 400;
   [r1_0_4_to_3] true: 412;
   [r1_0_4_to_5] true: 400;
   [r1_0_4_to_6] true: 412;
   [r1_0_4_to_7] true: 0;
   [r1_0_5_to_1] true: 400;
   [r1_0_5_to_2] true: 0;
   [r1_0_5_to_3] true: 100;
   [r1_0_5_to_6] true: 100;
   [r1_0_6_to_1] true: 412;
   [r1_0_6_to_2] true: 100;
   [r1_0_6_to_3] true: 0;
   [r1_0_6_to_5] true: 100;
   [r1_0_7_to_1] true: 0;
   [r1_0_7_to_2] true: 400;
   [r1_0_7_to_3] true: 412;
   [r1_0_7_to_4] true: 0;
   [r1_0_7_to_5] true: 400;
   [r1_0_7_to_6] true: 412;
endrewards
