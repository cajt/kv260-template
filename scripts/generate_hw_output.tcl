#Generate Hardware Outputs

open_project ./build/hw_project/hw.xpr

launch_runs synth_1 -jobs 4 
wait_on_run synth_1
puts "Synthesis done!"

launch_runs impl_1 -to_step write_bitstream -jobs 4 
wait_on_run impl_1 
puts "Implementation done!"

write_hw_platform -fixed -include_bit -force -file ./build/design_1_wrapper.xsa


file mkdir ./build/hw_project/hw.sdk
file copy -force ./build/hw_project/hw.runs/impl_1/design_1_wrapper.sysdef ./build/hw_project/hw.sdk/design_1_wrapper.hdf
puts "Export Bitstream done!"

#launch_sdk -workspace ./build/hw_project/hw.sdk -hwspec ./build/hw_project/hw.sdk/design_1_wrapper.hdf
