os.loadAPI("inv")
os.loadAPI("tz")
os.loadAPI("t")
os.loadAPI("u")

function mainloop()

        for i=1, 16 do
            turtle.select(i)
            item = turtle.getItemDetail()
            if item then
                if item.name == "minecraft:tnt"
                then
                    break
                end
            end
        end
        tz.digDown()
        tz.placeDown()
        redstone.setOutput("bottom", true)
        sleep(.1)
        redstone.setOutput("bottom", false)
        tz.fw()
        tz.fw()
        tz.fw()
        tz.fw()
end


t.refuelAll()

while true do
	local errorcode = mainloop()
end