os.loadAPI("u")
os.loadAPI("t")
shell.run("z")
local fuel = turtle.getFuelLevel()
print("fuel level: ",fuel )
print("Waiting for a bit in case")
os.sleep(3)
local x,y,z = gps.locate(5)
local count = 1
while x == nil do
    print("Trying to get gps fix. count=",count)
    os.sleep(5)
    x,y,z = gps.locate(5)
    count = count + 1
    if count > 10 then
        print("Could not get gps fix")
       os.exit() 
    end
end

local has,a,b,c,d = u.GetStartPoint()
if has then
--  print("going to ",a,b,c)
--  t.goTo(a,b,c)
--  t.faceDirection("n")
--  shell.run("quarry",32)

local x1 = x-a
local y1 = y-b
local z1 = z-c

print("home should be " ,x1,y1,z1)

shell.run("quarry",10,x1,y1,z1)

end
