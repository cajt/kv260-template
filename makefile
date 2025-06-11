vivado:
	vivado -mode batch -source  scripts/setup_hw_project.tcl

vivado-gui:
	vivado ./build/hw_project/hw.xpr

genhw:
	vivado -mode batch -source  scripts/generate_hw_output.tcl

run-hello:
	xsct scripts/run_hello.tcl

hello-world:
	xsct scripts/hello_world.tcl

clean:
	rm -rf *.log *.jou ./build/*
