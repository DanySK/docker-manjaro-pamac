FROM manjarolinux/base:20240922
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm pamac-cli libsoup3
RUN mkdir -p /var/tmp/pamac/dbs/sync
RUN pamac install pacman-contrib --no-confirm
RUN sudo sed -Ei '/EnableAUR/s/^#//' /etc/pamac.conf
RUN paccache -rk 0
RUN pamac clean -b
