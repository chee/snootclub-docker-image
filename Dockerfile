FROM greyltc/archlinux
ENV PATH="/usr/bin/core_perl:/rakudo/install/bin:/rakudo/install/share/perl6/site/bin:${PATH}"
RUN \
	pacman -Syu --noconfirm base-devel nodejs npm openssh pm2 neovim jshon git && \
	curl https://snoot.club/downloads/rakudo.tar.gz | tar xzv && \
	curl -LJ https://rakudo.org/latest/star/source -o rakudo.tar.gz && \
	ssh-keygen -A && \
	/bin/sshd && \
	mkdir -p /root/.ssh && \
	chown -R root.root /root/.ssh && \
	chmod 700 -R /root/.ssh && \
	ln -s /bin/nvim /usr/local/bin/vim && \
	ln -s /bin/nvim /usr/local/bin/vi && \
	npm install -g parcel-bundler @snootclub/post-receive
