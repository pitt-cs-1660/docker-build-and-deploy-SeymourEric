FROM golang:1.23 AS builder

WORKDIR /app

COPY go.mod ./
COPY main.go ./
COPY templates/ ./templates/

RUN CGO_ENABLED=0 go build -o stat-binary .

FROM scratch

COPY --from=builder /app/stat-binary /stat-binary
COPY --from=builder /app/templates /templates

<<<<<<< HEAD:dockerfile
CMD ["/stat-binary"]
=======
CMD ["/stat-binary"]
>>>>>>> ce968ee3a3310d16412d4775bf180b08cb308d45:Dockerfile
