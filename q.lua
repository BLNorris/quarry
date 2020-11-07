os.loadAPI("u")
os.loadAPI("t")

local has,a,b,c,d = u.GetStartPoint()
if has then
 t.goTo(a,b,c)
 t.faceDirection("n")
end
shell.run("quarry",32)