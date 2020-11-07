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

print("Downloading 'u'")
shell.run("rm u")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/u.lua u")

print("Downloading 'q'")
shell.run("rm q")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/u.lua q")

print("Downloading 'setHome'")
shell.run("rm setHome")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/u.lua setHome")


print("")
print("Download successful!")
