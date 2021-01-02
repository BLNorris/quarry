os.loadAPI("u")
os.loadAPI("button")
u.OpenModem()
monitor = peripheral.wrap(u.GetMonitorSide())

button.setMonitor(monitor)

myButton = button.create("Place Wither")


myButton.setPos(1,1)
myButton.onClick(function()
    print("CLICK!")
    rednet.broadcast("place", "placewither")
end)
while true do button.await(myButton) end
