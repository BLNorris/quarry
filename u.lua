local  PATH
function refuel()
	out("refuel")
	for i=1, 16 do
		-- Only run on Charcoal
		turtle.select(i)
		
		item = turtle.getItemDetail()
		if item and
				item.name == "minecraft:coal" and
				(CHARCOALONLY == false or item.damage == 1) and
				turtle.refuel(64) then
			return true
		end
	end
	
	return false
end

function refuelAll()
	out("refuelAll")
	for i=1, 16 do
		-- Only run on Charcoal
		turtle.select(i)
		
		item = turtle.getItemDetail()
		if item then
			turtle.refuel()
		end
	end
	
	return true
end

function saveLayerHeight(layer)
    local oldLayer = 64
    makeDir(PATH)
    if fs.exists(fs.combine(path, "LAYER"))
    then
        oldfile = fs.open(fs.combine(path, "LAYER"), r)
        ols = oldfile.readLine(false)
        oldLayer = tonumber(ols)
    end
    if(oldLayer > layer)
    then
        file = fs.open(fs.combine(path, "LAYER"),"w")
        file.write(layer)
    end
end
    
function openModem()
    local modemside = "right"
    perfs = peripheral.getNames()
    for i=1,#perfs do
        local type = peripheral.getType(perfs[i])
        if type == "modem"
        then
            modemside = perfs[i]
        end
    end
    rednet.open(modemside)
end
function closeModem()
    local modemside = "right"
    perfs = peripheral.getNames()
    for i=1,#perfs do
        local type = peripheral.getType(perfs[i])
        if type == "modem"
        then
            modemside = perfs[i]
        end
    end
    rednet.close(modemside)
end

