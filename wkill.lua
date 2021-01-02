os.loadAPI("u")
u.OpenModem()
while true do
    senderId, message, protocol = rednet.receive("placewither",1)
    if message == "place" then
        turtle.place()
    end
    turtle.attack()
end