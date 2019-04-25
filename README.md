## TwitchIO

TwitchIO can be used to create everything from a simple chatbot to fully interactive games controlled by Twitch chat.

Reworked everything from https://github.com/GameMakerDiscord/GMTwitch

It has been simplified, improved, made more stable and of course made compatible with GameMaker Studio 2.  



**GameMaker Marketplace: [TwitchIO](https://marketplace.yoyogames.com/assets/6829/twitchio)**

---

### Initialization

1) Open script `twitch_config`
2) Replace `global.channel`
3) Replace `global.botname`
4) Replace `global.oauth`

***NOTE:*** **If you don't have an OAUTH token, get it here: [https://twitchapps.com/tmi/](https://twitchapps.com/tmi/) (Make sure you're logged into the bot account when getting the OAUTH token)**

---

### Commands

1) Open script `twitch_commands`
2) Add a case for the command string you want to react to (without prefix!)

***NOTE:*** **You can create, call and destroy objects or scripts for easy command management**

---

### Configuration

To have a bit more customization, variables can be changed in the script `twitch_config`

| Variable                  | Description                                                                                          |
| ------------------------- | ---------------------------------------------------------------------------------------------------- |
| `global.prefix`           | Symbol used at the start of a chat message to trigger a command                                      |
| `global.max_messages`     | Max amount of messages to store in a global DS list `global.chat_messages`                           |
| `global.max_responses`    | Max amount of chat responses to queue up in a global DS list `global.chat_responses` to send in chat |
| `global.response_timeout` | Seconds between each response, this is to avoid global ban from the bot responding too quickly       |
