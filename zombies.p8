pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--global
black, darkblue, darkpurple, darkgreen, brown, darkgrey, lightgrey, white, red, orange, yellow, green, blue, lavender, pink, lightpeach = 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
b_left, b_right, b_up, b_down, b_o, b_x = 0,1,2,3,4,5

--init
function _init()
	initpeople()
	initbuildings()
end

function initpeople()
	people={}
	for i=1,10 do
		local p={}
		initperson(p)
		add(people, p)
	end
end

function initperson(p)
	p.x=rnd(64)
	p.y=rnd(64)
	p.color=white
end

function initbuildings()
	buildings={}
	for i=1,10 do
		local b={}
		initbuilding(b)
		add(buildings,b)
	end
end

function initbuilding(b)
	b.x=rnd(64)
	b.y=rnd(64)
	b.w=8
	b.h=8
	b.color=blue
end

--update
function _update()
	updatepeople()	
end

function updatepeople()

end

--draw
function _draw()
	 cls()
	 drawpeople()
	 drawbuildings()
end

function drawpeople()
	for p in all(people) do
		pset(p.x, p.y, p.color)
	end
end

function drawbuildings()
	for b in all(buildings) do
		rect(b.x, b.y, b.x+b.w, b.y+b.h, b.color)
	end
end
--util
function ispointinbox(point, box)
	return (point.x >= box.x and point.x <= box.x+box.w) and
	(point.y >= box.y and point.y <= box.y+box.h)
end

function ispointincircle(point, circle)
	return distance(point.x, point.y, circle.x, circle.y) < circle.r
end

function isboxinstersect(box1, box2)
	return (box1.x <= box2.x+box2.w and box1.x+box1.w >= box2.x) and
	(box1.y <= box2.y+box2.h and box1.y+box1.h >= box2.y)
end

function distance(x1, y1, x2, y2)
	return sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1))
end

function midpoint(x1, y1, x2, y2)
	return { x=(x1 + x2)/2, y=(y1+ y2)/2 }
end

function noise(x, y, w, h)
	for i=x,x+w do
		for j=y,y+h do
			pset(i, j, rnd(16))
		end
	end
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
