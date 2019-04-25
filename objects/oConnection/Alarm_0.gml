if !ds_list_empty(global.chat_responses) 
{
	twitch_send_msg(global.chat_responses[| 0]);
	ds_list_delete(global.chat_responses, 0);
}

alarm[0] = room_speed * global.response_timeout;
