FROM debian:buster

RUN apt-get update && apt-get install -y curl ca-certificates tzdata procps

RUN curl \
  --proto '=https' \
  --tlsv1.2 -O \
  https://packages.timber.io/vector/0.18.0/vector-0.18.0-amd64.deb
RUN dpkg -i vector-0.18.0-amd64.deb

CMD ["/usr/bin/vector"]
#, "--config", "/etc/vector/vector.yaml"]
#ENTRYPOINT ["/usr/bin/vector --config /etc/vector/vector.yaml"]