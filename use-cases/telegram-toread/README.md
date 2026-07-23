# Telegram "to read" sweep

Send every new note tagged `to read` to yourself on Telegram, one message per
note, using the CLI's poll/ack cursor so each note is delivered exactly once.
Notes with replies arrive as a bullet list (the note first, then each reply).

## How it works

[`prism-toread-telegram`](prism-toread-telegram) does one sweep per run:

1. `prism list --tag "to read" --since <date> --new-for <cursor>` — every
   matching note the cursor hasn't seen yet.
2. For each note, `prism get <uuid>` fetches the full thread and formats it.
3. Sends it via the Telegram Bot API.
4. `prism ack <cursor> --notes <uuid>` — only after Telegram confirms the
   send, so a failed send is retried on the next run instead of lost.

## Setup

### 1. Create a Telegram bot

1. Message [@BotFather](https://t.me/BotFather) (verified account) and send
   `/newbot`; follow the prompts and copy the bot token.
2. Open a **regular** chat with your new bot and hit **Start** (bots can't do
   secret chats — a secret chat will just error).
3. Get your chat id:

   ```sh
   curl -s "https://api.telegram.org/bot<TOKEN>/getUpdates" | jq '.result[0].message.chat.id'
   ```

### 2. Store credentials

```sh
mkdir -p ~/.config/prism-telegram
cat > ~/.config/prism-telegram/env <<'EOF'
TELEGRAM_BOT_TOKEN=123456:ABC...
TELEGRAM_CHAT_ID=123456789
EOF
chmod 600 ~/.config/prism-telegram/env
```

### 3. Install the script

```sh
cp prism-toread-telegram ~/.local/bin/
chmod +x ~/.local/bin/prism-toread-telegram
prism-toread-telegram   # test run
```

Optional overrides via environment variables: `PRISM_TAG` (default
`to read`), `PRISM_SINCE` (only sweep notes created on/after this date),
`PRISM_CURSOR` (cursor name, default `telegram-sweep`).

## Scheduling

Any scheduler works — the cursor makes runs idempotent, so cadence is purely
about how fresh you want the messages.

- **Claude Code / Claude Desktop routine**: ask Claude to create a scheduled
  task that runs the script daily. Runs fire while the app is open (missed
  runs execute on next launch — fine here, since the cursor picks up where
  it left off).
- **cron / launchd**: `0 0 * * * ~/.local/bin/prism-toread-telegram` for a
  midnight sweep.

On macOS, the first run prompts "would like to access data from other apps"
(the CLI reads the Prism app's store) — click **Allow** once for whatever is
running the script (e.g. your terminal, or the `claude` helper).

## Reset

To re-send everything (e.g. after testing): `prism cursor reset telegram-sweep`.
