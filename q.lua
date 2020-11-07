os.loadAPI("u")
os.loadAPI("t")
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
    print("going to ",a,b,c)
 t.goTo(a,b,c)
 t.faceDirection("n")
 shell.run("quarry",32)
end
