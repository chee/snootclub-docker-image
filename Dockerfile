FROM greyltc/archlinux
RUN pacman -Syu --noconfirm nodejs npm openssh pm2 vim && \
	ssh-keygen -A && \
	/bin/sshd && \
	mkdir -p /root/.ssh && \
	chown -R root.root /root/.ssh && \
	chmod 700 -R /root/.ssh && \
	npm install -g parcel-bundler
