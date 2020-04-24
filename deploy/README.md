## Steps to run server on local k8s cluster

1. Run the deploy-local.yaml file
    ```
    kubectl apply -f deploy/deploy-local.yaml 
    ```

2. This will expose the server on localhost:50000

## Steps to start k8s dashboard locally

1. Run the latest yaml file as described in the k8s dashboard readme
    ```
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
    ```

2. Create the k8s proxy on port 8080
    ```
    kubectl proxy -p 8080
    ```

3. Access the dashboard in the browser
    ```
    http://127.0.0.1:8080/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
    ```

4. Create the dashboard service account
    ```
    kubectl create serviceaccount dashboard-admin-sa
    ```

5. Bind the dashboard-admin-service-account service account to the cluster-admin role
    ```
    kubectl create clusterrolebinding dashboard-admin-sa --clusterrole=cluster-admin --serviceaccount=default:dashboard-admin-sa
    ```

6. List secrets using:
    ```
    kubectl get secrets
    ```

7. Use kubectl describe to get the access token
    ```
    kubectl describe secret dashboard-admin-sa-token-mj4h2 // This is only an example. You will need to get this value from the last command
    ```

8. This should get you to the main landing page of the dashboard

## Steps to upload server on k8s using k8s dashboard

1. Once on the main langing page of the k8s dashboard, click on 'Create new resource' on the top right

2. Select the 'Create from app' option

3. Add the name, docker image-name, number of pods, services as needed

4. On clicking deploy, this should create an external IP (which will be localhost if you are running on docker-desktop k8s cluster)

