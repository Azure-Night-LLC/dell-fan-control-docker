FROM ubuntu:26.04@sha256:5e275723f82c67e387ba9e3c24baa0abdcb268917f276a0561c97bef9450d0b4
LABEL authors="ed"

RUN apt update \
    && apt install -y ipmitool lm-sensors \
    && rm -rf /var/lib/apt/lists/*

COPY dell-fan-control.sh /usr/bin
RUN chmod 755 /usr/bin/dell-fan-control.sh
ENTRYPOINT ["/usr/bin/dell-fan-control.sh"]