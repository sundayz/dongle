function init_p2()
	p2width = 15
	p2height = 100
	p2x = 765
	p2y = 250
	p2sp = 300
end

function update_p2(dt)
	if love.keyboard.isDown('up') then
		p2y = p2y - (p1sp * dt)
	elseif love.keyboard.isDown('down') then
		p2y = p2y + (p2sp * dt)
	end
	
	if p2y < 0 then
		p2y = 0
	elseif p2y + p2height > 600 then
		p2y = 600 - p2height
	end
end

function draw_p2()
	love.graphics.rectangle('fill', p2x, p2y, 15, 100)
end