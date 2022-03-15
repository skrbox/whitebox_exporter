FROM --platform=linux golang:1.17.8 AS builder
WORKDIR /go/src/github.com/skrbox/whitebox_exporter
COPY . .
ENV GOPROXY=https://goproxy.cn,direct \
    CGO_ENABLED=0
RUN make binary

FROM --platform=linux alpine:3.15.0 AS runner
WORKDIR /app
COPY --from=builder --chown=bin /go/src/github.com/skrbox/whitebox_exporter/whitebox_exporter .
COPY LICENSE README.md ./
COPY conf.yaml /etc/whitebox/
CMD /app/whitebox_exporter \
    --web.listen-addr=:12306 \
    --web.metric-path=/metrics \
    --meta.config-file=/etc/whitebox/config.yaml
