local  PATH = "quarryConfig"
--North = z-
--East =  x+
--South = z+
--West =  x-


function SaveLayerHeight(layer)
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
    
function OpenModem()
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
function CloseModem()
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

function SaveStartPoint(x,y,z,dir)
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
    local filed = fs.open(fs.combine(PATH, "startDir"),"w")
    filed.write(dir)
    filed.close()
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

        local oldDir = fs.open(fs.combine(PATH, "startDir"), "r")
        local dir = oldDir.readLine(false)
        oldDir.close()
        return true,x,y,z,dir
    end
    return false
end

function RemoveStartPoint()
    if fs.exists(fs.combine(PATH, "startX"))
    then
        fs.delete(fs.combine(PATH, "startX"))
        fs.delete(fs.combine(PATH, "startY"))
        fs.delete(fs.combine(PATH, "startZ"))
        fs.delete(fs.combine(PATH, "startDir"))
        return true
    end
    return false
end

function GetPosition()
    x, y, z = gps.locate(5)
    return x,y,z
end