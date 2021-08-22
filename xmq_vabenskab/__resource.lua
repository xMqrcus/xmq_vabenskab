dependency "vrp"

client_scripts {
	"lib/Proxy.lua",
    "lib/Tunnel.lua",
    'client.lua'
}

server_scripts {
    'lib/Proxy.lua',
    "@vrp/lib/utils.lua",
    'server.lua'
}

