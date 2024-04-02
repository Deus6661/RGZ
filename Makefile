.PHONY: build

build:
	clang client.c
	clang daemon.c -o ~/daemon
	sed 's/~/'"$$USER"'/g' systemd.unit > ~/.config/systemd/user/rgz.service
	systemctl --user daemon-reload

start:
	systemctl --user start rgz

stop:
	systemctl --user stop rgz

status:
	-systemctl --user status rgz
