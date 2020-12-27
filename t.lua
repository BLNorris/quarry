local MAXTRIES = 100
local currentDirection = nil

function turnAround()
	local success = false
	
	success = turtle.turnRight()
	success = success and turtle.turnRight()
	
	return success
end

function right()	
	if currentDirection == "n" then
		currentDirection = "e"
	elseif currentDirection == "e" then
		currentDirection = "s"
	elseif currentDirection == "s" then
		currentDirection = "w"
	elseif currentDirection == "w" then
		currentDirection = "n"
	end
	return turtle.turnRight()
end

function left()
	if currentDirection == "n" then
		currentDirection = "w"
	elseif currentDirection == "e" then
		currentDirection = "n"
	elseif currentDirection == "s" then
		currentDirection = "e"
	elseif currentDirection == "w" then
		currentDirection = "s"
	end
	return turtle.turnLeft()
end

function dig()
	local tries = 0
	
	while turtle.detect() do

		local s, data = turtle.inspect()
		if data.name == "minecraft:bedrock" then
			printError("Hit bedrock forwards!")
			return false
		end
		
		turtle.dig()
		sleep(0.4)
		
		tries = tries+1
		if tries > MAXTRIES then

			printError("Can't dig forward")
			return false
			
		end
	end
	
	return true
end

function digDown()
	local tries = 0
	
	local s, data = turtle.inspectDown()
	if data.name == "minecraft:lava"
	then
		down()
		up()
	end
	-- if data.name == "minecraft:water"
	-- then
	-- 	down()
	-- 	up()
	-- end
	while turtle.detectDown() do

		s, data = turtle.inspectDown()
		if data.name == "minecraft:bedrock" then
			printError("Hit bedrock below!")
			return false
		end
		turtle.digDown()
		sleep(0.4)
		
		tries = tries+1
		if tries > MAXTRIES then
			printError("Can't dig down")
			return false
		end
	end
	
	return true
end

function digUp()
	local tries = 0
	
	local s, data = turtle.inspectUp()
	if data.name == "minecraft:lava"
	then
		up()
		down()
	end
	-- if data.name == "minecraft:water"
	-- then
	-- 	up()
	-- 	down()
	-- end
	while turtle.detectUp() do
		s, data = turtle.inspectUp()
		print(data)
		if data.name == "minecraft:bedrock" then
			printError("Hit bedrock above!")
			return false
		end

	
		turtle.digUp()
		sleep(0.4)
		
		tries = tries+1
		if tries > MAXTRIES then
			printError("Can't dig up")
			return false
		end
	end
	
	return true
end


function fw(l)
	l=l or 1
	
    -- local x,y,z = getPosition()
	for i=1, l do
		local tries = 0
		while turtle.forward() ~= true do
			turtle.dig()
			turtle.attack()
			sleep(0.2)
			
			tries = tries+1
			if tries > MAXTRIES then
				printError("Can't move forward")
				return false
			end
		end
	end
	
    -- local x1,y1,z1 = getPosition()
	-- currentDirection = calcDiretion(x,z,x1,z1)
	return true
end

function up(l)
	l=l or 1
	
	for i=1, l do
	
		local tries = 0
		
		while turtle.up() ~= true do
			
			turtle.digUp()
			turtle.attackUp()
			sleep(0.2)
			
			tries = tries+1
			if tries > MAXTRIES then
				printError("Can't move up")
				return false
			end
		end
	end
	
	return true
end

function down(l)
	l=l or 1
	
	for i=1, l do
	
		local tries = 0
	
		while turtle.down() ~= true do
	
			turtle.digDown()
			turtle.attackDown()
			sleep(0.2)
		
			tries = tries+1
			if tries > MAXTRIES then
				printError("Can't move down")
				return false
			end
		end
	end
	
	return true
end

function back(l)
	l=l or 1
	
	for i=1, l do
	
		if turtle.back() ~= true then
			turnAround()
			fw()
			turnAround()
		end
	end
end

function refuel()
	for i=1, 16 do
		-- Only run on Charcoal
		turtle.select(i)
		
		item = turtle.getItemDetail()
		if item and
				item.name == "minecraft:coal" and
				(CHARCOALONLY == false or item.damage == 1) and
				turtle.refuel(64) then
			return true
		end
	end
	
	return false
end

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

function refuelFromEnderChest()
	for i=1, 16 do
		-- Only run on Charcoal
		turtle.select(i)
		
		item = turtle.getItemDetail()
		if item then
			if item.name == "kibe:entangled_chest"
			then
				digUp()
				back()
				turtle.place()
				turtle.suck(10)
				turtle.refuel()
				turtle.dig()
				fw()
			end
		end
	end

	return true
end

function refuelFromSlot2()
		turtle.select(2)
		digDown()
		turtle.placeDown()
		turtle.suckDown()
		turtle.refuel()
		turtle.digDown()
	return true
end

function getDirection()
	if currentDirection ~= nil
	then return currentDirection
	end
	local x,y,z = getPosition()
	print(" @ [" .. x .. ", " .. y .. ", " .. z .. "]")
	fw()
	local x1,y1,z1 = getPosition()
	print(" @ [" .. x1 .. ", " .. y1 .. ", " .. z1 .. "]")
	local dir = calcDiretion(x,z,x1,z1)
	back()
	return dir
end

function calcDiretion(x,z,x1,z1)
    if z1<z then return "n"
    elseif z1>z then return "s"
    elseif x1>x then return "e"
    elseif x1<x then return "w"
    end
end

function faceDirection(dir)
	local success = false
	local curDir = getDirection()
	if curDir == "n" then
		if dir == "n" then
			success =  true
		elseif dir == "e" then
			success =  right()
		elseif dir == "s" then
			success =  turnAround()
		elseif dir == "w" then
			success =  left()
		end
	elseif curDir == "e" then
		if dir == "n" then
			success =  left()
		elseif dir == "e" then
			success =  true
		elseif dir == "s" then
			success =  right()
		elseif dir == "w" then
			success =  turnAround()
		end
	elseif curDir == "s" then
		if dir == "n" then
			success =  turnAround()
		elseif dir == "e" then
			success =  left()
		elseif dir == "s" then
			success =  true
		elseif dir == "w" then
			success =  right()
		end
	elseif curDir == "w" then
		if dir == "n" then
			success =  right()
		elseif dir == "e" then
			success =  turnAround()
		elseif dir == "s" then
			success =  left()
		elseif dir == "w" then
			success =  true
		end
	end

	if success then 
		print("was ",currentDirection," now ",dir)
		currentDirection = dir
		return true
	end
end

function getPosition()
    -- x, y, z = gps.locate(5)
	local x = nil
	local y = nil
	local z = nil
	local count = 0

	while x == nil do
		print("Trying to get gps fix. count=",count)
		
		x,y,z = gps.locate(5)
		print(" @ [" .. x .. ", " .. y .. ", " .. z .. "]")
		count = count + 1
		if x == nil then
			os.sleep(5)
		end
		-- if count > 20 then
		-- 	print("Could not get gps fix")
		--    os.exit() 
		-- end
	end
	return x,y,z
end


function place()
	selectCobble()
	turtle.place()

end

function placeDown()
	selectCobble()
	turtle.placeDown()

end

function placeUp()
	selectCobble()
	turtle.placeUp()
end

function selectCobble()
	slot = 1
	for i=1, 16 do
		-- Only run on Charcoal
		turtle.select(i)
		
		item = turtle.getItemDetail()
		if item then
			if item.name ~= "minecraft:cobblestone"
			then
				slot = i
			end
		end
	end
	turtle.select(slot)
end

function goTo(x,y,z)
	local curx,cury,curz = getPosition()
	currentDirection = getDirection()
	print(curx,cury,curz)
		while cury ~= y do
			if cury<y then
				up()
			else
				down()
			end
			curx,cury,curz = getPosition()
		end

		if curx<x then
			print("face east")
			faceDirection("e")
		elseif curx>x then
			print("face west")
			faceDirection("w")
		end
		while curx ~= x do
			fw()
			curx,cury,curz = getPosition()
			print(curx,cury,curz,currentDirection)
		end

		if curz>z then
	print("face north")
		faceDirection("n")
	elseif curz<z then
		print("face south")
		faceDirection("s")
	end
	while curz ~= z do
		fw()
		curx,cury,curz = getPosition()
		print(curx,cury,curz,currentDirection)
	end
end


--North = z-
--East =  x+
--South = z+
--West =  x-