local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP", "xmq_vabenskab")
vRPclient = Tunnel.getInterface("vRP", "xmq_vabenskab")

HT = nil

TriggerEvent('HT_base:getBaseObjects', function(obj) HT = obj end)


HT.RegisterServerCallback('vabenskab:tjekperm', function(source, cb)
    local user_id = vRP.getUserId({source})
    if vRP.hasPermission({user_id,"police.service"}) then
        cb(true)
    end
end)
