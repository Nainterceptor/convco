FROM rust:alpine as builder
RUN apk add clang musl-dev
RUN cargo install convco

FROM alpine as base
COPY --from=builder /usr/local/cargo/bin/convco /usr/local/bin/convco

ENTRYPOINT [ "convco" ]
CMD [ "check" ]
