os.loadAPI("inv")
os.loadAPI("t")
os.loadAPI("u")


local max = 100
max = tonumber(arg[1])

function refuelAll()
	out("refuelAll")
	for i=1, 16 do
		-- Only run on Charcoal
		turtle.select(i)
		
		item = turtle.getItemDetail()
		if item then
			if item.name ~= "minecraft:lava_bucket"
			then
			turtle.refuel()
			end
		end
	end
	
	return true
end

function mainloop()

    while true do
        t.fw()
        t.digUp()
        t.right()
        t.place()
        t.turnAround()
        t.place()
        t.right()
        t.placeDown()

	end
end








refuelAll()

while true do
	local errorcode = mainloop()
end