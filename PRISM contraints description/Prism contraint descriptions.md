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
If atomic task **at1** requires 2 robots to be executed, r3 and r4, this is written in PRISM as a label:
```
label "jointtask_at1" = (r3_0 = 1) & (r4_0 = 2);
```
Where state 1 of r3 in the MDP means that r3 is doing "at1", and state 2 of r4 means r4 is doing "at1".

(**Note**: r3_0 means robot r3 intance 0. This index 0 is placed by Alloy model checker after the allocation of tasks to robots.)
