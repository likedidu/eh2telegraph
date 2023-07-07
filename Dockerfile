FROM rust:1-alpine as builder

WORKDIR /usr/src/eh2telegraph

COPY . .

RUN cargo build --release

FROM alpine:3.17

RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*

COPY --from=builder /usr/src/eh2telegraph/target/release/bot /usr/local/bin/bot

CMD ["/usr/local/bin/bot"]