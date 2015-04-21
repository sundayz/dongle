-- UNUSED

function init_ai()
	aiwidth = 15
	aiheight = 100
	aix = 765
	aiy = 200
	aisp = 300
end

function update_ai(dt)
	aiy = by - 50

	if aiy < 0 then
		aiy = 0
	elseif aiy + aiheight > 600 then
		aiy = (600 - aiheight)
	end
end

function draw_ai()
	love.graphics.rectangle('fill', aix, aiy, 15, 100)
end