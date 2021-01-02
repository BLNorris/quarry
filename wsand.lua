os.loadAPI("u")
u.OpenModem()
while true do
    senderId, message, protocol = rednet.receive("placewither")
    print(message)
    if message == "place" then
        turtle.placeUp()
    end
end