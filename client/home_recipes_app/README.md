# Home Recipes app

This client runs on the following platforms:
* Android
* iOS
* Web app
* MacOS app

### Note: 
To create the apk to run on an Andriod phone, you need to run the following command:
    ```
    flutter build apk -debug
    ```

### Steps taken to connect client to server

1. Install dart

2. Activate protoc plugin
    ```
    pub global activate protoc_plugin
    ```

3. Add pub-cache to PATH
    ```
    PATH="$PATH":"$HOME/.pub-cache/bin"
    ```

4. Generate dart code from protos
    ```
    protoc ./defs/recipes-service.proto  --dart_out=grpc:client/home_recipes_app/lib/generated
    ```

5. Add dependencies to pubspec.yaml
    ```
    grpc: ^2.1.3
    protobuf: ^1.0.1
    uuid: ^2.0.4
    ```

6. Implement client logic