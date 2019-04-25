var net_buff = ds_map_find_value(async_load, "buffer");
var net_size = buffer_get_size(net_buff);
buffer_seek(net_buff, buffer_seek_start, 0);

var data_list = ds_list_create();

while(buffer_tell(net_buff) < buffer_get_size(net_buff))
{
	var line = buffer_read(net_buff, buffer_string); // Messages
	ds_list_add(data_list, line);
}

for(var i = 0; i < ds_list_size(data_list); i++;)
{
	var line = ds_list_find_value(data_list, i);
	
	twitch_handle_data(line);
}

ds_list_destroy(data_list);