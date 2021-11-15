## Milestone #2: Geth and Lighthouse

References:

- Geth instructions: https://notes.ethereum.org/@9AeMAlpyQYaAAyuj47BzRw/rkwW3ceVY
- Geth PR: https://github.com/ethereum/go-ethereum/pull/23607

## How To Run

This testnet requires 3 terminal processes, one for geth one for a beacon node
and one for a validator client. See the per-terminal commands below.

### Terminal 1: Geth

On the first time, be sure to run `./install-geth.sh`

```bash
./run-geth.sh
```

### Terminal 2: Lighthouse Beacon Node

```bash
cd m2_lighthouse
./start_beacon_node.sh
```

*Note: it's important to start the beacon node before the validator client
since that script also generates the testnet configuration.*

### Terminal 3: Lighthouse Validator Client

```bash
cd m2_lighthouse
./start_validator_client.sh
```
