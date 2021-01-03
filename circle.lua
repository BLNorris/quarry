os.loadAPI("t")
local r = 0
currSlot = 1
print("What radius of circle would you like me to create?")
r = tonumber(io.read())

if r == 0 then
  print("Radius 0 circle? Done!")
end

function findBlock ()

  if turtle.getItemCount(currSlot) ~= 0 then
    return true
  end
 
  local tmp = 1
  turtle.select(1)
 
  while (turtle.getItemCount(tmp) == 0 and tmp <= 15) do
    tmp=tmp+1
    turtle.select(tmp)  
  end

  while (turtle.getItemCount(tmp) == 0 and tmp == 16) do
    -- Send a message to the evil demon Speaking Turtle.
    rednet.open("right")
    rednet.send(8, "Bunny needs blocks!", false)
    rednet.close("right")
    print("Bunny needs blocks!")
    sleep(5)
  end
 
  return true
   
end

function tryPlaceDown ()
  if turtle.placeDown() == false then
    exit()
  end
end

round = function (inputN)

  if inputN % 2 ~= 0.5 then
    return math.floor(inputN + 0.5)
  end
  return inputN - 0.5

end

turtle.select(currSlot)

local coords = {}
local coordsCount = 0

local f = 1 - r
local ddF_x = 1
local ddF_y = -2 * r
local x = 0
local y = r

coords[0 .. "," .. round(0+r)] = true
coords[0 .. "," .. round(0-r)] = true
coords[0+r .. "," .. 0] = true
coords[0-r .. "," .. 0] = true
coordsCount = 4

while (x < y) do

  if (f >= 0) then
    y = y - 1
    ddF_y = ddF_y + 2
    f = f + ddF_y
  end

  x = x + 1
  ddF_x = ddF_x + 2
  f = f + ddF_x

  coords[round(0+x) .. "," .. round(0+y)] = true
  coords[round(0-x) .. "," .. round(0+y)] = true
  coords[round(0+x) .. "," .. round(0-y)] = true
  coords[round(0-x) .. "," .. round(0-y)] = true

  coords[round(0+y) .. "," .. round(0+x)] = true
  coords[round(0-y) .. "," .. round(0+x)] = true
  coords[round(0+y) .. "," .. round(0-x)] = true
  coords[round(0-y) .. "," .. round(0-x)] = true

  coordsCount = coordsCount + 8

end

checkCoords = function (x0,y0)

  if coords[x0 .. "," .. y0] == true then
    return true
  else
    return false
  end

end

-- Move from the center to the first position it can find.
x = 0
y = 0

while checkCoords(x,y) ~= true do

  t.fw()
  x = x + 1

end

-- Place a block in the first position.
findBlock()
turtle.placeDown()

-- Keep track of which way the turtle is facing.
facingX = 1
facingY = 0

-- Look clockwise from each block and find the next block in the space.
spinsDone = 0
while (coordsCount > 0 and spinsDone < 5) do

  cX = x + facingX
  cY = y + facingY

  if checkCoords(cX, cY) then

    t.fw()
    findBlock()
    turtle.placeDown()

    x = cX
    y = cY
    coords[x .. "," .. y] = nil
    coordsCount = coordsCount - 1

    spinsDone = 0

  else

    -- Check diagnals
    if facingX == 1 then

          cY = y + 1
          newFacingX = 0
          newFacingY = 1

    elseif facingX == -1 then

          cY = y - 1
          newFacingX = 0
          newFacingY = -1

    elseif facingY == 1 then

          cX = x - 1
          newFacingX = -1
          newFacingY = 0

    elseif facingY == -1 then

          cX = x + 1
          newFacingX = 1
          newFacingY = 0

    end


    if checkCoords(cX,cY) then

          t.fw()
          turtle.turnRight()
          t.fw()
          turtle.turnLeft()
          findBlock()
          turtle.placeDown()

          x = cX
          y = cY
          coords[x .. "," .. y] = nil
          coordsCount = coordsCount - 1

          spinsDone = 0

    else

          turtle.turnRight()

          facingX = newFacingX
          facingY = newFacingY

          spinsDone = spinsDone + 1

    end

  end

end