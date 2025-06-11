#
# From UG1400 - Vitis Unified Software Platform Documentation: Embedded Software Development
# Section "Debugging Applications on Zynq UltraScale+ MPSoC"
# run with xsct
#

connect
targets
targets 4
fpga build/design_1_wrapper.bit
#fpga build/hw_project/hw.runs/impl_1/design_1_wrapper.bit
puts "FPGA configured"
source build/psu_init.tcl 
#source build/hw_project/hw.gen/sources_1/bd/design_1/ip/design_1_zynq_ultra_ps_e_0_0/psu_init.tcl
psu_init                                                                                                                                                                                                                                                                 
after 1000                                                                                                                                                                                                                                                               
psu_ps_pl_isolation_removal                                                                                                                                                                                                                                              
psu_ps_pl_reset_config                                                                                                                                                                                                                                                   
targets 9                                                                                                                                                                                                                                                                
rst -processor -clear-registers                 
dow build/workspace/hello/Debug/hello.elf
puts "Download done, starting ..."
con
