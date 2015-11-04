.PHONY: clean

all:
	cd ../ && rebar compile
	
clean:
	cd ../ && rebar clean
	