#!/usr/bin/env bash

#
# Generates a bootnode enr and saves it in $TESTNET/boot_enr.yaml
# Starts a bootnode from the generated enr.
#

source ./vars.env

rm -rf $TESTNET_DIR

EE_PORT=${1:-8545}
EE_ENDPOINT="http://localhost:${EE_PORT}"

echo "Retrieving genesis block from geth..."

GENESIS_BLOCK_HASH=$(curl \
	-X \
	POST \
	-H "Content-Type: application/json" \
	--data \
	'{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["earliest",false],"id":1}' \
	$EE_ENDPOINT \
	| jq '.result.hash' \
	| tr -d '"')

if [ -z ${GENESIS_BLOCK_HASH} ]; then exit; fi

echo "Genesis block hash is $GENESIS_BLOCK_HASH"

echo "Generating $SPEC specification and genesis state..."

$LCLI \
	--spec $SPEC \
	new-testnet \
	--genesis-time $(date +%s) \
	--altair-fork-epoch 0 \
	--merge-fork-epoch 0 \
	--interop-genesis-state \
	--validator-count $VALIDATOR_COUNT \
	--min-genesis-active-validator-count $VALIDATOR_COUNT \
	--testnet-dir $TESTNET_DIR \
	--deposit-contract-address 0x0000000000000000000000000000000000000000 \
	--deposit-contract-deploy-block 0 \
	--eth1-block-hash $GENESIS_BLOCK_HASH \

echo "Generating bootnode enr"

lcli \
	generate-bootnode-enr \
	--ip 127.0.0.1 \
	--udp-port 8100 \
	--tcp-port 8100 \
	--genesis-fork-version 0x02000000 \
	--output-dir $DATA_DIR/bootnode

bootnode_enr=`cat $DATA_DIR/bootnode/enr.dat`
echo "- $bootnode_enr" > $TESTNET_DIR/boot_enr.yaml

echo "Generated bootnode enr and written to $TESTNET_DIR/boot_enr.yaml"

DEBUG_LEVEL=${1:-info}

echo "Starting bootnode"

exec lighthouse boot_node \
    --testnet-dir $TESTNET_DIR \
    --port 8100 \
    --listen-address 127.0.0.1 \
	--disable-packet-filter \
    --network-dir $DATA_DIR/bootnode \
