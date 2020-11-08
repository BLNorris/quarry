print("refuelAll exept lava")
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