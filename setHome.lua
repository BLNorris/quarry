os.loadAPI("u")
os.loadAPI("t")
local x, y, z = t.getPosition()
local dir = t.getDirection()
print("Setting Home As")
print(x,y,z, dir)
u.SaveStartPoint(x,y,z, dir)