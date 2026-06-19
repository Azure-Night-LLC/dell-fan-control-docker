FROM ubuntu:26.04@sha256:53958ec7b67c2c9355df922dd08dbf0360611f8c3cdb656875e81873db9ffdba
LABEL authors="ed"

RUN apt update \
    && apt install -y ipmitool lm-sensors \
    && rm -rf /var/lib/apt/lists/*

COPY dell-fan-control.sh /usr/bin
RUN chmod 755 /usr/bin/dell-fan-control.sh
ENTRYPOINT ["/usr/bin/dell-fan-control.sh"]