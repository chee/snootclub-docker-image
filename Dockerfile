FROM greyltc/archlinux
RUN pacman -Syu --noconfirm nodejs npm openssh pm2 neovim git && \
	ssh-keygen -A && \
	/bin/sshd && \
	mkdir -p /root/.ssh && \
	chown -R root.root /root/.ssh && \
	chmod 700 -R /root/.ssh && \
	ln -s /bin/nvim /usr/local/bin/vim && \
	ln -s /bin/nvim /usr/local/bin/vi && \
	npm install -g parcel-bundler @snootclub/post-receive
