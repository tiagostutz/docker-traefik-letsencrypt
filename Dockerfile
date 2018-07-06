FROM traefik:1.6-alpine

ADD startup.sh /startup.sh
CMD ["/startup.sh"]