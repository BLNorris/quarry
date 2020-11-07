os.loadAPI("t")
local  PATH = "quarryConfig"
--North = z-
--East =  x+
--South = z+
--West =  x-


function getDirection()
    local x,y,z = gps.locate(5)
    t.fw()
    local x1,y1,z1 = gps.locate(5)
    if z1<z then return "n"
    elseif z1>z then return "s"
    elseif x1>x then return "e"
    elseif x1<x then return "w"
    end

end

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

function SaveStartPoint(x,y,z)
    fs.makeDir(PATH)
    local filex = fs.open(fs.combine(PATH, "startX"),"w")
    filex.write(x)
    filex.close()
    local filey = fs.open(fs.combine(PATH, "startY"),"w")
    filey.write(y)
    filey.close()
    local filez = fs.open(fs.combine(PATH, "startZ"),"w")
    filez.write(z)
    filez.close()
end

function GetStartPoint()
    if fs.exists(fs.combine(PATH, "startX"))
    then
        local oldX = fs.open(fs.combine(PATH, "startX"), "r")
        local x = tonumber(oldX.readLine(false))
        oldX.close()

        local oldY = fs.open(fs.combine(PATH, "startY"), "r")
        local y = tonumber(oldY.readLine(false))
        oldY.close()
        
        
        local oldZ = fs.open(fs.combine(PATH, "startZ"), "r")
        local z = tonumber(oldZ.readLine(false))
        oldZ.close()
        return x,y,z
    end
    return false
end

function RemoveStartPoint()
    if fs.exists(fs.combine(PATH, "startX"))
    then
        fs.delete(fs.combine(PATH, "startX"))
        fs.delete(fs.combine(PATH, "startY"))
        fs.delete(fs.combine(PATH, "startZ"))
        return true
    end
    return false
end

function GetPosition()
    x, y, z = gps.locate(5)
    return x,y,z
end