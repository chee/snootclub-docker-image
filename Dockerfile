FROM greyltc/archlinux
ENV PATH="/usr/bin/core_perl:/rakudo/install/bin:/rakudo/install/share/perl6/site/bin:${PATH}"
RUN \
	pacman -Syu --noconfirm base-devel nodejs npm openssh pm2 neovim jshon git && \
	curl -LJ https://rakudo.org/latest/star/source -o rakudo.tar.gz && \
	tar xzvf rakudo.tar.gz && \
	mv rakudo-star-* rakudo && \
	rm rakudo.tar.gz && \
	cd rakudo && \
	perl Configure.pl --backend=moar --gen-moar && \
	make && make install && \
	ssh-keygen -A && \
	/bin/sshd && \
	mkdir -p /root/.ssh && \
	chown -R root.root /root/.ssh && \
	chmod 700 -R /root/.ssh && \
	ln -s /bin/nvim /usr/local/bin/vim && \
	ln -s /bin/nvim /usr/local/bin/vi && \
	npm install -g parcel-bundler @snootclub/post-receive && \
	{echo "export PATH=$(pwd)/install/bin/:$(pwd)/install/share/perl6/site/bin:\$PATH" >> /etc/profile}
