FROM golang:alpine3.22 AS builder
WORKDIR /app

COPY --link go.* /app/
RUN --mount=type=cache,target=/go/pkg/mod \
    go mod download

COPY . .
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go build -o server .

FROM gcr.io/distroless/static-debian12:nonroot
WORKDIR /app    

COPY --from=builder /app/server .
COPY templates/ templates/
COPY static/ static/

EXPOSE 3000

CMD ["./server"]