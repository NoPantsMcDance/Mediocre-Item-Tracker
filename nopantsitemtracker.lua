--unit.start()
switch.activate()

unit.setTimer("updateStuff",3)

--unit.timer(*)

ItemCounter  = {
        literWeight = 0.1,
        displayName = nil,
        maxItems = 10400
    }
currentSlot = 1

function round(float)
    return math.floor(float + .5)
end

templateHtmlStringA = [[
<style>
.bar {
	height: 1em;
	background-color: blue;
     content: '';
     max-width: 100%;
	position:absolute;
	top: 0.7rem;
	z-index: 1;
}
.bar-text {
	position: absolute;
	z-index: 2;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

tr.alt.low-items, tr.low-items {
	background-color: red;
}

tr.alt.mid-items, tr.mid-items {
	background-color: orange;
	color: black;
}

tr.alt.full-items, tr.full-items {
	background-color: green;
	color: black;
}

.td-bar {
	text-align: center;
	color: white;
	position: relative;
}
.main
{
	text-align: center;
	font-size: 1.5em;
    width: 100vh;
    height: 100vw;
    transform: translateY(-33vh) translateX(20vh) rotate(90deg) ;
}
.main-table{
     position: relative;
	width:80vh;
	font-size: 6rem;
}
.bar-header{
	min-width:31vh;    
}
    .title{
     font-size:10rem; width: 100vh; text-align: center;
    
    }
tr.alt{ background-color:#333;}
tr::nth-child(even) td{ background-color:#555;}
</style>
<div class='main'>
	<div class='title'>NoPants Industries</h1>
	<table class='main-table'>
		<thead>
			<tr> <th>Item Name</th> <th>Amount</th> <th class="bar-header"></th>
		</thead>
		<tbody>]]
			
templateHtmlStringB = [[</tbody>
	</table>
</div>
]]

templateHtmlStringM = [[<tr class="%s"><td>%s</td><td>%.2f</td>
<td class="td-bar"><div class="bar" style="width: %f%%;">&nbsp;</div><div class="bar-text">%.2f%%</div></td>
</tr>]]
middleString = ""
function drawItems(dname, numItems, maxItems)
    local rowClassString = ""
    local percentage = numItems/maxItems * 100
    
    if percentage < 25 then
        rowClassString = rowClassString .. " low-items"
    elseif percentage < 50 then
        rowClassString = rowClassString .. " mid-items"
    else 
        rowClassString = rowClassString .. " full-items"
    end
    --system.print(templateHtmlStringM)
    -- system.print(percentage)
    -- system.print(numItems)
    -- system.print(maxItems)
    -- system.print(rowClassString)
    --system.print(dname)
    --numItems = round(numItems)
    middleString = middleString .. string.format(templateHtmlStringM , rowClassString, dname, numItems, percentage, percentage) 
    --system.print(middleString)
    --system.print(dname)
    -- system.print(percentage)
    end

keys = {}
for _,key in ipairs(json.decode(db.getKeys())) do
    table.insert(keys, key)
  end
table.sort(keys)
slots = {"Iron", "Alum", "Carbon", "Silicon", "Calcium", "Chromium", "Copper", "Sodium", "Lithium", "Nickel", "Silver", "Sulfur"}
-- for i, slot in ipairs(slots) do
--     --system.print(slot)
--     local dname = slots[i]
--     drawItems(dname, 10, 10400)
-- end

for i, key in ipairs(keys) do
    local amount = db.getFloatValue(i)
    local dname = slots[i]
    --system.print(key)
    drawItems(dname, amount, 10400)
end

function flushHtml()
    masterHtml = templateHtmlStringA .. middleString .. templateHtmlStringB
    screen.setHTML(masterHtml)
    end
    
flushHtml()