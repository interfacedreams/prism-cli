# Prism CLI

`prism` — command-line access to your [Prism](https://prism.you) notes. Create, read, tag, and reply to notes from the terminal, and wire Prism into scripts, scheduled jobs, and Claude Code.

Built for the handful of power users who want programmatic access. Everyone else can ignore it.

## Requirements

- macOS
- The **Prism Mac app installed** — the CLI reads Prism's on-device store directly (nothing is uploaded anywhere; it talks to the same local database the app uses, `group.com.prism.shared`). No account, no network.

## Install

### Homebrew (recommended)

```sh
brew install interfacedreams/tap/prism
```

### Direct download

1. Grab `prism-cli-<version>-macos-universal.tar.gz` from [Releases](https://github.com/interfacedreams/prism-cli/releases).
2. Unpack and put it on your PATH:
   ```sh
   tar -xzf prism-cli-*-macos-universal.tar.gz
   sudo mkdir -p /usr/local/bin && sudo mv prism /usr/local/bin/prism
   ```

The binary is signed with a Developer ID and notarized, so Gatekeeper won't block it.

## Usage

```sh
prism list --tag "to read" --has-url --format jsonl   # query notes
prism create --content "a thought" --tag inbox         # create
prism reply <uuid> --bot --content "…"                 # reply (🤖-prefixed)
prism list --tag inbox --new-for daily && prism ack daily --all-shown   # cursor: consume once
prism --help
```

Notes live in the same store as the app and sync via your iCloud like everything else in Prism.

### Automate it

The `--new-for <cursor>` / `ack` pair is the building block for "do X whenever a new note appears" jobs — pipe it to `curl` (Telegram/Signal), or hand each note to `claude -p`. See the examples in the app's docs.

---

*Closed-source distribution repo — the CLI is built from Prism's private monorepo and published here as signed release binaries. Issues and requests welcome.*
