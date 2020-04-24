FROM golang
ADD . /go/src/home-recipes/server
RUN go get -u google.golang.org/grpc
RUN go build -o out/recipes-server home-recipes/server/recipes/
ENTRYPOINT ["out/recipes-server"]
EXPOSE 50000
