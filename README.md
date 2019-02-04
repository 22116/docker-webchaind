# Webchain daemon - docker image

Simple docker wrapper for webchain daemon to use in your project.

## Variables

| var | default | description |
| --- | ------- | ----------: |
| PASS | /data/password | Text file with an acconts password |
| ACCOUNT | /data/private | Account private key |
| IS_FAST | 1 | Use fast node |
| RPC_HOST | "0.0.0.0" | Host for RPC API |
| RPC_PORT | 39573 | Port for RPC API |
| RPC_CORS | "*" | CORS for RPC API |
| RPC_API | "admin,debug,webchain,miner,eth,net,web3" | Permissions to use in API |

## Volumes

Use `/data/password` (Can be changed with PASS variable) to specify account password,
Use `/data/private` (Can be changed with ACCOUNT variable) to specify account private,
