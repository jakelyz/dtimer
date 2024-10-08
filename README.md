# dtimer

A simple cli timer with optional progress bar.

![](docs/examples/dtimer.gif)

## Installation

### Manual

Prerequisites:

- A Dlang [compiler](https://wiki.dlang.org/Compilers)
- [dub](https://code.dlang.org/packages/dub)
- ncurses

```bash
git clone https://github.com/jakelyz/dtimer.git
cd dtimer
dub build -b release
```

## Usage

```bash
usage: dtimer [options]
-v  --version           version
-d --duration Required: duration, ex: 30s, 1m, 5m30s, etc
-n     --name           name of the timer
-p --progress           display progress bar
-h     --help           This help information.
```
