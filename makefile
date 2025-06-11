vivado:
	vivado -mode batch -source  scripts/setup_hw_project.tcl

vivado-gui:
	vivado ./build/hw_project/hw.xpr

genhw:
	vivado -mode batch -source  scripts/generate_hw_output.tcl

clean:
	rm -rf *.log *.jou ./build/*
