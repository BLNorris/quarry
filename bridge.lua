os.loadAPI("inv")
os.loadAPI("tz")
os.loadAPI("u")


local max = 100
max = tonumber(arg[1])

function refuelAll()
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
        tz.fw()
        tz.digUp()
        tz.right()
        tz.place()
        tz.turnAround()
        tz.place()
        tz.right()
        tz.placeDown()

	end
end








refuelAll()

while true do
	local errorcode = mainloop()
end