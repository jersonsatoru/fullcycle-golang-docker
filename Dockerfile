FROM golang:1.14.12-alpine3.12 as builder

WORKDIR /usr/golang/

COPY . .

RUN go build -ldflags "-s -w" ./src/hello_world.go

FROM scratch

WORKDIR "/usr/golang"

COPY --from=builder /usr/golang/hello_world /usr/golang

ENTRYPOINT [ "./hello_world" ]
