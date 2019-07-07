import angr

proj = angr.Project('angrme')
simgr = proj.factory.simgr()
simgr.explore(find=lambda s: b':)' in s.posix.dumps(1))
print(simgr.found[0].posix.dumps(0))
