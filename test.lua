local  PATH = "quarryConfig"
local x, y, z = gps.locate(5)

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
        local xx = oldX.readLine(false)
        print(xx)
        local x = tonumber(xx)
        print(x)
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
end

print("testing")
print(x,y,z)
SaveStartPoint(x,y,z)
print("reading files" )
local a,b,c = GetStartPoint()
print(a,b,c)