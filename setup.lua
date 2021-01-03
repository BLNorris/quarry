local files ={
    "quarry",
    "inv",
    "test",
    "wall",
    "t",
    "tz",
    "u",
    "q",
    "setHome",
    "qs",
    "r",
    "n",
    "bridgethin",
    "circle",
    "circleup",
    "heylisten",
    "wcontrol",
    "whead",
    "wkill",
    "wsand",
    "z"
}

for i,file in ipairs(files) do 
    print("Downloading " .. file)
    shell.run("rm ".. file)
    shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/"..file..".lua ".. file)
end

shell.run("wget https://raw.githubusercontent.com/Siarko/ButtonApi/master/button.lua button")

print("")
print("Download successful!")