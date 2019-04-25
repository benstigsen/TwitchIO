/// @argument str Message to send
// Here you send raw data directly to the IRC

var send_buff = buffer_create(128, buffer_fixed, 1);
buffer_seek(send_buff, buffer_seek_start, 0);
buffer_write(send_buff, buffer_text, format("{}{}{}", argument0, chr(13), chr(10)));
network_send_raw(global.socket, send_buff, buffer_tell(send_buff));
buffer_delete(send_buff);