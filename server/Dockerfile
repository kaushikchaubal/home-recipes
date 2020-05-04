FROM golang

RUN git config --global http.sslVerify false

# Download dependencies
RUN go get -v google.golang.org/grpc
RUN go get -v github.com/prometheus/client_golang/prometheus
RUN go get -v github.com/prometheus/client_golang/prometheus/promauto
RUN go get -v github.com/prometheus/client_golang/prometheus/promhttp

# Build
ADD . /go/src/home-recipes/server
RUN go build -o out/recipes-server home-recipes/server/recipes/

ENTRYPOINT ["out/recipes-server"]

EXPOSE 50000
EXPOSE 2112
