FROM golang:1.8 as build
WORKDIR /go/src
COPY hello.go .
RUN go build -o hello

FROM scratch
COPY --from=build /go/src/hello .
ENTRYPOINT ["./hello"]