FROM gcr.io/distroless/base-debian10
LABEL maintainer="qaware-oss@qaware.de"

# copy busybox as shell into the image
COPY --from=amd64/busybox:1.31.1 /bin/busybox /busybox/busybox
RUN ["/busybox/busybox", "--install", "/bin"]

# now we have shell
ENTRYPOINT [ "/bin/sh" ]
