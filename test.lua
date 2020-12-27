os.loadAPI("u")
os.loadAPI("t")
--local arg = { ... }
--North = z-
--East =  x+
--South = z+
--West =  x-

local  PATH = "quarryConfig"
local x, y, z = t.getPosition()
local dir = t.getDirection()
print("testing")
print(x,y,z, dir)
u.SaveStartPoint(x,y,z, dir)
print("reading files" )
local has,a,b,c,d = u.GetStartPoint()
print(a,b,c,d)
u.RemoveStartPoint()

print("target",-955,66,-799)
t.goTo(-955,66,-799)