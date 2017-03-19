dir = $(basename "$PWD")
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))


bootstrap:
	zip -r $(shell basename $(CURDIR)).zip *
	cp -rf $(shell basename $(CURDIR)).zip ../../terraform/lambda
