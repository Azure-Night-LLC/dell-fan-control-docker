FROM ubuntu:26.04@sha256:c098726dd9b9733f3e885f8de0ef375206a311b0a317eadc40d347b1115fb944
LABEL authors="ed"

RUN apt update \
    && apt install -y ipmitool lm-sensors \
    && rm -rf /var/lib/apt/lists/*

COPY dell-fan-control.sh /usr/bin
RUN chmod 755 /usr/bin/dell-fan-control.sh
ENTRYPOINT ["/usr/bin/dell-fan-control.sh"]