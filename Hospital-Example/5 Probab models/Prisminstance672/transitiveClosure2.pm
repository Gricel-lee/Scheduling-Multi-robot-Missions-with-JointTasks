mdp
label "r4_0_done" = (r4_0_at3_0=true) ;
label "r3_0_done" = (r3_0_at3_0=true) ;

label "jointtask_at3_0" = (r4_0 = 1) & (r3_0 = 1) ;

module R4_0
   //robotr4_0 has 1 tasks to schedule 
   //state 1: task at3_0
   r4_0 : [0..1];
   r4_0_at3_0 : bool;
   // travel from state 0
   [r4_0_0_to_1] r4_0=0 & r4_0_at3_0=false -> (r4_0' = 1) & (r4_0_at3_0'=true);
endmodule
module R3_0
   //robotr3_0 has 1 tasks to schedule 
   //state 1: task at3_0
   r3_0 : [0..1];
   r3_0_at3_0 : bool;
   // travel from state 0
   [r3_0_0_to_1] r3_0=0 & r3_0_at3_0=false -> (r3_0' = 1) & (r3_0_at3_0'=true);
endmodule

rewards
   [r4_0_0_to_1] true: 127; //cost from initial position of robot 
   [r3_0_0_to_1] true: 176; //cost from initial position of robot 
endrewards
