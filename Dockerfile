FROM rust:1-alpine as builder

WORKDIR /usr/src/eh2telegraph

COPY . .

RUN cargo build --release

FROM alpine:3.17

COPY --from=builder /usr/src/eh2telegraph/target/release/bot /usr/local/bin/bot

CMD ["bot"]