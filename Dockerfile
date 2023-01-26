FROM golang:1.19 AS builder
WORKDIR /src/app
COPY . .
RUN set -x && \
    go get -d -v . && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app /src/app

FROM scratch
WORKDIR /root/
COPY --from=builder /src/app .
CMD [ "./app" ]