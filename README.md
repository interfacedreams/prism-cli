# Prism CLI

The CLI for the [Prism](https://prism.you) notes app. A Swift CLI to create, read, tag, and reply to your notes from the terminal — and wire Prism into scripts, scheduled jobs, and Claude Code.

## Install

```sh
brew install interfacedreams/tap/prism
```

## Usage

```sh
prism list --tag "to read" --has-url --format jsonl   # query notes
prism create --content "a thought" --tag inbox         # create
prism reply <uuid> --bot --content "…"                 # reply (🤖-prefixed)
prism list --tag inbox --new-for daily && prism ack daily --all-shown   # cursor: consume once
prism --help
```

Notes live in the same on-device store as the app and sync via your iCloud like everything else in Prism.

Building automations or agent workflows? The **[agent usage guide](AGENTS.md)** is the full reference — every command, the output contract, and the poll/ack cursor pattern for "do X whenever a new note appears" jobs (pipe to `curl` for Telegram/Signal, or hand each note to `claude -p`).
