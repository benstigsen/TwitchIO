/// @argument str Message to send

var message = format("PRIVMSG #{} :{}", global.channel, argument0);
//console_log(argument0);

var send_buff = buffer_create(8 + string_length(message), buffer_fixed, 1);
buffer_seek(send_buff, buffer_seek_start,0);
buffer_write(send_buff, buffer_text, format("{}{}{}", message, chr(13), chr(10)));
network_send_raw(global.socket, send_buff, buffer_tell(send_buff));
buffer_delete(send_buff);

console_log("Message sent!")