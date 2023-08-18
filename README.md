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

# op-node settings
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

# op-geth settings
```
podman run us-docker.pkg.dev/oplabs-tools-artifacts/images/op-geth:v1.101106.0 --help
NAME:
   geth - the go-ethereum command line interface

USAGE:
   geth [global options] command [command options] [arguments...]

VERSION:
   0.1.0-unstable-b5fecf58

COMMANDS:
   account                Manage accounts
   attach                 Start an interactive JavaScript environment (connect to node)
   console                Start an interactive JavaScript environment
   db                     Low level database operations
   dump                   Dump a specific block from storage
   dumpconfig             Export configuration values in a TOML format
   dumpgenesis            Dumps genesis block JSON configuration to stdout
   export                 Export blockchain into file
   export-preimages       Export the preimage database into an RLP stream
   import                 Import a blockchain file
   import-preimages       Import the preimage database from an RLP stream
   init                   Bootstrap and initialize a new genesis block
   js                     (DEPRECATED) Execute the specified JavaScript files
   license                Display license information
   makecache              Generate ethash verification cache (for testing)
   makedag                Generate ethash mining DAG (for testing)
   removedb               Remove blockchain and state databases
   show-deprecated-flags  Show flags that have been deprecated
   snapshot               A set of commands based on the snapshot
   verkle                 A set of experimental verkle tree management commands
   version                Print version numbers
   version-check          Checks (online) for known Geth security vulnerabilities
   wallet                 Manage Ethereum presale wallets
   help, h                Shows a list of commands or help for one command

GLOBAL OPTIONS:

    --log.rotate                   (default: false)
          Enables log file rotation

   ACCOUNT

    --allow-insecure-unlock        (default: false)
          Allow insecure account unlocking when account-related RPCs are exposed by http

    --keystore value
          Directory for the keystore (default = inside the datadir)

    --lightkdf                     (default: false)
          Reduce key-derivation RAM & CPU usage at some expense of KDF strength

    --password value
          Password file to use for non-interactive password input

    --pcscdpath value              (default: "/run/pcscd/pcscd.comm")
          Path to the smartcard daemon (pcscd) socket file

    --signer value
          External signer (url or path to ipc file)

    --unlock value
          Comma separated list of accounts to unlock

    --usb                          (default: false)
          Enable monitoring and management of USB hardware wallets

   ALIASED (deprecated)

    --nousb                        (default: false)
          Disables monitoring for and managing USB hardware wallets (deprecated)

    --whitelist value
          Comma separated block number-to-hash mappings to enforce (<number>=<hash>)
          (deprecated in favor of --eth.requiredblocks)

   API AND CONSOLE

    --authrpc.addr value           (default: "localhost")
          Listening address for authenticated APIs

    --authrpc.jwtsecret value
          Path to a JWT secret to use for authenticated RPC endpoints

    --authrpc.port value           (default: 8551)
          Listening port for authenticated APIs

    --authrpc.vhosts value         (default: "localhost")
          Comma separated list of virtual hostnames from which to accept requests (server
          enforced). Accepts '*' wildcard.

    --exec value
          Execute JavaScript statement

    --graphql                      (default: false)
          Enable GraphQL on the HTTP-RPC server. Note that GraphQL can only be started if
          an HTTP server is started as well.

    --graphql.corsdomain value
          Comma separated list of domains from which to accept cross origin requests
          (browser enforced)

    --graphql.vhosts value         (default: "localhost")
          Comma separated list of virtual hostnames from which to accept requests (server
          enforced). Accepts '*' wildcard.

    --header value, -H value
          Pass custom headers to the RPC server when using --remotedb or the geth attach
          console. This flag can be given multiple times.

    --http                         (default: false)
          Enable the HTTP-RPC server

    --http.addr value              (default: "localhost")
          HTTP-RPC server listening interface

    --http.api value
          API's offered over the HTTP-RPC interface

    --http.corsdomain value
          Comma separated list of domains from which to accept cross origin requests
          (browser enforced)

    --http.port value              (default: 8545)
          HTTP-RPC server listening port

    --http.rpcprefix value
          HTTP path path prefix on which JSON-RPC is served. Use '/' to serve on all
          paths.

    --http.vhosts value            (default: "localhost")
          Comma separated list of virtual hostnames from which to accept requests (server
          enforced). Accepts '*' wildcard.

    --ipcdisable                   (default: false)
          Disable the IPC-RPC server

    --ipcpath value
          Filename for IPC socket/pipe within the datadir (explicit paths escape it)

    --jspath value                 (default: .)
          JavaScript root path for `loadScript`

    --preload value
          Comma separated list of JavaScript files to preload into the console

    --rpc.allow-unprotected-txs    (default: false)
          Allow for unprotected (non EIP155 signed) transactions to be submitted via RPC

    --rpc.enabledeprecatedpersonal (default: false)
          Enables the (deprecated) personal namespace

    --rpc.evmtimeout value         (default: 5s)
          Sets a timeout used for eth_call (0=infinite)

    --rpc.gascap value             (default: 50000000)
          Sets a cap on gas that can be used in eth_call/estimateGas (0=infinite)

    --rpc.txfeecap value           (default: 1)
          Sets a cap on transaction fee (in ether) that can be sent via the RPC APIs (0 =
          no cap)

    --ws                           (default: false)
          Enable the WS-RPC server

    --ws.addr value                (default: "localhost")
          WS-RPC server listening interface

    --ws.api value
          API's offered over the WS-RPC interface

    --ws.origins value
          Origins from which to accept websockets requests

    --ws.port value                (default: 8546)
          WS-RPC server listening port

    --ws.rpcprefix value
          HTTP path prefix on which JSON-RPC is served. Use '/' to serve on all paths.

   DEVELOPER CHAIN

    --dev                          (default: false)
          Ephemeral proof-of-authority network with a pre-funded developer account, mining
          enabled

    --dev.gaslimit value           (default: 11500000)
          Initial block gas limit

    --dev.period value             (default: 0)
          Block period to use in developer mode (0 = mine only if transaction pending)

   ETHASH

    --ethash.cachedir value
          Directory to store the ethash verification caches (default = inside the datadir)

    --ethash.cachesinmem value     (default: 2)
          Number of recent ethash caches to keep in memory (16MB each)

    --ethash.cacheslockmmap        (default: false)
          Lock memory maps of recent ethash caches

    --ethash.cachesondisk value    (default: 3)
          Number of recent ethash caches to keep on disk (16MB each)

    --ethash.dagdir value          (default: /root/.ethash)
          Directory to store the ethash mining DAGs

    --ethash.dagsinmem value       (default: 1)
          Number of recent ethash mining DAGs to keep in memory (1+GB each)

    --ethash.dagslockmmap          (default: false)
          Lock memory maps for recent ethash mining DAGs

    --ethash.dagsondisk value      (default: 2)
          Number of recent ethash mining DAGs to keep on disk (1+GB each)

   ETHEREUM

    --bloomfilter.size value       (default: 2048)
          Megabytes of memory allocated to bloom-filter for pruning

    --config value
          TOML configuration file

    --datadir value                (default: /root/.ethereum)
          Data directory for the databases and keystore

    --datadir.ancient value
          Root directory for ancient data (default = inside chaindata)

    --datadir.minfreedisk value
          Minimum free disk space in MB, once reached triggers auto shut down (default =
          --cache.gc converted to MB, 0 = disabled)

    --db.engine value              (default: "leveldb")
          Backing database implementation to use ('leveldb' or 'pebble')

    --eth.requiredblocks value
          Comma separated block number-to-hash mappings to require for peering
          (<number>=<hash>)

    --exitwhensynced               (default: false)
          Exits after block synchronisation completes

    --gcmode value                 (default: "full")
          Blockchain garbage collection mode ("full", "archive")

    --goerli                       (default: false)
          Görli network: pre-configured proof-of-authority test network

    --mainnet                      (default: false)
          Ethereum mainnet

    --networkid value              (default: 1)
          Explicitly set network id (integer)(For testnets: use --rinkeby, --goerli,
          --sepolia instead)

    --override.bedrock value       (default: 0)
          Manually specify OptimsimBedrock, overriding the bundled setting

    --override.optimism            (default: false)
          Manually specify optimism

    --override.regolith value      (default: 0)
          Manually specify the OptimsimRegolith fork timestamp, overriding the bundled
          setting

    --override.shanghai value      (default: 0)
          Manually specify the Shanghai fork timestamp, overriding the bundled setting

    --rinkeby                      (default: false)
          Rinkeby network: pre-configured proof-of-authority test network

    --sepolia                      (default: false)
          Sepolia network: pre-configured proof-of-work test network

    --snapshot                     (default: true)
          Enables snapshot-database mode (default = enable)

    --syncmode value               (default: snap)
          Blockchain sync mode ("snap", "full" or "light")

    --txlookuplimit value          (default: 2350000)
          Number of recent blocks to maintain transactions index for (default = about one
          year, 0 = entire chain)

   GAS PRICE ORACLE

    --gpo.blocks value             (default: 20)
          Number of recent blocks to check for gas prices

    --gpo.ignoreprice value        (default: 2)
          Gas price below which gpo will ignore transactions

    --gpo.maxprice value           (default: 500000000000)
          Maximum transaction priority fee (or gasprice before London fork) to be
          recommended by gpo

    --gpo.percentile value         (default: 60)
          Suggested gas price is the given percentile of a set of recent transaction gas
          prices

   LIGHT CLIENT

    --light.egress value           (default: 0)
          Outgoing bandwidth limit for serving light clients (kilobytes/sec, 0 =
          unlimited)

    --light.ingress value          (default: 0)
          Incoming bandwidth limit for serving light clients (kilobytes/sec, 0 =
          unlimited)

    --light.maxpeers value         (default: 100)
          Maximum number of light clients to serve, or light servers to attach to

    --light.nopruning              (default: false)
          Disable ancient light chain data pruning

    --light.nosyncserve            (default: false)
          Enables serving light clients before syncing

    --light.serve value            (default: 0)
          Maximum percentage of time allowed for serving LES requests (multi-threaded
          processing allows values over 100)

    --ulc.fraction value           (default: 75)
          Minimum % of trusted ultra-light servers required to announce a new head

    --ulc.onlyannounce             (default: false)
          Ultra light server sends announcements only

    --ulc.servers value
          List of trusted ultra-light servers

   LOGGING AND DEBUGGING

    --fakepow                      (default: false)
          Disables proof-of-work verification

    --log.backtrace value
          Request a stack trace at a specific logging statement (e.g. "block.go:271")

    --log.compress                 (default: false)
          Compress the log files

    --log.debug                    (default: false)
          Prepends log messages with call-site location (file and line number)

    --log.file value
          Write logs to a file

    --log.format value
          Log format to use (json|logfmt|terminal)

    --log.maxage value             (default: 30)
          Maximum number of days to retain a log file

    --log.maxbackups value         (default: 10)
          Maximum number of log files to retain

    --log.maxsize value            (default: 100)
          Maximum size in MBs of a single log file

    --log.vmodule value
          Per-module verbosity: comma-separated list of <pattern>=<level> (e.g.
          eth/*=5,p2p=4)

    --nocompaction                 (default: false)
          Disables db compaction after import

    --pprof                        (default: false)
          Enable the pprof HTTP server

    --pprof.addr value             (default: "127.0.0.1")
          pprof HTTP server listening interface

    --pprof.blockprofilerate value (default: 0)
          Turn on block profiling with the given rate

    --pprof.cpuprofile value
          Write CPU profile to the given file

    --pprof.memprofilerate value   (default: 524288)
          Turn on memory profiling with the given rate

    --pprof.port value             (default: 6060)
          pprof HTTP server listening port

    --remotedb value
          URL for remote database

    --trace value
          Write execution trace to the given file

    --verbosity value              (default: 3)
          Logging verbosity: 0=silent, 1=error, 2=warn, 3=info, 4=debug, 5=detail

   METRICS AND STATS

    --ethstats value
          Reporting URL of a ethstats service (nodename:secret@host:port)

    --metrics                      (default: false)
          Enable metrics collection and reporting

    --metrics.addr value
          Enable stand-alone metrics HTTP server listening interface.

    --metrics.expensive            (default: false)
          Enable expensive metrics collection and reporting

    --metrics.influxdb             (default: false)
          Enable metrics export/push to an external InfluxDB database

    --metrics.influxdb.bucket value (default: "geth")
          InfluxDB bucket name to push reported metrics to (v2 only)

    --metrics.influxdb.database value (default: "geth")
          InfluxDB database name to push reported metrics to

    --metrics.influxdb.endpoint value (default: "http://localhost:8086")
          InfluxDB API endpoint to report metrics to

    --metrics.influxdb.organization value (default: "geth")
          InfluxDB organization name (v2 only)

    --metrics.influxdb.password value (default: "test")
          Password to authorize access to the database

    --metrics.influxdb.tags value  (default: "host=localhost")
          Comma-separated InfluxDB tags (key/values) attached to all measurements

    --metrics.influxdb.token value (default: "test")
          Token to authorize access to the database (v2 only)

    --metrics.influxdb.username value (default: "test")
          Username to authorize access to the database

    --metrics.influxdbv2           (default: false)
          Enable metrics export/push to an external InfluxDB v2 database

    --metrics.port value           (default: 6060)
          Metrics HTTP server listening port.
          Please note that --metrics.addr must be set
          to start the server.

   MINER

    --mine                         (default: false)
          Enable mining

    --miner.etherbase value
          0x prefixed public address for block mining rewards

    --miner.extradata value
          Block extra data set by the miner (default = client version)

    --miner.gaslimit value         (default: 30000000)
          Target gas ceiling for mined blocks

    --miner.gasprice value         (default: 0)
          Minimum gas price for mining a transaction

    --miner.newpayload-timeout value (default: 2s)
          Specify the maximum time allowance for creating a new payload

    --miner.notify value
          Comma separated HTTP URL list to notify of new work packages

    --miner.notify.full            (default: false)
          Notify with pending block headers instead of work packages

    --miner.noverify               (default: false)
          Disable remote sealing verification

    --miner.recommit value         (default: 2s)
          Time interval to recreate the block being mined

    --miner.threads value          (default: 0)
          Number of CPU threads to use for mining

   MISC

    --help, -h                     (default: false)
          show help

    --synctarget value
          File for containing the hex-encoded block-rlp as sync target(dev feature)

    --version, -v                  (default: false)
          print the version

   NETWORKING

    --bootnodes value
          Comma separated enode URLs for P2P discovery bootstrap

    --discovery.dns value
          Sets DNS discovery entry points (use "" to disable DNS)

    --discovery.port value         (default: 30303)
          Use a custom UDP port for P2P discovery

    --identity value
          Custom node name

    --maxpeers value               (default: 50)
          Maximum number of network peers (network disabled if set to 0)

    --maxpendpeers value           (default: 0)
          Maximum number of pending connection attempts (defaults used if set to 0)

    --nat value                    (default: "any")
          NAT port mapping mechanism (any|none|upnp|pmp|pmp:<IP>|extip:<IP>)

    --netrestrict value
          Restricts network communication to the given IP networks (CIDR masks)

    --nodekey value
          P2P node key file

    --nodekeyhex value
          P2P node key as hex (for testing)

    --nodiscover                   (default: false)
          Disables the peer discovery mechanism (manual peer addition)

    --port value                   (default: 30303)
          Network listening port

    --v5disc                       (default: false)
          Enables the experimental RLPx V5 (Topic Discovery) mechanism

   PERFORMANCE TUNING

    --cache value                  (default: 1024)
          Megabytes of memory allocated to internal caching (default = 4096 mainnet full
          node, 128 light mode)

    --cache.blocklogs value        (default: 32)
          Size (in number of blocks) of the log cache for filtering

    --cache.database value         (default: 50)
          Percentage of cache memory allowance to use for database io

    --cache.gc value               (default: 25)
          Percentage of cache memory allowance to use for trie pruning (default = 25% full
          mode, 0% archive mode)

    --cache.noprefetch             (default: false)
          Disable heuristic state prefetch during block import (less CPU and disk IO, more
          time waiting for data)

    --cache.preimages              (default: false)
          Enable recording the SHA3/keccak preimages of trie keys

    --cache.snapshot value         (default: 10)
          Percentage of cache memory allowance to use for snapshot caching (default = 10%
          full mode, 20% archive mode)

    --cache.trie value             (default: 15)
          Percentage of cache memory allowance to use for trie caching (default = 15% full
          mode, 30% archive mode)

    --cache.trie.journal value     (default: "triecache")
          Disk journal directory for trie cache to survive node restarts

    --cache.trie.rejournal value   (default: 1h0m0s)
          Time interval to regenerate the trie cache journal

    --fdlimit value                (default: 0)
          Raise the open file descriptor resource limit (default = system fd limit)

   ROLLUP NODE

    --rollup.computependingblock   (default: false)
          By default the pending block equals the latest block to save resources and not
          leak txs from the tx-pool, this flag enables computing of the pending block from
          the tx-pool instead.

    --rollup.disabletxpoolgossip   (default: false)
          Disable transaction pool gossip.

    --rollup.historicalrpc value
          RPC endpoint for historical data.

    --rollup.historicalrpctimeout value (default: "5s")
          Timeout for historical RPC requests.

    --rollup.sequencerhttp value
          HTTP endpoint for the sequencer mempool

   TRANSACTION POOL

    --txpool.accountqueue value    (default: 64)
          Maximum number of non-executable transaction slots permitted per account

    --txpool.accountslots value    (default: 16)
          Minimum number of executable transaction slots guaranteed per account

    --txpool.globalqueue value     (default: 1024)
          Maximum number of non-executable transaction slots for all accounts

    --txpool.globalslots value     (default: 5120)
          Maximum number of executable transaction slots for all accounts

    --txpool.journal value         (default: "transactions.rlp")
          Disk journal for local transaction to survive node restarts

    --txpool.journalremotes        (default: false)
          Includes remote transactions in the journal

    --txpool.lifetime value        (default: 3h0m0s)
          Maximum amount of time non-executable transaction are queued

    --txpool.locals value
          Comma separated accounts to treat as locals (no flush, priority inclusion)

    --txpool.nolocals              (default: false)
          Disables price exemptions for locally submitted transactions

    --txpool.pricebump value       (default: 10)
          Price bump percentage to replace an already existing transaction

    --txpool.pricelimit value      (default: 1)
          Minimum gas price limit to enforce for acceptance into the pool

    --txpool.rejournal value       (default: 1h0m0s)
          Time interval to regenerate the local transaction journal

   VIRTUAL MACHINE

    --vmdebug                      (default: false)
          Record information useful for VM and contract debugging


COPYRIGHT:
   Copyright 2013-2023 The go-ethereum Authors
```
