import angr

proj = angr.Project('./reiwa')
simgr = proj.factory.simgr()
simgr.explore(find=0x8048872, avoid=0x8048955)

print(simgr.found[0].posix.dumps(0))
