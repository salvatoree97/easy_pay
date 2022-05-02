#Makefile

setup:
	brew install pre-commit
	pre-commit install

clean:
	sh ./fluttercleanall.sh

pub-all:
	sh ./flutterpuball.sh

update-strings:
	cd core && fvm flutter pub run intl_utils:generate

reboot:
	make clean
	make pub-all
