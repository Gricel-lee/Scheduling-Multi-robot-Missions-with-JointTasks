# Scheduling Multi-robot Missions with JointTasks

We present a work-in-progress approach to scheduling multi-robot missions comprising tasks that need to be performed by multiplerobots. Our approach (1) supports the scheduling of such missions forheterogeneous robots, (2) takes into account dependability, performanceand  other  nonfunctional  requirements,  and  (3)  guarantees  compliancewith functional and nonfunctional mission requirements by using a com-binations of formal techniques to allocate the mission tasks to individualrobots, and to plan the order in which each robot will execute its allo-cated tasks. We show the effectiveness of our approach by applying it tothe scheduling of multi-robot missions in a hospital-support application.



## Approach description
The approach taken for the scheduling of tasks consists in three stages.
- Stage one is the inputs as in the [Input specifications folder](https://github.com/Gricel-lee/Scheduling-Multi-robot-Missions-with-JointTasks/tree/master/Hospital-Example/2%20Input%20specifications).
- Stage two allocates tasks to robots via the constraint solver Alloy. A single file with the problem in declarative Alloy language is created. The constraint solver returns a family of models that fulfil the constraints impose by which tasks a robot can execute given its set of capabilities.
- Stage three synthesize a policy for the scheduling of tasks by each robot. The step starts applying the transitive clousure (for each model found by Alloy) to find which robots share constraints so that they must be modelled together (for example, when two robots perform a joint task).
![diagram3](https://user-images.githubusercontent.com/63869574/119576070-4b795c00-bd75-11eb-97b1-ae60aff1243a.png)


## Content

The **Hospital-Example** folder contains a hospital case study to demonstrait the approach. A group of robots is deployed to accomplish a "mission" comprising a set of tasks. This is orginized with the following subfolders:

- Informal description - Describes what are the robots available for the mission, and what tasks must be performed.
- Input specifications - Contains the description of the missions, tasks, robots and worldmodel
- Constraint solver input - Declarative model of the missions and robots for the allocation of tasks to robots in [Alloy](http://alloytools.org) language, to be run by constraint solver Alloy
- Constraint solver output - Family of models found by constraint model solver Alloy
- Probab models -  Contains a set of probabilisitc models. For each model found by Alloy, transitive clousure is use to separate group of robots that are constrained by their tasks and require to be model together (for example, in joint tasks where multiple robots do the same task at the time). Hence, for each group of robots sharing a task constraint, there is a Markov Decisio Process (MDP) model created in [PRISM](https://www.prismmodelchecker.org/) language.
- Policy synthesis - This folder has PRISM output and its interpretation for the case study.

The **MDP generation in PRISM** folder contains an explanation on the task constraints (ordered, consecutive and joint tasks) captured in PRISM MDPs. to MDP fragments on the PRISM model checker.
