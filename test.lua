os.loadAPI("u")
os.loadAPI("t")
--local arg = { ... }
--North = z-
--East =  x+
--South = z+
--West =  x-

local  PATH = "quarryConfig"
local x, y, z = gps.locate(5)
local dir = t.getDirection()
print("testing")
print(x,y,z, dir)
u.SaveStartPoint(x,y,z, dir)
print("reading files" )
local a,b,c,d = u.GetStartPoint()
print(a,b,c,d)
u.RemoveStartPoint()


t.goTo(-955,66,-799)