# Step 1: Build the Go binary
FROM golang:1.21 AS builder

WORKDIR /app

COPY main.go .

RUN go mod init example.com/app && go mod tidy
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server main.go

# Step 2: Use Distroless as the final image
FROM gcr.io/distroless/static-debian11

WORKDIR /

COPY --from=builder /app/server .

EXPOSE 8080

CMD ["/server"]
