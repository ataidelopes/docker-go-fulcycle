FROM golang:1.16-stretch AS build
WORKDIR /src
RUN go mod init out
COPY src/main.go .

RUN CGO_ENABLED=0 GOOS=linux go build -a -o go-fulcycle .

FROM scratch
COPY --from=build /src .
ENTRYPOINT [ "./go-fulcycle" ]
