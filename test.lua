os.loadAPI("u")
os.loadAPI("t")
--North = z-
--East =  x+
--South = z+
--West =  x-

local  PATH = "quarryConfig"
local x, y, z = gps.locate(5)


local dir = t.getDirection()

print("testing")
print(x,y,z, dir)
t.SaveStartPoint(x,y,z, dir)
print("reading files" )
local a,b,c,d = t.GetStartPoint()
print(a,b,c,d)