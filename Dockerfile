FROM golang:latest AS builder
WORKDIR /go/src/hello
RUN go mod init example/hello
COPY *.go .
RUN go build -o hello .
CMD ["./hello"]

#############################################

FROM scratch
WORKDIR /app
COPY --from=builder /go/src/hello .
CMD ["./hello"]