twitch_config();

// ----
global.commands = ds_map_create();
global.socket = -1;

global.channel = string_lower(string_replace_all(global.channel, "#", ""));
global.oauth   = string_lower(global.oauth);

global.chat_messages  = ds_list_create();
global.chat_responses = ds_list_create();
// ----

twitch_chat_connect();