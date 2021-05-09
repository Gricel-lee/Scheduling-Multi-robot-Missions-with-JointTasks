# Scheduling Multi-robot Missions with JointTasks

We present a work-in-progress on multi-robot allocation and scheduling of missions from high level specifications.

## Content

The **Hospital-Example** folder contains a hospital case study to demonstrait the approach. A group of robots is deployed to accomplish a "mission" comprising a set of tasks. This is orginized with the following subfolders:

- Informal description - Describes what are the robots available for the mission, and what tasks must be performed.
- Input specifications - Contains the description of the missions, tasks, robots and worldmodel
- Constraint solver input - Declarative model of the missions and robots for the allocation of tasks to robots in [Alloy](http://alloytools.org) language, to be run by constraint solver Alloy
- Constraint solver output - Family of models found by constraint model solver Alloy
- Probab models -  Contains a set of probabilisitc models. For each model found by Alloy, transitive clousure is use to separate group of robots that are constrained by their tasks and require to be model together (for example, in joint tasks where multiple robots do the same task at the time). Hence, for each group of robots sharing a task constraint, there is a Markov Decisio Process (MDP) model created in [PRISM](https://www.prismmodelchecker.org/) language.
- Policy synthesis - This folder has PRISM output and its interpretation for the case study.
