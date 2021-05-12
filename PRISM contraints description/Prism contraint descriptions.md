# Task scheduling constraints:

Once a set of robots have allocated all the tasks necessary to complete the missions, the order on which the tasks are to be executed depends on the constraints given by the tasks themselves:

- when an atomic task requires more than one robot (joint task)
- when a compound task requires its subtasks to be executed in order
- when a compound task requires its subtasks to be executed consecutively.

There may be different ways to encode this in PRISM model checker language. Here we present how we deal with this restrictions in an MDP (Markov Decision Process) model.

## For joint tasks

For each joint (atomic) tasks, a label is created in the MDP:

![Diagram](https://github.com/Gricel-lee/Scheduling-Multi-robot-Missions-with-JointTasks/blob/master/PRISM%20contraints%20description/jointtask.JPG)

where i_t is the joint task number i, R(i_t) is the set of robots allocated to do the task, state(r,i_t) is the MDP state describing that robot r is doing task i_t.
This label is checked to be true within the property to synthesise the policy.

### Example
A medical equipment require two robots to be moved. 
This is model as an atomic task **at1** requiring robots r3 and r4 (assigned beforehand by Alloy). This is written in PRISM as a label:
```
label "jointtask_at1" = (r3_0 = 1) & (r4_0 = 2);
```
Where state 1 of r3 in the MDP means that r3 is doing "at1", and state 2 of r4 means r4 is doing "at1".

(**Note**: r3_0 means robot r3 intance 0. This index 0 is placed by Alloy after the allocation of tasks to robots.)

## For consecutive, non ordered tasks
If a composite task has consecutive subtasks (done one after the other) regarless of the order they are executed, this is model within the MDP in two ways:
### a) All subtasks allocated to the same robot
If the subtasks of composite task ct are assigned to the same robot, once a subtask is started by the robot, the only transitions available are to do the other subtasks until they are done:
```
for t in subtasks of ct:
  if robot in state(t):
    if all subtasks haven't been done:
       transitions only go to other tasks in the composite task if they haven't been done
    elif:
       transitions go to any other task outside the composite task if they have been done
```
### Example 
A room needs to be cleaned. It requires to clean the floor and saitize with UV light, independently of the order.
This is model as a compound task, ct10, with (atomic) subtasks, at12 and at22, done consecutively, regardless of the order. Both atomic tasks were allocated to the same robot r1 by Alloy beforehand. the MDP model looks like:


![Diagram](https://github.com/Gricel-lee/Scheduling-Multi-robot-Missions-with-JointTasks/blob/master/PRISM%20contraints%20description/consecutive1.JPG)

where task at22 is done in state 4, and task at12 in 7 of module R1 (robot 1). Hence, in state 4 (r1=4), the transitions can go to any other state from 1 to 6 (0 is the initial state where the robot starts and 7 is part of the composite task, so it cannot go there; here **-> (r1' = 5) ,  -> (r1' = 6)** are only shown) if r1 has done at12 **r1_at12=true**. Otherwise (**r1_at12=false**), the only transition is to go and do it at state 7 **->(r1' = 7) & (r1_at12'=true)**
This is similar from state 7 (**r1=7**)

### b) Subtasks allocated to multiple robots
If the subtasks are assigned to different robots, this is accomplish in the MDP by synchronization between modules, so that robot i waits for robot j to do the next task. This is explained in the next example.
### Example
A room needs to be cleaned. It requires to clean the floor and saitize with UV light, independently of the order.
Alloy assigned robot r1 and r2 to do this two subtasks, named as at22 and at11. The MDP model looks like:

![Diagram](https://github.com/Gricel-lee/Scheduling-Multi-robot-Missions-with-JointTasks/blob/master/PRISM%20contraints%20description/consecutive2.JPG)

where robot r1 does at22 at state 2, and robot r2 does at11 at state 4, at their respective modules. When robot r1 reaches state 2, if r2 hasn't done at11 **(r2_at11=false)**, it synchronized using the action **[synchronize_r2_at11]**. This means r2 cannot continue only r1 does the next task, meaning both will be doing one task after the other.
This is similar for robot 2 at state 4.
