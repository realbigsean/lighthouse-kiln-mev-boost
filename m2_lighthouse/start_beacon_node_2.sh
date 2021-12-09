source ./vars.env

echo "Staring a beacon node using an execution engine at $EE_ENDPOINT..."
rm -rf $BEACON_DIR_2

$LIGHTHOUSE \
	--spec $SPEC \
	--testnet-dir $TESTNET_DIR \
	--debug-level $DEBUG_LEVEL \
	beacon_node \
	--datadir $BEACON_DIR_2 \
	--dummy-eth1 \
	--port 9100 \
	--http-port 6052 \
	--http \
	--http-allow-sync-stalled \
	--merge \
	--execution-endpoints $EE_ENDPOINT \
    --payload-builder $PAYLOAD_BUILDER \

