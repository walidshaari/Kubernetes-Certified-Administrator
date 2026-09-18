# failures.md

Things that broke, and how you found out. **Write the symptom first**: that's how you'll meet it again.

<!--
Template for each entry:

## <Symptom, as you saw it>
Date:
Layer: <workload / scheduling / networking / storage / cluster>

- **What I saw:**
- **Command that revealed the cause:**
- **Root cause:**
- **Fix:**
- **What I tried first that didn't help (and why):**
- **Faster path next time:**
-->

## Example: Service returns nothing, Pods are Running

Date:
Layer: networking

- **What I saw:** `curl` to the Service ClusterIP times out. All Pods `Running` and `1/1`.
- **Command that revealed the cause:** `kubectl get endpointslices -l kubernetes.io/service-name=web` showed no endpoints.
- **Root cause:** Service selector `app: web` vs Pod label `app: webapp`.
- **Fix:** Corrected the selector.
- **What I tried first that didn't help:** Checked Pod logs. The app was fine; traffic never reached it.
- **Faster path next time:** Service not reachable → check endpoints before anything else.
