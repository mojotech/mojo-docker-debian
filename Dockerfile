FROM debian:wheezy
MAINTAINER mojotech <ops@mojotech.com>

ENV DEBIAN_FRONTEND noninteractive

ADD apt /etc/apt
RUN apt-key add /etc/apt/keys/*

RUN apt-get update -qq && \
    apt-get install -qq -y --no-install-recommends ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD proxy.public.crt /usr/local/share/ca-certificates/

RUN update-ca-certificates

CMD []

ENTRYPOINT ["/bin/bash"]
