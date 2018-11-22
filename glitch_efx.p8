pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
function _init() 
	glit = {}
	glit.height=128 -- set the width of area the screen glitch will appear
	glit.width=128 -- set the width of area the screen glitch will appear
	glit.t=0 -- glitch timer start
end


function _update()

end


function _draw()
	cls() -- clear the screen	
	glitch() -- start the static/glitch overlay
end
-->8
function glitch()
	if g_on == true then
		local t={7,2,5} --array of colors
		local c=flr(rnd(count(t)+1))
		for i=0, 10, 1 do -- the outer loop generates the vertical glitch dots
			local gl_height = rnd(glit.height)
			for h=0, 100, 2 do
			 -- the inner loop creates longer horizontal lines
				pset(rnd(glit.width), gl_height, t[c])
				 -- write the random pixels to the screen and randomize the colors from the previously generated random number against out color array
			end
		end
	end
	
	-- animation timeline that turns the static on and off
	if glit.t>30 and glit.t < 50 then
		g_on=true
	elseif glit.t>70 and glit.t < 80 then
		g_on=true
	elseif glit.t>120 then
		glit.t = 0		
	else 
		g_on=false	
	end
	glit.t+=1
end
