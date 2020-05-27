# Step 1: start building the Golang application
FROM golang:1.14.3-buster as build

WORKDIR /go/src/app
ADD . /go/src/app

RUN go build -o /go/bin/app

# Step 2: copy final binary artefact into a base image
FROM gcr.io/distroless/base-debian10

EXPOSE 8080
COPY --from=build /go/bin/app /

CMD ["/app"]
