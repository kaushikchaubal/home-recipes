### Steps to make proto file work with grpc gateway

1. Install the following three dependencies locally
    ```
    go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
    go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
    go get github.com/golang/protobuf/protoc-gen-go
    ```

2. Copy all third-party libs under def folder (google as well as protoc-gen-swagger)

3. Add annotations to the proto file

4. Generate proto files for grpc-gateway
    ```
    protoc -I./defs defs/recipes-service.proto --go_out=plugins=grpc:./middleware
    protoc -I./defs defs/recipes-service.proto --grpc-gateway_out=logtostderr=true:./middleware
    ```

5. Implement middleware 

6. Run middleware (also ensure the server is running as expected)
    ```
    go build -o out/grpc-gateway middleware/main.go && ./out/grpc-gateway
    ```

7. Curl the addRecipe endpoint
    ```
    curl --location --request POST 'localhost:8080/v1/homerecipes/addRecipe' \
    --header 'Content-Type: text/plain' \
    --data-raw '{
        "recipe": {
            "name": "Gnochi",
            "cuisine": "Italian"
        }
    }'
    ```

8. Curl the ListAllRecipes endpoint (Note that GRPC-gateway supports server-side streaming)
    ```
    curl --location --request GET 'localhost:8080/v1/homerecipes/allRecipes/list'
    ```

9. Curl the ListAllIngredientsAtHome endpoint (Note that this was supporting only 1 message at a time)
    ```
    curl --location --request POST 'localhost:8080/v1/homerecipes/allIngredients/post' \
    --header 'Content-Type: text/plain' \
    --data-raw '{
        "ingredient": {
            "name": "Flour",
            "quantity": "2 kgs"
        }
    }'
    ```

10. Curl the GetAllIngredientsForRecipe endpoing (Note that the request can have only one item)
    ```
    curl --location --request POST 'localhost:8080/v1/homerecipes/getIngredients/all' \
    --header 'Content-Type: text/plain' \
    --data-raw '{
        "recipe": {
            "name": "Croissants",
            "quantity": ""
        }
    }'
    ```

11. Creating a swagger JSON
    ```
    protoc -I./defs defs/recipes-service.proto --swagger_out=logtostderr=true:./middleware
    ```

12. On-startup, you can access the swagger specs on
    ```
    http://localhost:8080/swaggerui/
    ```