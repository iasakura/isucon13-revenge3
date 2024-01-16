deploy:
	sudo git pull origin main &&\
	cd /home/isucon/webapp/rust/ &&\
	cargo build --release &&\
	sudo systemctl restart isupipe-rust

rstatus:
	sudo systemctl status isupipe-rust

log:
	journalctl -u isupipe-rust -f -n100

sqinit:
	sudo cp /dev/null  /var/log/mysql/mysql-slow.log
