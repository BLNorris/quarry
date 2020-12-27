os.loadAPI("u")
os.loadAPI("t")
shell.run("z")
local fuel = turtle.getFuelLevel()
if fuel < 100 then
    t.refuelAll()
    t.refuelFromSlot2()
end
fuel = turtle.getFuelLevel()
print("fuel level: ",fuel )
print("Waiting for a bit in case")
os.sleep(3)
local x,y,z = t.getPosition()

local has,a,b,c,d = u.GetStartPoint()
if has then
 print("going to ",a,b,c)
 t.goTo(a,b,c)
 t.faceDirection("n")
 shell.run("quarry",16)

 --trying to get it to resume without having to go home
-- local x1 = math.abs(x-a)
-- local y1 = math.abs(y-b)
-- local z1 = math.abs(z-c)

-- print("home should be " ,x1,y1,z1)

-- shell.run("quarry",10,x1,y1,z1)

end
