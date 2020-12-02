os.loadAPI("inv")
os.loadAPI("tz")
os.loadAPI("t")
os.loadAPI("u")

local max = 100
max = tonumber(arg[1])

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


t.refuelAll()

while true do
	local errorcode = mainloop()
end