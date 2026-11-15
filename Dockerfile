FROM ubuntu:26.04@sha256:065aa8626841f16057b78b027b464cd59c4fac36c204c72dcbf48d66f5fa8a96
LABEL authors="ed"

RUN apt update \
    && apt install -y ipmitool lm-sensors \
    && rm -rf /var/lib/apt/lists/*

COPY dell-fan-control.sh /usr/bin
RUN chmod 755 /usr/bin/dell-fan-control.sh
ENTRYPOINT ["/usr/bin/dell-fan-control.sh"]