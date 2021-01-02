print("Downloading 'quarry'")
shell.run("rm quarry")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/quarry.lua quarry")


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
    "heylisten",
    "whead",
    "wkill",
    "wsand"
}

for file in files do 
    print("Downloading " + file)
    shell.run("rm "+ file)
    shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/"+file+".lua "+ file)
end

print("")
print("Download successful!")