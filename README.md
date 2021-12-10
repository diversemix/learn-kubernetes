# Learn Terraform

## Preamble

- Install minikube as per the instructions online.
- I tried using `minikube kubectl ...` for all the commands but some don't work.
- If you come across this install kubectl - I used:
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

You'll then want to start the server with:
```
minikube start
```

Another thing you may want is bash auto-completion, see https://kubernetes.io/docs/tasks/tools/included/optional-kubectl-configs-bash-linux/

## First steps

Reduce typing use `alias k=kubectl`

- Then rehearse:
```{bash}
k version       # get version information
k cluster-info  # check cluster
k get all       # check what is running
```

- Now start a simple pod with:

```{bash}
k create -f ./nginx-pod.yaml --save-config
```
- NOTE: The `--save-config` adds the configuration into the annotations see this by: `k get pod basic-nginx -o json`

- Now check what's running again with: `k get all`

- Expose the port to the local machine using:
```{bash}
k port-forward pod/basic-nginx 8088:80
```

- Now delight in your newly running nginx instance here: http://localhost:8088

## More commands

``` {bash}
k describe pod              # also gets events
k apply -f <filename>       # reconfigures or creates resources
k exec <pod-name> -it sh    # get a shell in the pod
k edit -f <filename>        # edit resource
k delete -f <filename>      # delete resource
```

## Probes

Diagnostic to check what's happening in the pod using a probe, two types:

- Liveliness
- Readiness

Failed Pods are then subject to the restart policy.

Actions are of the following types:
- ExecAction
- TCPSocketAction
- HTTPGetAction
... these actions can return Success, Failure or Unknown

This can be defined in the `spec` part of the YAML:
```{yml}
spec:
    containers:
    - name: basic-nginx
      image: nginx:alpine
      livenessProbe:
        httpGet:
          path: /index.html
          port: 80
        initialDelaySeconds: 15
        timeoutSeconds: 2
        periodSeconds: 5
        failureThreshold: 1
```