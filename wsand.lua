os.loadAPI("u")
u.OpenModem()
while true do
    senderId, message, protocol = rednet.receive("placewither")
    if message == "place" then
        turtle.placeUp()
    end
end