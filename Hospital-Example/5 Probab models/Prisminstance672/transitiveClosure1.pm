mdp 
label "r1_0_done" = (r1_0_at4_0=true) & (r1_0_at2_2=true) & (r1_0_at1_2=true) ;
label "r2_0_done" = (r2_0_at2_0=true) & (r2_0_at2_1=true) & (r2_0_at1_0=true) & (r2_0_at1_1=true) ;


module R1_0
   //robotr1_0 has 3 tasks to schedule 
   //state 1: task at4_0
   //state 2: task at2_2
   //state 3: task at1_2
   r1_0 : [0..3];
   r1_0_at4_0 : bool;
   r1_0_at2_2 : bool;
   r1_0_at1_2 : bool;
   // travel from state 0
   [r1_0_0_to_1] r1_0=0 & r1_0_at4_0=false -> (r1_0' = 1) & (r1_0_at4_0'=true);
   // travel from state 1
   [r1_0_1_to_2] r1_0=1 & r1_0_at2_2=false -> (r1_0' = 2) & (r1_0_at2_2'=true);
   [r1_0_1_to_3] r1_0=1 & r1_0_at1_2=false -> (r1_0' = 3) & (r1_0_at1_2'=true);
   // travel from state 2
   [r1_0_2_to_1] r1_0=2 & r1_0_at4_0=false  & r1_0_at1_2=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_2_to_3] r1_0=2 & r1_0_at1_2=false -> (r1_0' = 3) & (r1_0_at1_2'=true);
   // travel from state 3
   [r1_0_3_to_1] r1_0=3 & r1_0_at4_0=false & r1_0_at2_2=true -> (r1_0' = 1) & (r1_0_at4_0'=true);
   [r1_0_3_to_2] r1_0=3 & r1_0_at2_2=false -> (r1_0' = 2) & (r1_0_at2_2'=true);
endmodule
module R2_0
   //robotr2_0 has 4 tasks to schedule 
   //state 1: task at2_0
   //state 2: task at2_1
   //state 3: task at1_0
   //state 4: task at1_1
   r2_0 : [0..4];
   r2_0_at2_0 : bool;
   r2_0_at2_1 : bool;
   r2_0_at1_0 : bool;
   r2_0_at1_1 : bool;
   // travel from state 0
   [r2_0_0_to_1] r2_0=0 & r2_0_at2_0=false -> (r2_0' = 1) & (r2_0_at2_0'=true);
   [r2_0_0_to_2] r2_0=0 & r2_0_at2_1=false -> (r2_0' = 2) & (r2_0_at2_1'=true);
   [r2_0_0_to_3] r2_0=0 & r2_0_at1_0=false -> (r2_0' = 3) & (r2_0_at1_0'=true);
   [r2_0_0_to_4] r2_0=0 & r2_0_at1_1=false -> (r2_0' = 4) & (r2_0_at1_1'=true);
   // travel from state 1
   [r2_0_1_to_2] r2_0=1 & r2_0_at2_1=false & r2_0_at1_0=true -> (r2_0' = 2) & (r2_0_at2_1'=true);
   [r2_0_1_to_3] r2_0=1 & r2_0_at1_0=false -> (r2_0' = 3) & (r2_0_at1_0'=true);
   [r2_0_1_to_4] r2_0=1 & r2_0_at1_1=false & r2_0_at1_0=true -> (r2_0' = 4) & (r2_0_at1_1'=true);
   // travel from state 2
   [r2_0_2_to_1] r2_0=2 & r2_0_at2_0=false & r2_0_at1_1=true -> (r2_0' = 1) & (r2_0_at2_0'=true);
   [r2_0_2_to_3] r2_0=2 & r2_0_at1_0=false & r2_0_at1_1=true -> (r2_0' = 3) & (r2_0_at1_0'=true);
   [r2_0_2_to_4] r2_0=2 & r2_0_at1_1=false -> (r2_0' = 4) & (r2_0_at1_1'=true);
   // travel from state 3
   [r2_0_3_to_1] r2_0=3 & r2_0_at2_0=false -> (r2_0' = 1) & (r2_0_at2_0'=true);
   [r2_0_3_to_2] r2_0=3 & r2_0_at2_1=false & r2_0_at2_0=true -> (r2_0' = 2) & (r2_0_at2_1'=true);
   [r2_0_3_to_4] r2_0=3 & r2_0_at1_1=false & r2_0_at2_0=true -> (r2_0' = 4) & (r2_0_at1_1'=true);
   // travel from state 4
   [r2_0_4_to_1] r2_0=4 & r2_0_at2_0=false & r2_0_at2_1=true -> (r2_0' = 1) & (r2_0_at2_0'=true);
   [r2_0_4_to_2] r2_0=4 & r2_0_at2_1=false -> (r2_0' = 2) & (r2_0_at2_1'=true);
   [r2_0_4_to_3] r2_0=4 & r2_0_at1_0=false & r2_0_at2_1=true -> (r2_0' = 3) & (r2_0_at1_0'=true);
endmodule

rewards
   [r1_0_0_to_1] true: 302; //cost from initial position of robot 
   [r1_0_1_to_2] true: 0;
   [r1_0_1_to_3] true: 0;
   [r1_0_2_to_1] true: 0;
   [r1_0_2_to_3] true: 0;
   [r1_0_3_to_1] true: 0;
   [r1_0_3_to_2] true: 0;
   [r2_0_0_to_1] true: 215; //cost from initial position of robot 
   [r2_0_0_to_2] true: 176; //cost from initial position of robot 
   [r2_0_0_to_3] true: 215; //cost from initial position of robot 
   [r2_0_0_to_4] true: 176; //cost from initial position of robot 
   [r2_0_1_to_2] true: 100;
   [r2_0_1_to_3] true: 0;
   [r2_0_1_to_4] true: 100;
   [r2_0_2_to_1] true: 100;
   [r2_0_2_to_3] true: 100;
   [r2_0_2_to_4] true: 0;
   [r2_0_3_to_1] true: 0;
   [r2_0_3_to_2] true: 100;
   [r2_0_3_to_4] true: 100;
   [r2_0_4_to_1] true: 100;
   [r2_0_4_to_2] true: 0;
   [r2_0_4_to_3] true: 100;
endrewards
