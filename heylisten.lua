rednet.open("right");
rednet.open("left");
rednet.open("back");
rednet.open("front");
rednet.open("top");
rednet.open("bottom");

while true do
         local function clear() term.clear(); term.setCursorPos(1, 1); end

         sender, message = rednet.receive();
         clear();
         print( sender );
         print( message );
end


rednet.close("right");
rednet.close("left");
rednet.close("back");
rednet.close("front");
rednet.close("top");