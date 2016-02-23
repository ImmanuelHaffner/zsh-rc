.PHONY: all install install-all

all:
	@echo "Did you mean to say 'make install'?"

install:
	cp dotzshrc ~/.zshrc

install-all: install
	sudo cp zshrc /etc/zsh/zshrc
