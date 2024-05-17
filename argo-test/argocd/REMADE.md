# argocd  ingress  progressing
nginx 的版本問題

-v1.20.0 
```shell
kubectl edit cm -n argocd argocd-cm

data:
  resource.customizations: |
    networking.k8s.io/Ingress:
        health.lua: |
          hs = {}
          hs.status = "Healthy"
          return hs

```

-v1.20.0 以下
```shell

data:
  resource.customizations: |
    networking.k8s.io/Ingress:
        health.lua: |
          hs = {}
          hs.status = "Healthy"
          return hs
```

