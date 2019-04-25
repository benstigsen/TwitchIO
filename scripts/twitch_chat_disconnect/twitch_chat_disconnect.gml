twitch_send_msg("Disconnecting! BibleThump");
twitch_send_msg("/disconnect");

network_destroy(global.socket);

console_log("Disconnected!");

return (true);