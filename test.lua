local u  = require("u")

--North = z-
--East =  x+
--South = z+
--West =  x-

local  PATH = "quarryConfig"
local x, y, z = gps.locate(5)



print("testing")
print(x,y,z)
u.SaveStartPoint(x,y,z)
print("reading files" )
local a,b,c = u.GetStartPoint()
print(a,b,c)