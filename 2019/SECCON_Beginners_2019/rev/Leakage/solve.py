import angr
import claripy

flag = claripy.BVS('flag', 8 * 0x22)

proj = angr.Project('./leakage')
state = proj.factory.entry_state(args=['./leakage', flag])
simgr = proj.factory.simgr(state)
simgr.explore(find=0x4006b5)

print(simgr.found[0].solver.eval(flag, cast_to=bytes))
