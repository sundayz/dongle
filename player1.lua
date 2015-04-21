function init_p1()
	p1width = 15
	p1height = 100
	p1x = 20
	p1y = 250
	p1sp = 300
end

function update_p1(dt)
	if love.keyboard.isDown('w') then
		p1y = p1y - (p1sp * dt)
	elseif love.keyboard.isDown('s') then
		p1y = p1y + (p1sp * dt)
	end
	
	if p1y < 0 then
		p1y = 0
	elseif p1y + p1height > 600 then
		p1y = 600 - p1height
	end
end

function draw_p1()
	love.graphics.rectangle('fill', p1x, p1y, 15, 100)
end