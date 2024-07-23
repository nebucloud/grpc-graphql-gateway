FROM cgr.dev/chainguard/go AS builder

WORKDIR /app

COPY . .

RUN go build -o app main.go

FROM cgr.dev/chainguard/glibc-dynamic

COPY --from=builder /app/app /usr/bin/

EXPOSE 8888

CMD ["/usr/bin/app"]
