Cardano events helm chart

### Install the Helm chart in the default namespace
`helm install cardano-api .`

### Uninstall any previous failed release
`helm uninstall cardano-api`


## Secrets encoding
Kubernetes requires secret data to be base64 encoded to ensure that it can handle arbitrary binary data in a text-based format. This encoding ensures data integrity during transport and storage.

`echo -n 'your-secret-value' | base64`

Example:
```
echo -n 'v8hlDV0yMAHHlIurYupj' | base64
# Output: djhoblRWMHlNQUhIbEl1cll1cGo=
```

Create `secrets.yaml`with the encoded values:
```
apiVersion: v1
kind: Secret
metadata:
  name: cardano-api-secret
  annotations:
    meta.helm.sh/release-name: cardano-api
    meta.helm.sh/release-namespace: default
  labels:
    app.kubernetes.io/managed-by: Helm
type: Opaque
data:
  DB_USER: XXX
  DB_PWD: XXX
  REDIS_HOST: XXX
  DB_HOST: XXX
  DB_HOST_TESTNET: XXX
  DB_USER_TESTNET: XXX
  DB_PWD_TESTNET: XXX
  SCYLLA_CONTACT_POINTS: XXX
  KAFKA_HOST: XXX
```

To view secrets:   
    ```
    $ kubectl get secrets
    ```
    
To describe secret:
    ```
    $ kubectl describe secret
    ```
    
To view the values of the secret:
``` 
$ kubectl get secret cardano-api-secret -o yaml
```
