nc 2018shell1.picoctf.com 6903 <<- EOT | tail -n 1
	cd secret
	ls
	rm
	cd
	cd executables
	./dontLookHere
	whoami
	cd
	cp /tmp/TopSecret passwords
	cd passwords
	cat TopSecret
EOT
