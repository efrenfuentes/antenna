# Antenna

*Antenna* is a WebRTC signaling server written in Erlang.

**NOTE:** This is a work in progress.

## Setup

### Install

```
$ make deps
$ make app
```

### Run

```
make run
```

By default the websocket port 9000 is used, you can change it via:

1. Changing macro definition on /include/config.hrl

2. Using ANTENNA_PORT environment variable:

   ```
   export ANTENNA_PORT=1234
   make run
   ```

   or

   ```
   ANTENNA_PORT=1234 make run
   ```
