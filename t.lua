local MAXTRIES = 100
local currentDirection = nil

function turnAround()
	local success = false
	
	success = turtle.turnRight()
	success = success and turtle.turnRight()
	
	return success
end

function right()
	currentDirection = nil
	return turtle.turnRight()
end

function left()
	currentDirection = nil
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
	
    local x,y,z = gps.locate(5)
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
	
    local x1,y1,z1 = gps.locate(5)
	currentDirection = calcDiretion(x,z,x1,z1)
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

function getDirection()
	if currentDirection ~= nil
	then return currentDirection
	end
	local x,y,z = gps.locate(5)
	fw()
	local x1,y1,z1 = gps.locate(5)
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
	local curDir = getDirection()
	if curDir == "n" then
		if dir == "n" then
			return true
		elseif dir == "e" then
			return left()
		elseif dir == "s" then
			return turnAround()
		elseif dir == "w" then
			return right()
		end
	elseif curDir == "e" then
		if dir == "n" then
			return right()
		elseif dir == "e" then
			return true
		elseif dir == "s" then
			return left()
		elseif dir == "w" then
			return turnAround()
		end
	elseif curDir == "s" then
		if dir == "n" then
			return turnAround()
		elseif dir == "e" then
			return right()
		elseif dir == "s" then
			return true
		elseif dir == "w" then
			return left()
		end
	elseif curDir == "w" then
		if dir == "n" then
			return left()
		elseif dir == "e" then
			return turnAround()
		elseif dir == "s" then
			return right()
		elseif dir == "w" then
			return true
		end
	end
end