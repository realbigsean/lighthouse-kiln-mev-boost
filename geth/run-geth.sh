./go-ethereum/build/bin/geth init genesis.json  --datadir "geth-datadir"
./go-ethereum/build/bin/geth --datadir "geth-datadir" account import ./sk.json
./go-ethereum/build/bin/geth --datadir "geth-datadir" --dev --http --http.api="engine,eth,web3,net,debug" --ws --ws.api="engine,eth,web3,net,debug" \
        --http.corsdomain "*" --networkid=4242 --syncmode=full --authrpc.jwtsecret=/tmp/jwtsecret --allow-insecure-unlock \
        --unlock "0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b" \
        --password "" --nodiscover  console
