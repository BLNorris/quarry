local  PATH = "quarryConfig"


function saveLayerHeight(layer)
    local oldLayer = 64
    fs.makeDir(PATH)
    if fs.exists(fs.combine(PATH, "LAYER"))
    then
        oldfile = fs.open(fs.combine(PATH, "LAYER"), r)
        ols = oldfile.readLine(false)
        oldLayer = tonumber(ols)
    end
    if(oldLayer > layer)
    then
        file = fs.open(fs.combine(PATH, "LAYER"),"w")
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

