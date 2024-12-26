# dtimer

A simple cli timer with optional progress bar.

## Installation

### Manual

Prerequisites:

- A Dlang [compiler](https://wiki.dlang.org/Compilers)
- [dub](https://code.dlang.org/packages/dub)

```bash
git clone https://github.com/jakelyz/dtimer.git
cd dtimer
dub build -b release
```

## Usage

```bash
usage: dtimer [options]
-v        --version           version
-d       --duration Required: duration, ex: 30s, 1m, 5m30s, etc
-n           --name           name of the timer
-p       --progress           display progress bar
-w          --width           progress bar width. defaults to 10
-f      --fill-char           character to represent the "filled" portion of the progress bar. defaults to "-"
-e     --empty-char           character to represent the "empty" portion of the progress bar. defaults to whitespace
-a --bar-start-char           character that represents the start of the progress bar. defaults to "["
-z   --bar-end-char           character that represents the end of the progress bar. defaults to "]"
-h           --help           This help information
```
