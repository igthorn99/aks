# Quick Deploy AKS
This is not my original work and is pulled from the original tutorial for deploying AKS.  I modified the file to suit my needs and fix some issues with deployment.

### Setup a Client ID and Secret
Setup the ClientID and Secret for deployment AKS.  Remember this app registration will need to have Contributor rights to the subscription you plan on deploying it to.

### Use the following variables for terraform deployment 
Export the following variables in the command line.  Windows uses different export commands than Linux/MacOS.
- **CLIENT_ID** = Azure client ID allowed to access the subscription.
- **CLIENT_SECRET** = Azure secret password that goes with the client ID.
- **SUBSCRIPTION_ID** = Azure subscription where the build images will be placed.
- **TENANT_ID** = Azure Tenant ID where the images will be built and placed.

### Update the terraform.tfvars
Update the terraform.tfvars file to suit your needs.  This will setup the smallest VM needed to get AKS up and running.

### Deploy AKS with Terraform
To deploy AKS you will need to init the terraform script, format it, validate it, and run the plan.  If everything is good, then use terraform apply to start the deployment.  It will confirm the deployment.
```
terraform init
terraform format
terraform validate
terraform plan
terraform apply
```

### Testing Application deployment
I included the original workflow from Microsoft on deploying an application to the environment.  You will have to run a command to sync your credentials to your kubectl config file.

```
az aks get-credentials -g <aksgroup> -n <aksname>
```

If everything worked then run the following to check the status of the AKS nodes.

```
kubectl get nodes
```

NOTE: If you type the command and you get an Unhandled Error to your localhost IP, that means the crendentials aren't right and you probably need to fix the config file.

### Remove AKS with Terraform
If this is used for testing and to see how this all works, then run terraform destroy to remove the resources.  Logon to your subscription and validate the resources have been removed.
```
terraform destroy
```
