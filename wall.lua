os.loadAPI("u")
os.loadAPI("t")
local containeraslot = 16

local x,y,z = t.GetPosition()
local dir = t.GetDirection()
print(x,y,z,dir)
u.SaveStartPoint(x,y,z,dir)


io.write("Length? ")
local Length = 16
Length = tonumber(io.read())
io.write("Blocks Up? ")
local Up = 16
Up = tonumber(io.read())
io.write("Blocks Down? ")
local Down = 16
Down = tonumber(io.read())



function Mainloop()

end



