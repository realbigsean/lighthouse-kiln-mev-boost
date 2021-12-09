./go-ethereum/build/bin/geth --catalyst --datadir "./datadir" init genesis.json
./go-ethereum/build/bin/geth --catalyst --http --ws -http.api "engine" --datadir "./datadir" account import ./sk.json
./go-ethereum/build/bin/geth --catalyst --dev --http --ws -http.api "engine,eth" --datadir "./datadir" \
    --allow-insecure-unlock \
    --unlock "0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b" \
    --password "" \
    --nodiscover \
    console
