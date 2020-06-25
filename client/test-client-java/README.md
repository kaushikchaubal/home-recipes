# Home-Recipes Java Client 

This is a JAVA client developed to consume the 4 different service types defined by the proto file. The inputs to the service calls are static and can be changed in the main class file. 

### Note: 
This project was created and developed using JetBrains IntelliJ IDEA using gradle based settings.

### Steps followed to create the client app:

1. Ensure JDK is installed

2. Configure ```build.gradle``` file for gRPC plugins proto compiler and proto definitions

3. Make sure to add the external proto definitions dependencies to ```build/generated/source/proto/main/java``` used in your proto file and configure it in the ```build.gradle``` file

4. Generate JAVA stubs from proto files using following commands:
   ```
    ./gradlew extractIncludeProto
    ./gradlew extractProto
    ./gradlew generateProto
   ```

5. Implement client logic 

6. Once implemented, you can follow any of the following steps to run this client app:

    a. (Using IntelliJ IDEA) Just run the main JAVA class and you should see service interaction messages being logged in the build window

    b. (Using a terminal or command prompt) Open a terminal/command prompt and navigate to the java client project directory and run the following commands. You should be able to see service interaction messages being logged in the terminal window
        
        ./gradlew extractIncludeProto
        ./gradlew extractProto
        ./gradlew generateProto
        ./gradlew compileJava
        ./gradlew processResources
        ./gradlew classes
        ./gradlew runWithJavaExec
        

