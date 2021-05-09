
 // ----------------Initialize contraint solver-------------//
abstract sig Mission{
	dotask: one (AtomicTask + CompositeTask)
}
fact { all m:Mission | disj[m.dotask, (Mission-m).dotask] } // each mission belongs to different task

abstract sig Robot {
	    hascapability : some Capability
} 
abstract sig Capability {
    	belongsto: one Robot
}
fact { all c:Capability, r:Robot | r in c.belongsto <=> c in r.hascapability }

abstract sig AtomicTask {
    	runby: some Capability
}
abstract sig CompositeTask{
	at: set AtomicTask,
    	ct: set CompositeTask
}
fact { all c:CompositeTask | disj[c.at, (CompositeTask-c).at] and disj[c.ct, (CompositeTask-c).ct] } // each composite task has its own tasks

fact{ all c:CompositeTask | #(ct.c)=1 or #(dotask.c)=1 } //composite task belong to another composite task or to a mission
fact{ all a:AtomicTask | #(at.a)=1 or #(dotask.a)=1 } //atomic task belong to another (composite) task or to a mission
fact{ all r:Robot | !disj[r.hascapability, AtomicTask.runby] } //all robots that appear in the schema must be associated to a task
fact{ all c:CompositeTask | #(c.at + c.ct)>1} //at+ct is not empty in a Composite task

 // ----------------Problem-------------//
 // ----------------ATOMIC TASKS:
    sig at4 extends AtomicTask{}
    {
        disj[runby, Capability - c3] and
        #runby=1 // 1 robot
    }
    sig at3 extends AtomicTask{}
    {
        disj[runby, Capability - c4] and
        #runby=2 // 2 robot
        all r:runby | disj[r,runby-r] //different robots
    }
    sig at2 extends AtomicTask{}
    {
        disj[runby, Capability - c2] and
        #runby=1 // 1 robot
    }
    sig at1 extends AtomicTask{}
    {
        disj[runby, Capability - c1] and
        #runby=1 // 1 robot
    }
 // ----------------COMPOSITE TASKS:
    sig ct2 extends CompositeTask{}
        fact{all c:ct2  | #c.at = 1 and not disj[at4 , c.at]} //CT has 1 atomic tasks
        fact{all c:ct2  | #c.ct = 1 and not disj[ct1 , c.ct]} //CT has 1 composite tasks
    sig ct1 extends CompositeTask{}
        fact{all c:ct1  | #c.at = 2 and not disj[at1 , c.at] and not disj[at2 , c.at]} //CT has 2 atomic tasks
        fact{all c:ct1  | #c.ct = 0}
 // ----------------CAPABILITIES:
    abstract sig c3 extends Capability{}
    abstract sig c4 extends Capability{}
    abstract sig c1 extends Capability{}
    abstract sig c2 extends Capability{}
    sig c1_instance0 ,c1_instance1  extends c1{}
    sig c2_instance0 ,c2_instance1  extends c2{}
    sig c3_instance0 ,c3_instance1  extends c3{}
    sig c4_instance0 ,c4_instance1  extends c4{}
 // ----------------ROBOTS:
    sig r2 extends Robot {}
    {
        #(hascapability & c3_instance0)=1 //has capabiityc3_instance0 
        #(hascapability & c1_instance0)=1 //has capabiityc1_instance0 
        #(hascapability & c2_instance0)=1 //has capabiityc2_instance0 
        disj[hascapability, Capability-(c3_instance0+c1_instance0+c2_instance0)] // no more capabilities
    }
    sig r3 extends Robot {}
    {
        #(hascapability & c4_instance0)=1 //has capabiityc4_instance0 
        disj[hascapability, Capability-(c4_instance0)] // no more capabilities
    }
    sig r4 extends Robot {}
    {
        #(hascapability & c4_instance1)=1 //has capabiityc4_instance1 
        disj[hascapability, Capability-(c4_instance1)] // no more capabilities
    }
    sig r1 extends Robot {}
    {
        #(hascapability & c3_instance1)=1 //has capabiityc3_instance1 
        #(hascapability & c1_instance1)=1 //has capabiityc1_instance1 
        #(hascapability & c2_instance1)=1 //has capabiityc2_instance1 
        disj[hascapability, Capability-(c3_instance1+c1_instance1+c2_instance1)] // no more capabilities
    }
 // ----------------MISSION:
    sig t1 extends Mission{}
    {disj[dotask, (CompositeTask+AtomicTask - ct1) ] }
    sig t2 extends Mission{}
    {disj[dotask, (CompositeTask+AtomicTask - ct1) ] }
    sig t3 extends Mission{}
    {disj[dotask, (CompositeTask+AtomicTask - at3) ] }
    sig t4 extends Mission{}
    {disj[dotask, (CompositeTask+AtomicTask - ct2) ] }

 // ----------------RUN COMMAND:
pred TaskAllocation{
    #(t1)=1
    #(t2)=1
    #(t3)=1
    #(t4)=1
}
run TaskAllocation for exactly 4 Mission, 4 Robot, 1 r2, 1 r3, 1 r4, 1 r1, 8 Capability, 8 AtomicTask, 4 CompositeTask, exactly 1 at4, exactly 1 at3, exactly 3 at2, exactly 3 at1, exactly 1 ct2, exactly 3 ct1