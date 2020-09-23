PB 1. unit > filter start > paste nopantsitemtracker.lua
PB 1. unit > filter tick(updateStuff) > paste nopantsitemtracker.lua
PB 1. unit > filter stop > paste "switch.deactivate()" no quotes. 

PB 2. unit > filter start > paste databank.lua
PB 2. unit > filter tick(updateStuff) > paste databank.lua

PB 3. unit > filter start > paste databank2.lua
PB 3. unit > filter tick(updateStuff) > paste databank2.lua

slotnames:
PB 1:
rename screen to screen
rename dblink to db 
rename switchlink to switch

PB 2:
rename slot1 to db
keep rest of the slots default

PB 3:
rename slot4 to db
keep rest of slots default

Link setup:
Detector > PB 1 > switch > relay > PB2 & PB3
PB 1 > screen
                                 
PB 2 Container Link Order: 
Iron, Alum, Carbon, Silicon, Calcium, Chromium, Copper, Sodium, Lithium

PB 3 Container Link Order:
Nickel, Silver, Sulfur

Add more as needed should be pretty simple to do. 

