
.PHONY: default
default: *.vhd
	@rm -rf work
	@mkdir work
	@ghdl -i -g --workdir=work *.vhd
	@ghdl -m -g --workdir=work main
	@ghdl -r -g --workdir=work main

.PHONY: clean
clean:
	@-ghdl --clean --workdir=work
	@-rm -rf work
