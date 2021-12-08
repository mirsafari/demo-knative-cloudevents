# Stage 1 - Build binary
FROM golang:1.16-alpine AS builder

RUN apk update && apk add --no-cache git

WORKDIR /go/src/app
COPY . .

## Add flags to remove debug information, compile only for linux target and disable cross compilation.
RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/cloudevent-display

# Stage 2 - Copy binary and prepare executable
FROM alpine:3.14
## Copy binary from Stage 1
COPY --from=builder /go/bin/cloudevent-display /go/bin/cloudevent-display
## Add user for rootless container
ARG USER=non-root
RUN addgroup -S $USER && \
    adduser -S $USER -G $USER && \
    chown $USER:$USER /go/bin/cloudevent-generate
USER $USER
## Run the binary
ENTRYPOINT ["/go/bin/cloudevent-display"]
