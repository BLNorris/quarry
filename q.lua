os.loadAPI("u")
os.loadAPI("t")

local has,a,b,c,d = u.GetStartPoint()
if has then
    print("going to ",a,b,c)
 t.goTo(a,b,c)
 t.faceDirection("n")
 shell.run("quarry",32)
end
