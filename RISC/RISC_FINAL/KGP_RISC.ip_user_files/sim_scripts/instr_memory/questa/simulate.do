onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib instr_memory_opt

do {wave.do}

view wave
view structure
view signals

do {instr_memory.udo}

run -all

quit -force
