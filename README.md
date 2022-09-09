# Vape Shop Job for QBCore Framework

Preview : https://streamable.com/dmvjog

Supports oxmysql and ghmattimysql

## Dependencies :

QBCore Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target

qb-menu - https://github.com/qbcore-framework/qb-menu

qb-input - https://github.com/qbcore-framework/qb-input

## Optional :

MLO - https://mxc-shop.tebex.io/category/mlo --- This is what the script is set for if you dont have it youll have to change all the zones

## Updates in the future

- Vape script for using vapes

- More juices and vapes


## Insert into qb-core/shared.items.lua

```
QBShared.Items = {
	["vape_pen"] 				 = {["name"] = "vape_pen", 			 	["label"] = "Vape Pen", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "vape_pen.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["chubby"] 			 = {["name"] = "chubby", 			 	["label"] = "Chubby Bubble Juice", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "chubby.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["juicebottle"] 				 = {["name"] = "juicebottle", 			 	["label"] = "Bottle", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "juicebottle.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["commonjuice"] 		 = {["name"] = "commonjuice", 			["label"] = "Juice", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "commonjuice.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
}

```

```
qb-core/shared/jobs.lua = {

    ["smoking"] = {
		label = "Smo-King Employee",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 300
            },
			['1'] = {
                name = "Employee",
                payment = 400
            },
			['2'] = {
                name = "Manager",
                payment = 600
            },
			['4'] = {
                name = "Owner",
				isboss = true,
                payment = 850
            },
        },
	},
}	

```

``Then just add you boss menu in qb-management using this vector --""--``
