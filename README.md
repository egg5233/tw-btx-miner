# tw-btx-miner

A fast CUDA miner for the **BTX** chain (MatMul proof-of-work over GF(2³¹−1)).

This is a ready-to-run binary distribution — download, point it at a pool, and mine.

## Supported GPUs

NVIDIA, Turing through Blackwell, on Linux x86-64:

| Family | Examples |
|--------|----------|
| Turing (sm_75) | GTX 16xx, RTX 20xx |
| Ampere (sm_80/86) | A100, RTX 30xx |
| Ada (sm_89) | RTX 40xx |
| Hopper (sm_90) | H100 / H200 |
| Blackwell (sm_120) | RTX 50xx |

The build ships native code for each of the above plus a forward-compatible PTX
fallback, so newer cards run via driver JIT.

## Requirements

- An NVIDIA driver new enough for your GPU (for RTX 50xx / Blackwell, use a
  CUDA-12.8-class driver or newer). `nvidia-smi` should list your card.
- The bundled `libcudart.so.12` is included; no CUDA toolkit install is needed.

## Quick start

```sh
./run.sh pool <host> <port> <your-payout-address> [worker] [--no-tui]
```

Example:

```sh
./run.sh pool global.btxpool.org 23333 btx1qyourpayoutaddress rig1
```

- `<your-payout-address>` is your own `btx1...` wallet address.
- `[worker]` is an optional rig label (default `rig1`).
- A live terminal dashboard is shown by default; add `--no-tui` for plain
  line output (useful under `nohup`/systemd).

Run without `run.sh` by putting the bundled runtime on the library path:

```sh
LD_LIBRARY_PATH="$PWD:$LD_LIBRARY_PATH" ./btx-miner pool global.btxpool.org 23333 btx1q... rig1
```

`./btx-miner --version` prints the build version.

## Fee

A **1% developer fee** is built in: for 60 seconds out of every 6000 (1%), the
miner mines to the developer's address; the customer mines first each cycle.

## License

MIT — see `LICENSE`.
