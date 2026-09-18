# commands.md

Command sequences that worked. Written so you can re-run them from memory as a warm-up.

<!--
Template for each entry:

## <Task name>
Domain: <Troubleshooting / Cluster Architecture / Networking / Workloads / Storage>
Last practised: <date>
Time taken: <mm:ss>

```bash
<commands, in order>
```

Verify with:
```bash
<one command that proves it worked>
```
-->

## Example: etcd snapshot

Domain: Cluster Architecture
Last practised:
Time taken:

```bash
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt \
  --cert=/etc/kubernetes/pki/etcd/server.crt \
  --key=/etc/kubernetes/pki/etcd/server.key \
  snapshot save /backup/snapshot.db
```

Verify with:
```bash
etcdutl --write-out=table snapshot status /backup/snapshot.db
```
