# build environment
FROM golang:1.22-alpine AS build

WORKDIR /go/src/ms

ADD . /go/src/ms

RUN go mod tidy
RUN go build -o client_api

# production environment
FROM gcr.io/distroless/base-debian12

WORKDIR /app

COPY --from=build /go/src/ms/client_api .

EXPOSE 8080

ENTRYPOINT ["./client_api"]
