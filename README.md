# Scheduling Multi-robot Missions with JointTasks and Complex Nonfunctional Requirements

We present a work-in-progress approach to scheduling multi-robot missions comprising tasks that need to be performed by multiplerobots. Our approach (1) supports the scheduling of such missions forheterogeneous robots, (2) takes into account dependability, performanceand  other  nonfunctional  requirements,  and  (3)  guarantees  compliancewith functional and nonfunctional mission requirements by using a com-binations of formal techniques to allocate the mission tasks to individualrobots, and to plan the order in which each robot will execute its allo-cated tasks. We show the effectiveness of our approach by applying it tothe scheduling of multi-robot missions in a hospital-support application.



## Approach description

As  shown  in  Fig.  1,  our  MRS  mission  scheduling  approach  takes  four  inputs. First, domain experts provide a task specification that defines the types of tasks for the application domain/organisation using the MRS. This includes atomic tasks with  their  properties  (mean  execution  time,  number  of  robots  needed, etc.), and compound tasks, i.e., lists of atomic and/or other compound (sub)tasks that  may  need  to  be  executed  in  order  and/or  consecutively.  Next,  an  “MRS team” of engineers provides: (i) aworld  modeldefining the physical layout ofthe  environment  where  the  MRS  missions  will  be  performed,  and  (ii)  arobotspecificationdescribing thecapabilities, initial location and other characteristics of every available robot. Each capability of a robot indicates a type of task which that robot can execute, and provides details about the performance, reliability, energy use, etc. with which the robot would execute the task. Finally, the MRS users provide a mission specification defining the combination of tasks that need to  be  performed  by  the  available  robots,  at  specific  locations  and  with  given timing/cost/etc. constraints and optimisation objectives. Given these inputs, we use a two-stage approach to generate individual robot plans whose execution ensures the correct completion of the specified mission:

- Stage 1 of the approach uses aconstraint  solversuch as Alloy analyzer [5] todistribute the tasks of the mission among the available robots, such that all theconstraints from the task specificationandthe mission specification are satisfied.This involves using aconstraint problem generatorto encode these constraints ina format that the constraint solver can use to generate feasible task allocations. 
- Stage  2  of  the  approach  optimises  the  order  in  which  each  robot  will  exe-cute its tasks. Optimal robot plans are produced for each feasible task allocationfrom  Stage  1,  and  the  best  combination  of  plans  across  all  task  allocations  isadopted. To generate the optimal robot plans, we use aMarkov decision process(MDP) generatorto encode the task-order optimisation as an MDP policy syn-thesis problem that we then solve using a probabilistic model checker such asPRISM [6]. For increased efficiency, a separate, small MDP is generated for eachsubset of robots that were allocated interdependent tasks, e.g., joint tasks, ortasks of a compound task with an order or sequence

Figure 1. Two-stage MRS mission scheduling approach.
![approach](https://user-images.githubusercontent.com/63869574/119577942-d0b24000-bd78-11eb-98c4-24e5c9bb4050.JPG)




## Content

The **Hospital-Example** folder contains a hospital case study to demonstrate the approach. A group of robots is deployed to accomplish a "mission" comprising a set of tasks. It is organized with the following subfolders:

- Informal description - Describes the robots available for the mission and what mission tasks need to be performed.
- Input specification - Contains the description of the mission, tasks, robots and worldmodel.
- Constraint solver input - Declarative model of the missions and robots for the allocation of tasks to robots in [Alloy](http://alloytools.org) language, run by constraint solver Alloy analyser.
- Constraint solver output - Three models found by constraint model solver Alloy.
- Probab models - For each model found by Alloy, transitive closure is used to separate groups of robots that are constrained by their allocated tasks (for example, in joint tasks where multiple robots do the same task at the time); therefore, each group is modeled together as a Markov Decision Process (MDP) (.pm files) in [PRISM](https://www.prismmodelchecker.org/) language. The CMD command to obtain the best policy for each MDP is also available (.txt files).
- Policy synthesis - This folder has the "best policy" PRISM output for each MDP (best-policy.txt), and for reference, the states of the MDP (states.txt). As a reference, a file "\_description-actions.txt" is added to see the actions taken from the best policy file.
- Plan - It contains: the robots' plan in an csv file (gantt_file.csv); the gantt chart for the mission tasks plan (gantt_file.html); the gantt chart showing the atomic tasks (gantt_file-per-tasks.html); and the robots and total travelling distance (Prismintance1_travel_distance.xlsx).

The **MDP generation in PRISM** folder contains an explanation of the modelling of task complex requirements (ordered, consecutive, and joint tasks) captured in the PRISM MDPs models.
