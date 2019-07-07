import angr

proj = angr.Project('./linear_operation')
simgr = proj.factory.simgr()
simgr.explore(find=0x40cf78)

print(simgr.found[0].posix.dumps(0))
