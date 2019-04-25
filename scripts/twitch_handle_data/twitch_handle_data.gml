var line = argument0;

// MESSAGE
if string_pos("PRIVMSG", line) != 0
{
	var name = string_copy(line, string_pos(":", line) + 1, string_pos("!", line) - 2);
	var msg  = string_copy(line, string_pos(":", string_delete(line, string_pos(":", line), 1)) + 2, string_length(line));
	
	// Command
	if string_char_at(msg, 0) == global.prefix
	{
		console_log(format("[Command] {}: {}", name, msg));
		twitch_commands(name, string_replace(msg, "!", ""));	
		
	} else { 
		
		console_log(format("[Message] {}: {}", name, msg)); 
	}
		
	ds_list_insert(global.chat_messages, 0, format("{}: {}", name, msg));
	ds_list_delete(global.chat_messages, global.max_messages);
			
	// :<user>!<user>@<user>.tmi.twitch.tv PRIVMSG #<channel> :This is a sample message
	
} else if string_pos("NOTICE", line) != 0
{
	console_log(format("ERROR: {}", line));
	
}

// Unknown data
else
{
	if line == format("PING :tmi.twitch.tv{}{}", chr(13), chr(10))
	{ twitch_send_raw("PONG :tmi.twitch.tv"); }

	console_log(format("[IRC Data]: {}", line));
}