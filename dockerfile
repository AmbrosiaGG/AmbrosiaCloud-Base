FROM scratch
LABEL org.opencontainers.image.ref.name="ambrosia-cloud"
LABEL org.opencontainers.image.version="Ubuntu 24.04"
WORKDIR /
ADD ./rootfs /

RUN ["apt", "update", "-y"]
RUN ["apt", "upgrade", "-y"]
RUN ["apt", "install", "zip", "wget", "curl", "htop", "net-tools", "git", "fish", "python3", "nmap", "nano", "vim", "vi", "-y"]
RUN ["mkdir", "scripts"]

RUN curl -fsSl https://bun.sh/install > ./scripts/bun.run
RUN curl -fsSL https://deb.nodesource.com/setup_22.x > ./scripts/node22x.run
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh > ./scripts/nodeverman.run
RUN curl https://pyenv.run > ./scripts/pyenv.run

RUN ["bash", "./scripts/bun.run"]
RUN ["bash", "./scripts/node22x.run"]
RUN ["bash", "./scripts/nodeverman.run"]
RUN ["bash", "./scripts/pyenv.run"]

RUN ["apt", "install", "nodejs", "-y"]

RUN /bin/bash -c "echo  PS1=\"☁️  \[\033[1;36m\]\h \[\033[1;34m\]\W\[\033[0;35m\] \[\033[1;36m\]# \[\033[0m\]\" "
RUN /bin/bash -c "echo $(PS1)"
