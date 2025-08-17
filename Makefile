.PHONY: all install install-all

all:
	@echo "Did you mean to say 'make install'?"

install:
	install -m 644 dotzshrc ${HOME}/.zshrc
	install -m 644 zshenv ${HOME}/.zshenv

install-all: install
	sudo install -m 644 zshrc /etc/zsh/zshrc
	sudo install -d /etc/dircolors.d
	sudo install -m 644 dircolors.d/* /etc/dircolors.d/
