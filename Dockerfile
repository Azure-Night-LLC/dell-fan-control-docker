FROM ubuntu:26.04@sha256:6a06111c3b0a8600feadb270aec771dc239bf407b25625f93f44ab00e11f4d3c
LABEL authors="ed"

RUN apt update \
    && apt install -y ipmitool lm-sensors \
    && rm -rf /var/lib/apt/lists/*

COPY dell-fan-control.sh /usr/bin
RUN chmod 755 /usr/bin/dell-fan-control.sh
ENTRYPOINT ["/usr/bin/dell-fan-control.sh"]