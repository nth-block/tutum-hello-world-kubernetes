#Check if the Azure cli is installed
az version

# Install the azure-cli
brew install azure-cli

# Login to your Azure subscription
az login -t 7faee4b5-15a3-428c-99a9-33db04d26614

# Get your managed cluster's kubeconfig file
az aks get-credentials --name nthblock --resource-group Testing-AKS

# Ensure that the tutum namespace is created
kubectl get namespaces
# If not existing, then
kubectl create namespace tutum

# Apply the Tutum Hello World YAML file
kubectl apply -f aks-tutum-deploy-service.yaml

# Show the resources
kubectl -n tutum get all
## Focus on the pods listing

# Demo the automatic load balancing done by Kubernetes
for i in {1..40};do curl -s http://<ip>:9000 | grep -i "My hostname"; done;
#for i in {1..40};do curl -s http://13.82.195.66:9000 | grep -i "My hostname"; done;

# Apache bench tests for the portal (request service times)
ab -n 50 http://<ip>:9000/