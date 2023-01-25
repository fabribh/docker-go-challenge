FROM golang:1.19-alpine

WORKDIR $GOPATH/src/smallest-goland/app

COPY . .

RUN go mod download
RUN go mod verify

RUN go build -o /main .

CMD [ "/main" ]