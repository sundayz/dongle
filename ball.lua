function init_ball()
	lasttouch = nil
	bx = 400
	by = 300
	bspx = 350
	bspy = -130
end

function ball_collision_top()
	 if by < 0 then
		bspy = math.abs(bspy)
		if bspx > 0 then bspx = bspx + 20 else bspx = bspx + 20 end
		if bspy > 0 then bspy = bspy + 20 else bspy = bspy - 20 end
	end
end


function ball_collision_bot()
	if by > 600 then
		bspy = -math.abs(bspy)
		if bspx > 0 then bspx = bspx + 20 else bspx = bspx + 20 end
		if bspy > 0 then bspy = bspy + 20 else bspy = bspy - 20 end
	end
end

function ball_collision_p1()
	if (bx - 4) <= (p1x + p1width) and by <= (p1y + p1height) then
		if by <= (p1y + 33) and by > p1y then
			bspy = -100
			bspx = math.abs(bspx)
			TEsound.play(collisionsounds) -- Play sound.
			lasttouch = 'p1'	 -- Used for score and other things.
		elseif by >= (p1y + 66) and by > p1y and by < (p1y + p1height) then
			bspy = 100
			bspx = math.abs(bspx)
			TEsound.play(collisionsounds)
			lasttouch = 'p1'
		elseif by <= (p1y + 65) and by >= (p1y + 34) then
			bspx = math.abs(bspx)
			TEsound.play(collisionsounds)
			lasttouch = 'p1'
		end
		if bspx > 0 then bspx = bspx + 20 else bspx = bspx + 20 end
		if bspy > 0 then bspy = bspy + 20 else bspy = bspy - 20 end
	end
end	

function ball_collision_p2()
	if (bx + 4) >= p2x and by <= (p2y + p2height) then
		if by <= (p2y + 33) and by > p2y then
			bspy = -100
			bspx = -math.abs(bspx)		  -- Thanks, Maurce :(
			TEsound.play(collisionsounds) -- Play sound.
			lasttouch = 'p2'	 -- Used for score and other things.
		elseif by >= (p2y + 66) and by > p2y and by < (p2y + p2height) then
			bspy = 100
			bspx = -math.abs(bspx)
			TEsound.play(collisionsounds)
			lasttouch = 'p2'
		elseif by <= (p2y + 65) and by >= (p2y + 34) then
			bspx = -math.abs(bspx)
			TEsound.play(collisionsounds)
			lasttouch = 'p2'
		end
		if bspx > 0 then bspx = bspx + 20 else bspx = bspx - 20 end
		if bspy > 0 then bspy = bspy + 20 else bspy = bspy - 20 end
	end
end	

--[[
function ball_collision_ai()	
	if (bx + 5) >= aix and by <= (aiy + aiheight) and by > aiy then  -- More than aiy and less than aiy + height
		if by <= (aiy + 33) and by > aiy then
			bspy = -200
			bspx = math.abs(bspx)
			TEsound.play(collisionsounds) -- Play sound.
			lasttouch = 'p2'	 -- Used for score and other things.
		elseif by >= (aiy + 66) and by > aiy and by < (aiy + aiheight) then
			bspy = 200
			bspx = math.abs(bspx)
			TEsound.play(collisionsounds)
			lasttouch = 'p2'
		elseif by < (aiy + 65) and by > (aiy + 34) then
			bspx = math.abs(bspx)
			TEsound.play(collisionsounds)
			lasttouch = 'p2'
		end
	end
end	

--]]

function update_ball(dt)
	bx = bx + (bspx * dt)
	by = by + (bspy * dt)
end	

function ball_update_score()
	if bx < 0 or bx > 800 then
		if lasttouch == 'p1' then
			p1score = (p1score + 1)
		elseif lasttouch == 'p2' then
			p2score = (p2score + 1)
		else end
	init_ball()
--	init_ai()
	init_p2()
	init_p1()
	end
end

function draw_ball()
	love.graphics.circle("fill", bx, by, 7, 100) -- Origin is in the middle. Diameter is 7. Radius is 3.5
end

