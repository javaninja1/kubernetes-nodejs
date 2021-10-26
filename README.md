# kubernetes-nodejs
Deploying a node-js application to kubernetes

## Create nodejs app with defaults and install express
```
npm init -y
npm i express
```

## Add a simple GET route using express app
```
const app = express();
app.get('/hello-k8s', (req,res) => {
   res.send('Hello Kubernetes from NodeJS');
});
```

## Add a Dockerfile for nodejs app image
```
docker build -t node-express:1.0 -f Dockerfile .
docker images
```

## Local testing
```
docker run -p 8080:8080 -t node-express:1.0
```

## Push Dockerfile to ECR
aws ecr get-login-password --region AWS_REGION | docker login --username AWS --password-stdin AWS_ACCT_NUM.dkr.ecr.AWS_REGION.amazonaws.com

docker tag node-express:1.0 AWS_ACCT_NUM.dkr.ecr.AWS_REGION.amazonaws.com/node-express:1.0

docker push AWS_ACCT_NUM.dkr.ecr.AWS_REGION.amazonaws.com/node-express:1.0

## Deploy the image from ECR to EKS


## Kubernetes commands to deploy the application
```
kubectl apply -f deployment.yaml 
kubectl describe pod node-express-xxxx -n demo-namespace
kubectl get pods -A

kubectl exec -it node-express-xxxx -n demo-namespace -- bash

root@node-express-xxxx:/usr/src/app# curl http://localhost:8080/hello-k8s
Hello Kubernetes from NodeJS

kubectl apply -f service.yaml 
kubectl get svc -A | grep node-express

```

## Adding Ingress path AWS ALB
### You will need to install the aws-load-balancer-controller
### as prequiste for this ## step

```
kubectl apply -f ingress.yaml -n demo-namespace
kubectl get ingress node-express -n demo-namespace -o yaml

```

## Access from external URL: https://domain/hello-k8s
