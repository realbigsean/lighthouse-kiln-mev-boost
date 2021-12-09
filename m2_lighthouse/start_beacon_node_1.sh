source ./vars.env

echo "Staring a beacon node using an execution engine at $EE_ENDPOINT..."
rm -rf $BEACON_DIR_1

$LIGHTHOUSE \
	--spec $SPEC \
	--testnet-dir $TESTNET_DIR \
	--debug-level $DEBUG_LEVEL \
	beacon_node \
	--datadir $BEACON_DIR_1 \
	--dummy-eth1 \
	--http \
	--http-allow-sync-stalled \
	--metrics \
	--merge \
	--execution-endpoints $EE_ENDPOINT \
    --payload-builder $PAYLOAD_BUILDER \

