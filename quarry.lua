os.loadAPI("inv")
os.loadAPI("t")
os.loadAPI("u")

local arg = { ... }


local x = 0
local y = 0
local z = 0
local max = 10


if #arg > 0 then
	max = tonumber(arg[1])
else
	io.write("Quarry Size? ")
	max = tonumber(io.read())
end
if #arg > 1 then
	x = tonumber(arg[2])
	y = tonumber(arg[3])
	z = tonumber(arg[4])
end

local deep = 80
local facingfw = true

local OK = 0
local ERROR = 1
local LAYERCOMPLETE = 2
local OUTOFFUEL = 3
local FULLINV = 4
local BLOCKEDMOV = 5
local USRINTERRUPT = 6

local CHARCOALONLY = false
local USEMODEM = true


-- Arguments
local tArgs = {...}
for i=1,#tArgs do
	local arg = tArgs[i]
	if string.find(arg, "-") == 1 then
		for c=2,string.len(arg) do
			local ch = string.sub(arg,c,c)
			if ch == 'c' then
				CHARCOALONLY = true
			elseif ch == 'm' then
				USEMODEM = true
			else
				write("Invalid flag '")
				write(ch)
				print("'")
			end
		end
	end
end



function out(s)

	s2 = s .. " @ [" .. x .. ", " .. y .. ", " .. z .. "]"
			
	print(s2)
	if USEMODEM then
		rednet.broadcast(s2, "miningTurtle")
	end  
end

function dropInChest()
	out("dropInChest")
	turtle.turnLeft()
	
	local success, data = turtle.inspect()
	
	if success then
		--out(data.name)
		-- if data.name == "minecraft:chest" then
		if string.find(data.name,"chest") then--use any chest
		
			out("Dropping items in chest")
			
			for i=1, 16 do
				turtle.select(i)
				
				data = turtle.getItemDetail()
				
				if data ~= nil and
						data.name ~= "minecraft:lava_bucket" and
						data.name ~= "kibe:entangled_chest" and
						data.name ~= "minecraft:coal"
						 then

					turtle.drop()
				end
			end
		else
			out("Couldnt find chest?")
			out(data.name)
		end
	else
		out("Nothing detected")
	end
	
	turtle.turnRight()
	
end

function goDown()
	while true do
		if turtle.getFuelLevel() <= fuelNeededToGoBack() then
			-- t.refuelAll()
			t.refuelFromSlot2()
		end
	
		if not turtle.down() then
			turtle.up()
			z = z+1
			return
		end
		z = z-1
		--  saveLayerHeight(z)
	end
end

function fuelNeededToGoBack()
	return -z + x + y + 2
end

function moveH()
	if inv.isInventoryFull() then
		out("Dropping thrash")
		-- inv.dropThrash()
		-- inv.trashcanThrash()
		inv.dropOffItems()
		-- if inv.isInventoryFull() then
		-- 	out ("Stacking items")
		-- 	inv.stackItems()
		-- end
		
		-- if inv.isInventoryFull() then
		-- 	out("Full inventory!")
		-- 	return FULLINV  
		-- end
	end
	
	if turtle.getFuelLevel() <= fuelNeededToGoBack() then
		-- t.refuelAll()
		t.refuelFromSlot2()
		-- if not refuelFromEnderChest() then
		-- 	out("Out of fuel!")
		-- 	return OUTOFFUEL
		-- end
	end
	
	if facingfw and y<max-1 then
	-- Going one way
		local dugFw = t.dig()
		if dugFw == false then
			out("Hit bedrock, can't keep going")
			return BLOCKEDMOV
		end
		t.digUp()
		t.digDown()
	
		if t.fw() == false then
			return BLOCKEDMOV
		end
		
		y = y+1
	
	elseif not facingfw and y>0 then
	-- Going the other way
		t.dig()
		t.digUp()
		t.digDown()
		
		if t.fw() == false then
			return BLOCKEDMOV
		end
		
		y = y-1
		
	else
		if x+1 >= max then
			t.digUp()
			t.digDown()
			return LAYERCOMPLETE -- Done with this Y level
		end
		
		-- If not done, turn around
		if facingfw then
			turtle.turnRight()
		else
			turtle.turnLeft()
		end
		
		t.dig()
		t.digUp()
		t.digDown()
		
		if t.fw() == false then
			return BLOCKEDMOV
		end
		
		x = x+1
		
		if facingfw then
			turtle.turnRight()
		else
			turtle.turnLeft()
		end
		
		facingfw = not facingfw
	end
	
	return OK
end

function digLayer()
	
	local errorcode = OK

	while errorcode == OK do
		if USEMODEM then
			local msg = rednet.receive(1)
			if msg ~= nil and string.find(msg, "return") ~= nil then
				return USRINTERRUPT
			end
		end
		errorcode = moveH()
	end
	
	if errorcode == LAYERCOMPLETE then
		return OK
	end
	
	return errorcode  
end

function goToOrigin()
	out("goToOrigin")
	if facingfw then
		
		turtle.turnLeft()
		
		t.fw(x)
		
		turtle.turnLeft()
		
		t.fw(y)
		
		turtle.turnRight()
		turtle.turnRight()
		
	else
		
		turtle.turnRight()
		
		t.fw(x)
		
		turtle.turnLeft()
		
		t.fw(y)
		
		turtle.turnRight()
		turtle.turnRight()
		
	end
	
	x = 0
	y = 0
	facingfw = true
	
end

function goUp()

	while z < 0 do
		t.up()
		z = z+1
	end
	goToOrigin()
end

function mainloop()

	while true do

		local errorcode = digLayer()
	
		if errorcode ~= OK then
			goUp()
			return errorcode
		end
		
		goToOrigin()
		
		for i=1, 3 do
			t.digDown()
			success = t.down()
		
			if not success then
				goUp()
				return BLOCKEDMOV
			end

			z = z-1
			out("Z: " .. z)

		end
	end
end

if USEMODEM then
	u.OpenModem()
end

out("\n\n\n-- WELCOME TO THE MINING TURTLE --\n\n")
local fuel = turtle.getFuelLevel()
if fuel < 100 then
    -- t.refuelAll()
    t.refuelFromSlot2()
end

while true do

	goDown()

	local errorcode = mainloop()
	inv.dropOffItems()
	
	if errorcode ~= FULLINV then
		break
	end
end

if USEMODEM then
	u.CloseModem()
end
