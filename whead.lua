os.loadAPI("u")
u.OpenModem()
while true do
    senderId, message, protocol = rednet.receive("placewither")
    if message == "place" then
        os.sleep(2)
        turtle.placeUp()
    end
end