# MEV Lighthouse Kiln

## How To Run

This testnet requires 5 terminal processes, one for geth, 2 for beacon nodes, one 
for a validator client, and one for MEV-boost. See the per-terminal commands below.

### Terminal 1: Geth

```bash
cd geth
```

On the first time, be sure to run `./install-geth.sh`

```bash
./run-geth.sh
```

You will be prompted to enter a password for the wallet. You can just press
ENTER a few times. After being dumped into the console you must run
```
miner.start()
```

### Terminal 2: MEV boost

Install MEV-boost, the directions exist in the `mev-boost` dir. 

```bash
cd mev_boost
./mev_boost
```

### Terminal 3: Lighthouse Beacon Node 1

First, install `lighthouse` and `lcli` if you haven't. Directions exist in the `lighthouse` directory.

```bash
cd lighthouse
./start_beacon_node_1.sh
```
*Note: it's important to start this beacon node before the other beacon node or validator client because this
script also produces tesnet config.*

### Terminal 4: Lighthouse Beacon Node 2

```bash
cd lighthouse
./start_beacon_node_2.sh
```

### Terminal 5: Lighthouse Validator Client

```bash
cd lighthouse
./start_validator_client.sh
```
