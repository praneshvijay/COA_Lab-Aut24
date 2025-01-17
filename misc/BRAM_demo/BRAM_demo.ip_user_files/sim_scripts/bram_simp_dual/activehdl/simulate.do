onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+bram_simp_dual -L xil_defaultlib -L xpm -L blk_mem_gen_v8_4_2 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.bram_simp_dual xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {bram_simp_dual.udo}

run -all

endsim

quit -force
