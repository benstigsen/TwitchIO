// Delete old chats
global.chat_messages = ds_list_create();
ds_list_clear(global.chat_messages);

if global.socket == -1
{
    global.socket = network_create_socket(network_socket_tcp);
}
else
{
	console_log("Failed to create new socket, socket already exists!");
    return(-1);
}

// Make sure the socket was successfully created
if global.socket < 0
{
    network_destroy(global.socket);
    global.socket = -1;
    console_log("Failed to create TCP socket");
}
else
{
    console_log("Connecting to socket...");
}

// Get IP address (of Twitch IRC server)
var address = network_resolve("irc.chat.twitch.tv")
console_log(format("Connecting to \"irc.chat.twitch.tv\" ({})...", address));

var success = network_connect_raw(global.socket, "irc.chat.twitch.tv", 6667);
if success < 0
{
	network_destroy(global.socket);
	global.socket = -1;
	console_log(format("Failed to connect to {} (irc.chat.twitch.tv) on port 6667", address));
} 
else
{
	console_log(format("Successfully connected to {} (irc.chat.twitch.tv) on port 6667", address));
}

// Authorize
var send_buff = buffer_create(128, buffer_fixed, 1);
for(var i = 0; i < 3; i++)
{
	if i == 0
	{
		console_log(format("OAUTH: {}***", string_delete(global.oauth, 7, 28)));
		var send_str = format("PASS {}", global.oauth);
	}		
	else if i == 1
	{
		console_log(format("NICK: {}", global.botname));
		var send_str = format("NICK {}", global.botname);
	}
	else
	{
		console_log(format("JOIN: {}", global.channel));
		var send_str = format("JOIN #{}", global.channel);
	}
	
	buffer_seek(send_buff, buffer_seek_start, 0);
	buffer_write(send_buff, buffer_text, string(send_str) + chr(13) + chr(10));
	network_send_raw(global.socket, send_buff, buffer_tell(send_buff));
}

buffer_delete(send_buff);

twitch_send_msg("Connected! PogChamp")