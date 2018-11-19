#!/usr/bin/env bash

webchaind --password /data/password account import /data/private
webchaind --fast \
    --rpc \
    --rpc-addr "0.0.0.0" \
    --rpc-port 39573 \
    --rpc-cors-domain "*" \
    --rpc-api="admin,debug,webchain,miner,eth,net,web3" \
    --unlock 0 \
    --password /data/password