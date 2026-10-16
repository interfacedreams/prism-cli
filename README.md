# Prism CLI

> [!WARNING]
> **Deprecated:** The standalone Prism CLI is being replaced by CLI and AI integrations built into [Prism for Mac](https://prism.you).
>
> In Prism for Mac, open **Settings → AI → Setup instructions…** to connect your AI assistant and access the bundled CLI. If you don't see this yet, it will be available in an app update in the next few days.

The CLI for the [Prism](https://prism.you) notes app. A Swift CLI to create, read, tag, and reply to your notes from the terminal — and wire Prism into scripts, scheduled jobs, and Claude Code.

## Install

```sh
brew tap interfacedreams/tap https://github.com/interfacedreams/prism-cli
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

## AI rule metadata

CLI 1.0.5 matches the app's updated shared-store schema. Notes expose
`aiRuleStatus`; `prism collections` exposes `aiRuleInstruction` and `aiRuleAction`.
For example, `prism list --fields uuid,content,aiRuleStatus` reports saved rule
outcomes. Rule execution remains in the app.
