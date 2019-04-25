// Add the response to the response queue
ds_list_add(global.chat_responses, argument0);
ds_list_delete(global.chat_responses, global.max_responses - 1);