// --- IGNORE --- \\
var name	 = argument0;
var response = undefined;
var message  = string_replace(argument1 + " ", chr(13) + chr(10), "");
var command  = string_copy(message, 0, string_pos(" ", message) - 1); // Get the first word

// The command prefix has already been removed at this point, so you don't need to include it
switch (command)
{

	case "ping":
		response = format("pong @{}!", name); // "response = ..." is not required (a response is optional)
		break;
	
	case "hello":
		response = example_command(name); // You can also call scripts
		break;
	
	// Owner commands
	case "disconnect":
		if name == global.channel	// If whoever typed the command is the channel owner
		{
			instance_destroy(oConnection);
		}
		break;
	
	// Default response
	default:
		response = format("@{}, \"{}\" is not a recognized command", name, command);
		break;
}

if response != undefined
{
	twitch_send_response(response);
}