import angr, monkeyhex

proj = angr.Project('right_or_left')

state = proj.factory.entry_state()
# simgr = proj.factory.simulation_manager(state)

# simgr.explore(find = 0x400664, avoid = 0x400b24)
simgr.explore(avoid = 0x41d3f0)
# simgr.explore(find = 0x400664)

# rbp = simgr.found[0].regs.rbp

# simgr.found[0].memory.store(rbp - 0x40, simgr.found[0].solver.BVS('x', 45))

# simgr.move(from_stash='found', to_stash='active')


# simgr.explore(find = 0x400731, avoid = 0x400af7)
# simgr.explore(find = 0x40074e, avoid = 0x400af7)
# simgr.explore(find = 0x40076b, avoid = 0x400af7)
# simgr.explore(find = 0x400af2, avoid = 0x400af7)



# rbp = simgr.found[0].regs.rbp
# simgr.found[0].solver.eval(simgr.found[0].memory.load(rbp - 0x170))


# addresses = [0x400683, 0x4006a0, 0x4006bd, 0x4006da, 0x4006f7, 0x400714, 0x400731, 0x40074e, 0x40076b, 0x400788, 0x4007a5, 0x4007c2, 0x4007df, 0x4007fc, 0x400819, 0x400836, 0x400853, 0x400870, 0x40088d, 0x4008aa, 0x4008c7, 0x4008e4, 0x400901, 0x40091e, 0x40093b, 0x400958, 0x400975, 0x400992, 0x4009af, 0x4009cc, 0x4009e9, 0x400a06, 0x400a23, 0x400a40, 0x400a5d, 0x400a7a, 0x400a94, 0x400aae, 0x400ac8, 0x400ae2]

# for address in addresses:
# 	simgr.explore(find = address, avoid = 0x400af7)
# 	simgr.move(from_stash='found', to_stash='active')


