The mission for the robots in the hospital scenario requires to complete the following tasks in the indicated locations: 

- Do composite task ct1 in RoomA
- Do composite task ct1 in RoomB
- Do atomic task at3 in RoomD
- Do composite task ct2 in RoomC

The tasks represent:
- Composite task ct1 = Clean the room by doing tasks at1 and at2, consecutively (regarding the order)
- Composite task ct2 = Clean patient room by doing tasks at4 and ct1, consecutively and in this order.
- Atomic task at1 = Clean the floor. It requires 1 robot and has an average duration of 30 min.
- Atomic task at2 = Sanitize the room. It requires 1 robot and has an average duration of 60 min.
- Atomic task at3 = Move medical equipment. It requires 2 robot and has an average duration of 40 min.
- Atomic task at4 = Ask permission to the patient. It requires 1 robot and has an average duration of 5 min.

There are four robots [r1,r2,r3,r4], each robot with:
- Robot r1 is a cleaner robot, located at “warehouse1”
- Robot r2 is a cleaner robot, located at “warehouse2”
- Robot r3 is a pick-and-place robot, located at “warehouse3”
- Robot r4 is a pick-and-place robot, located at “warehouse4”
