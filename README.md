# superhack

helpful aliases

```shell
alias pp='podman pod'
alias pk='podman kube'
alias ppl='pp logs -f --tail 100 op-node-pod'
```

helpful commands
`pk play op-node.yaml`
`ppl`
`pp rm op-node-pod -f`

op-node cli flags
```
podman run us-docker.pkg.dev/oplabs-tools-artifacts/images/op-node:v1.1.1 op-node --help
NAME:
   op-node - Optimism Rollup Node

USAGE:
   op-node [global options] command [command options] [arguments...]

VERSION:
   v0.0.0-89ed69d8-1687165076

DESCRIPTION:
   The Optimism Rollup Node derives L2 block inputs from L1 data and drives an external L2 Execution Engine to build a L2 chain.

COMMANDS:
   p2p
   genesis
   doc
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --l1 value                                  Address of L1 User JSON-RPC endpoint to use (eth namespace required) (default: "http://127.0.0.1:8545") [$OP_NODE_L1_ETH_RPC]
   --l2 value                                  Address of L2 Engine JSON-RPC endpoints to use (engine and eth namespace required) [$OP_NODE_L2_ENGINE_RPC]
   --rpc.addr value                            RPC listening address [$OP_NODE_RPC_ADDR]
   --rpc.port value                            RPC listening port (default: 0) [$OP_NODE_RPC_PORT]
   --rollup.config value                       Rollup chain parameters [$OP_NODE_ROLLUP_CONFIG]
   --network value                             Predefined network selection. Available networks: goerli, mainnet [$OP_NODE_NETWORK]
   --l1.trustrpc                               Trust the L1 RPC, sync faster at risk of malicious/buggy RPC providing bad or inconsistent L1 data [$OP_NODE_L1_TRUST_RPC]
   --l1.rpckind value                          The kind of RPC provider, used to inform optimal transactions receipts fetching, and thus reduce costs. Valid options: alchemy, quicknode, infura, parity, nethermind, debug_geth, erigon, basic, any (default: basic) [$OP_NODE_L1_RPC_KIND]
   --l1.rpc-rate-limit value                   Optional self-imposed global rate-limit on L1 RPC requests, specified in requests / second. Disabled if set to 0. (default: 0) [$OP_NODE_L1_RPC_RATE_LIMIT]
   --l1.rpc-max-batch-size value               Maximum number of RPC requests to bundle, e.g. during L1 blocks receipt fetching. The L1 RPC rate limit counts this as N items, but allows it to burst at once. (default: 20) [$OP_NODE_L1_RPC_MAX_BATCH_SIZE]
   --l1.http-poll-interval value               Polling interval for latest-block subscription when using an HTTP RPC provider. Ignored for other types of RPC endpoints. (default: 12s) [$OP_NODE_L1_HTTP_POLL_INTERVAL]
   --l2.jwt-secret value                       Path to JWT secret key. Keys are 32 bytes, hex encoded in a file. A new key will be generated if left empty. [$OP_NODE_L2_ENGINE_AUTH]
   --verifier.l1-confs value                   Number of L1 blocks to keep distance from the L1 head before deriving L2 data from. Reorgs are supported, but may be slow to perform. (default: 0) [$OP_NODE_VERIFIER_L1_CONFS]
   --sequencer.enabled                         Enable sequencing of new L2 blocks. A separate batch submitter has to be deployed to publish the data for verifiers. [$OP_NODE_SEQUENCER_ENABLED]
   --sequencer.stopped                         Initialize the sequencer in a stopped state. The sequencer can be started using the admin_startSequencer RPC [$OP_NODE_SEQUENCER_STOPPED]
   --sequencer.max-safe-lag value              Maximum number of L2 blocks for restricting the distance between L2 safe and unsafe. Disabled if 0. (default: 0) [$OP_NODE_SEQUENCER_MAX_SAFE_LAG]
   --sequencer.l1-confs value                  Number of L1 blocks to keep distance from the L1 head as a sequencer for picking an L1 origin. (default: 4) [$OP_NODE_SEQUENCER_L1_CONFS]
   --l1.epoch-poll-interval value              Poll interval for retrieving new L1 epoch updates such as safe and finalized block changes. Disabled if 0 or negative. (default: 6m24s) [$OP_NODE_L1_EPOCH_POLL_INTERVAL]
   --rpc.enable-admin                          Enable the admin API (experimental) [$OP_NODE_RPC_ENABLE_ADMIN]
   --metrics.enabled                           Enable the metrics server [$OP_NODE_METRICS_ENABLED]
   --metrics.addr value                        Metrics listening address (default: "0.0.0.0") [$OP_NODE_METRICS_ADDR]
   --metrics.port value                        Metrics listening port (default: 7300) [$OP_NODE_METRICS_PORT]
   --pprof.enabled                             Enable the pprof server [$OP_NODE_PPROF_ENABLED]
   --pprof.addr value                          pprof listening address (default: "0.0.0.0") [$OP_NODE_PPROF_ADDR]
   --pprof.port value                          pprof listening port (default: 6060) [$OP_NODE_PPROF_PORT]
   --snapshotlog.file value                    Path to the snapshot log file [$OP_NODE_SNAPSHOT_LOG]
   --heartbeat.enabled                         Enables or disables heartbeating [$OP_NODE_HEARTBEAT_ENABLED]
   --heartbeat.moniker value                   Sets a moniker for this node [$OP_NODE_HEARTBEAT_MONIKER]
   --heartbeat.url value                       Sets the URL to heartbeat to (default: "https://heartbeat.optimism.io") [$OP_NODE_HEARTBEAT_URL]
   --l2.backup-unsafe-sync-rpc value           Set the backup L2 unsafe sync RPC endpoint. [$OP_NODE_L2_BACKUP_UNSAFE_SYNC_RPC]
   --l2.backup-unsafe-sync-rpc.trustrpc value  Like l1.trustrpc, configure if response data from the RPC needs to be verified, e.g. blockhash computation.This does not include checks if the blockhash is part of the canonical chain. [$OP_NODE_L2_BACKUP_UNSAFE_SYNC_RPC_TRUST_RPC]
   --p2p.disable                               Completely disable the P2P stack [$OP_NODE_P2P_DISABLE]
   --p2p.no-discovery                          Disable Discv5 (node discovery) [$OP_NODE_P2P_NO_DISCOVERY]
   --p2p.priv.path value                       Read the hex-encoded 32-byte private key for the peer ID from this txt file. Created if not already exists.Important to persist to keep the same network identity after restarting, maintaining the previous advertised identity. (default: "opnode_p2p_priv.txt") [$OP_NODE_P2P_PRIV_PATH]
   --p2p.scoring value                         Sets the peer scoring strategy for the P2P stack. Can be one of: none or light. [$OP_NODE_P2P_PEER_SCORING]
   --p2p.ban.peers                             Enables peer banning. This should ONLY be enabled once certain peer scoring is working correctly. [$OP_NODE_P2P_PEER_BANNING]
   --p2p.ban.threshold value                   The minimum score below which peers are disconnected and banned. (default: -100) [$OP_NODE_P2P_PEER_BANNING_THRESHOLD]
   --p2p.ban.duration value                    The duration that peers are banned for. (default: 1h0m0s) [$OP_NODE_P2P_PEER_BANNING_DURATION]
   --p2p.listen.ip value                       IP to bind LibP2P and Discv5 to (default: "0.0.0.0") [$OP_NODE_P2P_LISTEN_IP]
   --p2p.listen.tcp value                      TCP port to bind LibP2P to. Any available system port if set to 0. (default: 9222) [$OP_NODE_P2P_LISTEN_TCP_PORT]
   --p2p.listen.udp value                      UDP port to bind Discv5 to. Same as TCP port if left 0. (default: 0) [$OP_NODE_P2P_LISTEN_UDP_PORT]
   --p2p.advertise.ip value                    The IP address to advertise in Discv5, put into the ENR of the node. This may also be a hostname / domain name to resolve to an IP. [$OP_NODE_P2P_ADVERTISE_IP]
   --p2p.advertise.tcp value                   The TCP port to advertise in Discv5, put into the ENR of the node. Set to p2p.listen.tcp value if 0. (default: 0) [$OP_NODE_P2P_ADVERTISE_TCP]
   --p2p.advertise.udp value                   The UDP port to advertise in Discv5 as fallback if not determined by Discv5, put into the ENR of the node. Set to p2p.listen.udp value if 0. (default: 0) [$OP_NODE_P2P_ADVERTISE_UDP]
   --p2p.bootnodes value                       Comma-separated base64-format ENR list. Bootnodes to start discovering other node records from. [$OP_NODE_P2P_BOOTNODES]
   --p2p.static value                          Comma-separated multiaddr-format peer list. Static connections to make and maintain, these peers will be regarded as trusted. [$OP_NODE_P2P_STATIC]
   --p2p.peers.lo value                        Low-tide peer count. The node actively searches for new peer connections if below this amount. (default: 20) [$OP_NODE_P2P_PEERS_LO]
   --p2p.peers.hi value                        High-tide peer count. The node starts pruning peer connections slowly after reaching this number. (default: 30) [$OP_NODE_P2P_PEERS_HI]
   --p2p.peers.grace value                     Grace period to keep a newly connected peer around, if it is not misbehaving. (default: 30s) [$OP_NODE_P2P_PEERS_GRACE]
   --p2p.nat                                   Enable NAT traversal with PMP/UPNP devices to learn external IP. [$OP_NODE_P2P_NAT]
   --p2p.peerstore.path value                  Peerstore database location. Persisted peerstores help recover peers after restarts. Set to 'memory' to never persist the peerstore. Peerstore records will be pruned / expire as necessary. Warning: a copy of the priv network key of the local peer will be persisted here. (default: "opnode_peerstore_db") [$OP_NODE_P2P_PEERSTORE_PATH]
   --p2p.discovery.path value                  Discovered ENRs are persisted in a database to recover from a restart without having to bootstrap the discovery process again. Set to 'memory' to never persist the peerstore. (default: "opnode_discovery_db") [$OP_NODE_P2P_DISCOVERY_PATH]
   --p2p.sequencer.key value                   Hex-encoded private key for signing off on p2p application messages as sequencer. [$OP_NODE_P2P_SEQUENCER_KEY]
   --p2p.sync.req-resp                         Enables experimental P2P req-resp alternative sync method, on both server and client side. [$OP_NODE_P2P_SYNC_REQ_RESP]
   --log.level value                           The lowest log level that will be output (default: "info") [$OP_NODE_LOG_LEVEL]
   --log.format value                          Format the log output. Supported formats: 'text', 'terminal', 'logfmt', 'json', 'json-pretty', (default: "text") [$OP_NODE_LOG_FORMAT]
   --log.color                                 Color the log output if in terminal mode [$OP_NODE_LOG_COLOR]
   --help, -h                                  show help
   --version, -v                               print the version
```
