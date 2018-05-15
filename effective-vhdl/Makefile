
.PHONY: default
default: *.vhd
	@rm -rf work
	@mkdir work
	@ghdl -i -g --std=08 --workdir=work *.vhd
	@ghdl -m -g --std=08 --workdir=work main
	@ghdl -r -g --std=08 --workdir=work main

.PHONY: clean
clean:
	@-ghdl --clean --workdir=work
	@-rm -rf work
