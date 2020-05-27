# Stage 1: build Golang application
FROM golang:1.14.3-buster as builder

WORKDIR /go/src/app
ADD . /go/src/app

RUN go build -o /go/bin/distroless-golang

# Stage 2: build Distroless runtime image
FROM gcr.io/distroless/base-debian10
LABEL maintainer="qaware-oss@qaware.de"

EXPOSE 8080
CMD ["/distroless-golang"]

# Step 2: copy binary from builder stage onto Distroless image
COPY --from=builder /go/bin/distroless-golang /
