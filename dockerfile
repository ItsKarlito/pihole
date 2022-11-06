FROM pihole/pihole:2022.04.3

RUN apt update && apt install -y unbound

COPY pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY 99-edns.conf /etc/dnsmasq.d/99-edns.conf

RUN mkdir /etc/services.d/unbound
COPY run /etc/services.d/unbound/run

ENTRYPOINT ./s6-init
