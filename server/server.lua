local Inventory = exports.vorp_inventory:vorp_inventoryApi()
local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterNetEvent('herb:giveHarvestItems')
AddEventHandler("herb:giveHarvestItems", function(itemName, itemCount)
    local _source = source
    local canCarry = Inventory.canCarryItem(_source, itemName, itemCount)
    local iteminfo = Inventory.getDBItem(_source, itemName)
    if canCarry then
        Inventory.addItem(_source, itemName, itemCount)
        TriggerClientEvent("vorp:TipBottom", _source, "You have collected "..itemCount.." "..iteminfo.label, 4000)
    else
        TriggerClientEvent("vorp:TipBottom", _source, "Not enought space for this item.", 4000)
    end
end)
