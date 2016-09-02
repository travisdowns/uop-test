mask=task-clock,cycles,instructions,\
cpu/event=0xb1,umask=0x1,name=uops_executed_thread/,\
cpu/event=0xe,umask=0x1,name=uops_issued_any/,\
cpu/event=0xc2,umask=0x2,name=uops_retired_retire_slots/

perf stat -e $mask ./uop-test
perf stat -e $mask ./uop-test x
perf stat -e $mask ./uop-test x x




