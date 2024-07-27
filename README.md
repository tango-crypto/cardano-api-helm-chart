## Cardano events helm chart

## Secrets encoding
Kubernetes requires secret data to be base64 encoded to ensure that it can handle arbitrary binary data in a text-based format. This encoding ensures data integrity during transport and storage.

```
echo -n 'your-secret-value' | base64
```

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

## Installing Helm Chart

### Install the Helm chart in the default namespace
```
$ helm install cardano-api .
``````

### Uninstall any previous failed release
```
$ helm uninstall cardano-api
```

List running pods:
``````
$ kubectl get pods
NAME                                                  READY   STATUS    RESTARTS   AGE
cardano-api-cardano-api-helm-chart-76ffcc8bc8-lqxhm   1/1     Running   0          9m47s
``````

Get logs:
```
$ kubectl logs -f cardano-api-cardano-api-helm-chart-76ffcc8bc8-lqxhm
```
Should show the following: 

```
[3:49:32 AM] Starting compilation in watch mode...

[3:49:33 AM] Found 0 errors. Watching for file changes.

[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [NestFactory] Starting Nest application...
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [InstanceLoader] AutomapperModule dependencies initialized +31ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [InstanceLoader] ConfigHostModule dependencies initialized +4ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [InstanceLoader] ConfigModule dependencies initialized +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [InstanceLoader] ConfigModule dependencies initialized +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [InstanceLoader] ThrottlerModule dependencies initialized +33ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [InstanceLoader] AppModule dependencies initialized +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [InstanceLoader] AuthModule dependencies initialized +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [InstanceLoader] WebhooksModule dependencies initialized +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RoutesResolver] AppController {/}: +4ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/health, GET} route +4ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RoutesResolver] EpochsController {/:accountId/epochs}: +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/epochs/current, GET} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/epochs/:epoch/parameters, GET} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RoutesResolver] PoolsController {/:accountId/pools}: +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/pools/:id, GET} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/pools/:id/delegations, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RoutesResolver] AddressesController {/:accountId/addresses}: +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/addresses/:address, GET} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/addresses/:address/utxos, GET} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/addresses/:address/assets, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/addresses/:address/assets/:asset/utxos, GET} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/addresses/:address/transactions, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/addresses/:address/info, GET} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/addresses/:address/coinselection, POST} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RoutesResolver] AssetsController {/:accountId/assets}: +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/assets/:id, GET} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/assets/fingerprint/:id, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/assets/:id/addresses, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/assets/fingerprint/:id/addresses, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RoutesResolver] BlocksController {/:accountId/blocks}: +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/blocks/:blockNumber, GET} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/blocks/hash/:blockHash, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/blocks/latest, GET} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/blocks/:blockNo/transactions, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/blocks/hash/:blockHash/transactions, GET} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RoutesResolver] TransactionsController {/:accountId/transactions}: +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/transactions/:txHash, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/transactions/:txHash/utxos, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/transactions/:txHash/scripts, GET} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/transactions/:txHash/collaterals, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/transactions/:txHash/mints, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/transactions/:txHash/metadata, GET} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/transactions/submit, POST} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/transactions/evaluate, POST} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/transactions/build, POST} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RoutesResolver] WalletsController {/:accountId/wallets}: +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/wallets/:stake_address, GET} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/wallets/:stake_address/addresses, GET} route +4ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/wallets/:stake_address/coinselection, POST} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/wallets/recovery_phrase, POST} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/wallets/recovery_phrase/key, POST} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/wallets/native_script, POST} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/wallets/native_script/address, POST} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RoutesResolver] PoliciesController {/:accountId/policies}: +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/policies/:policy/assets, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RoutesResolver] ScriptsController {/:accountId/scripts}: +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/scripts/:hash, GET} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/scripts/:hash/redeemers, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RoutesResolver] DatumsController {/:accountId/datums}: +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/datums/:hash, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RoutesResolver] WebhooksController {/:accountId/webhooks}: +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/webhooks, GET} route +2ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/webhooks/:id, GET} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/webhooks, POST} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/webhooks/:id, PATCH} route +0ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [RouterExplorer] Mapped {/:accountId/webhooks/:id, DELETE} route +1ms
[Nest] 26  - 07/27/2024, 3:49:35 AM     LOG [NestApplication] Nest application successfully started +2ms
Redis: connect
Redis: connect
Redis: ready
Redis: ready
```