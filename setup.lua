--local s1 = shell.run("pastebin get CJKFgWNM t")
--local s2 = shell.run("pastebin get sfNHpJKg inventory")
--local s3 = shell.run("pastebin get 98TuF2cB quarry")

-- Download from github

print("Downloading 'quarry'")
shell.run("rm quarry")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/quarry.lua quarry")

print("Downloading 'inv'")
shell.run("rm inv")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/inv.lua inv")

print("Downloading 'test'")
shell.run("rm test")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/test.lua test")

print("Downloading 'wall'")
shell.run("rm wall")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/wall.lua wall")

print("Downloading 't'")
shell.run("rm t")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/t.lua t")

print("Downloading 'tz'")
shell.run("rm tz")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/tz.lua tz")

print("Downloading 'u'")
shell.run("rm u")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/u.lua u")

print("Downloading 'q'")
shell.run("rm q")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/q.lua q")

print("Downloading 'setHome'")
shell.run("rm setHome")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/setHome.lua setHome")

print("Downloading 'qs'")
shell.run("rm qs")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/qs.lua qs")

print("Downloading 'r'")
shell.run("rm r")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/r.lua r")

print("Downloading 'n'")
shell.run("rm n")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/n.lua n")


print("Downloading 'bridge'")
shell.run("rm bridge")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/bridge.lua bridge")

print("Downloading 'bridgethin'")
shell.run("rm bridgethin")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/bridgethin.lua bridgethin")


print("Downloading 'circle'")
shell.run("rm circle")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/circle.lua circle")


print("Downloading 'heylisten'")
shell.run("rm heylisten")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/heylisten.lua heylisten")


-- shell.run("rm startup")
-- shell.run("copy q startup")
-- io.write("Setup Quarry? (y/n):")
-- quarry = io.read()
-- if quarry == "y"then
--     shell.run("qs")
-- end
print("")
print("Download successful!")
