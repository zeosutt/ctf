import angr
import claripy
import monkeyhex

proj = angr.Project('crackme')

sym_arg_size = 32
sym_arg = claripy.BVS('sym_arg', sym_arg_size * 8)

argv = [proj.filename, sym_arg]

state = proj.factory.entry_state(args=argv)

simgr = proj.factory.simgr(state)

# simgr.explore(find=0x040099c)
simgr.explore(find=0x04009bb)
# simgr.explore(find=lambda s: "Congratulations" in s.posix.dumps(1))
