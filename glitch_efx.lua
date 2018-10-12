-- Glitch Efx
-- by rafaelmuto
-- based on code by willw68k

-- ===== TAB 0 =====

function _init()
	glit = {}
	glit.height=128 -- set the height of the glitch area
	glit.width=128 -- set the width of the glitch area
	glit.t=0 -- glitch timer start
end


function _update()

end


function _draw()
	cls()
	glitch() -- start the static/glitch overlay
end

-- ===== TAB 1 =====

function glitch()
	if g_on == true then
		local t={7,2,5} --array of colors
		local c=flr(rnd(count(t)+1))
		for i=0, 10, 1 do -- outer loop sets a random height... # of calls sets the vertical density of the glitch
			local gl_height = rnd(glit.height)
			for h=0, 50, 1 do -- inner loop fills the line at set height with random pixels... # of calls sets the horizontal density of the glitch
				pset(rnd(glit.width), gl_height, t[c])
			end
		end
	end

	-- animation timeline that turns the static on and off
	-- gotta find a way to randomize this part... o____O
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
