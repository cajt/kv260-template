if {[file isdirectory "build/hw_project"]} {file delete -force ./build/hw_project} 
if {[file isdirectory "build/bd"]} {file delete -force ./bd} 

# Create project
create_project hw build/hw_project -part xck26-sfvc784-2LV-c

# Project properties
set_property target_language VHDL [current_project]
set_property simulator_language VHDL [current_project]

# Setup of user IP repositories
#set_property ip_repo_paths {./spw_ip_repo} [current_project]
#set_property ip_repo_paths {./loa_ip_repo} [current_project]
update_ip_catalog

# Build design
source ./src/design_1.tcl

# Add constraints
add_files -fileset constrs_1 -norecurse ./src/pins.xdc
import_files -fileset constrs_1 ./src/pins.xdc
#add_files -fileset constrs_1 -norecurse timing.xdc
#import_files -fileset constrs_1 timing.xdc

# Create HDL wrapper
make_wrapper -files [get_files ./build/hw_project/hw.srcs/sources_1/bd/design_1/design_1.bd] -top
add_files -norecurse ./build/hw_project/hw.gen/sources_1/bd/design_1/hdl/design_1_wrapper.vhd 
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Project should be setup by now. Everything else happens in the GUI or another .tcl
