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


print("Downloading 't'")
shell.run("rm t")
shell.run("wget https://raw.githubusercontent.com/BLNorris/quarry/master/t.lua t")


print("")
print("Download successful! run with 'quarry'")

shell.run("quarry")