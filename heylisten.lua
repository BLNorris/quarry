
os.loadAPI("u")
u.OpenModem()
while true do
         local function clear() term.clear(); term.setCursorPos(1, 1); end

         sender, message = rednet.receive();
         clear();
         print( sender );
         print( message );
end

u.CloseModem()