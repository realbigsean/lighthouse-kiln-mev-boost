# MEV Lighthouse Kintsugi 🍵

## How To Run

This testnet requires 5 terminal processes, one for geth, 2 for beacon nodes, one 
for a validator client, and one for MEV-boost. See the per-terminal commands below.

### Terminal 1: Geth

```bash
cd m2_geth
```

On the first time, be sure to run `./install-geth.sh`

```bash
./run-geth.sh
```

### Terminal 2: MEV boost

Install MEV-boost, the directions exist in the `mev-boost` dir. 

```bash
cd mev_boost
./mev_boost
```

### Terminal 3: Lighthouse Beacon Node 1

First, install `lighthouse` and `lcli` if you haven't. Directions exist in the `m2_lighthouse` directory.

```bash
cd m2_lighthouse
./start_beacon_node_1.sh
```
*Note: it's important to start this beacon node before the other beacon node or validator client because this
script also produces tesnet config.*

### Terminal 4: Lighthouse Beacon Node 2

```bash
cd m2_lighthouse
./start_beacon_node_2.sh
```

### Terminal 5: Lighthouse Validator Client

```bash
cd m2_lighthouse
./start_validator_client.sh
```
