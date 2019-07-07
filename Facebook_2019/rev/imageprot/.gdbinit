
break *0x555555554000 + 0x56f51
r
set $start_addr = *(char **)($rsp+0x4a8-0x438)
set $end_addr = $start_addr + *(int *)($rsp+0x4a8-0x428)
dump binary memory flag.jpg $start_addr $end_addr
q

