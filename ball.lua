local core = require 'core';

local ball = {
  lasttouch = nil,
  x = 400,
  y = 300,
  vx = 350,
  vy = -130;
};

function ball.collision_top()
	 if ball.y < 0 then
		ball.vy = math.abs(ball.vy);
		if ball.vx > 0 then ball.vx = ball.vx + 20 else ball.vx = ball.vx + 20 end
		if ball.vy > 0 then ball.vy = ball.vy + 20 else ball.vy = ball.vy - 20 end
	end
end


function ball.collision_bot()
	if ball.y > 600 then
		ball.vy = -math.abs(ball.vy);
		if ball.vx > 0 then ball.vx = ball.vx + 20 else ball.vx = ball.vx + 20 end
		if ball.vy > 0 then ball.vy = ball.vy + 20 else ball.vy = ball.vy - 20 end
	end
end

function ball.collision_p1()
  if (ball.x - 4) <= (p1x + p1width) and ball.y <= (p1y + p1height) then
    if ball.y <= (p1y + 33) and ball.y > p1y then
      ball.vy = -100;
      ball.vx = math.abs(ball.vx);
      TEsound.play({core.Sound.blip1, core.Sound.blip2}); -- Play sound.
      ball.lasttouch = 'p1'	 -- Used for score and other things.
    elseif ball.y >= (p1y + 66) and ball.y > p1y and ball.y < (p1y + p1height) then
      ball.vy = 100;
      ball.vx = math.abs(ball.vx);
      TEsound.play({core.Sound.blip1, core.Sound.blip2});
      ball.lasttouch = 'p1'
    elseif ball.y <= (p1y + 65) and ball.y >= (p1y + 34) then
      ball.vx = math.abs(ball.vx)
      TEsound.play({core.Sound.blip1, core.Sound.blip2})
      ball.lasttouch = 'p1'
    end
    if ball.vx > 0 then ball.vx = ball.vx + 20 else ball.vx = ball.vx + 20 end
    if ball.vy > 0 then ball.vy = ball.vy + 20 else ball.vy = ball.vy - 20 end
  end
end	

function ball.collision_p2()
	if (ball.x + 4) >= p2x and ball.y <= (p2y + p2height) then
		if ball.y <= (p2y + 33) and ball.y > p2y then
			ball.vy = -100
			ball.vx = -math.abs(ball.vx)		  -- Thanks, Maurce :(
			TEsound.play({core.Sound.blip1, core.Sound.blip2}) -- Play sound.
			ball.lasttouch = 'p2'	 -- Used for score and other things.
		elseif ball.y >= (p2y + 66) and ball.y > p2y and ball.y < (p2y + p2height) then
			ball.vy = 100
			ball.vx = -math.abs(ball.vx)
			TEsound.play({core.Sound.blip1, core.Sound.blip2});
			lasttouch = 'p2'
		elseif ball.y <= (p2y + 65) and ball.y >= (p2y + 34) then
			ball.vx = -math.abs(ball.vx)
			TEsound.play({core.Sound.blip1, core.Sound.blip2});
			ball.lasttouch = 'p2'
		end
		if ball.vx > 0 then ball.vx = ball.vx + 20 else ball.vx = ball.vx - 20 end
		if ball.vy > 0 then ball.vy = ball.vy + 20 else ball.vy = ball.vy - 20 end
	end
end	

--[[
function ball.collision_ai()	
	if (bx + 5) >= aix and by <= (aiy + aiheight) and by > aiy then  -- More than aiy and less than aiy + height
		if by <= (aiy + 33) and by > aiy then
			ball.vy = -200
			ball.vx = math.abs(ball.vx)
			TEsound.play(collisionsounds) -- Play sound.
			lasttouch = 'p2'	 -- Used for score and other things.
		elseif by >= (aiy + 66) and by > aiy and by < (aiy + aiheight) then
			ball.vy = 200
			ball.vx = math.abs(ball.vx)
			TEsound.play(collisionsounds)
			lasttouch = 'p2'
		elseif by < (aiy + 65) and by > (aiy + 34) then
			ball.vx = math.abs(ball.vx)
			TEsound.play(collisionsounds)
			lasttouch = 'p2'
		end
	end
end	

--]]

function ball.update(dt)
	ball.x = ball.x + (ball.vx * dt)
	ball.y = ball.y + (ball.vy * dt)
end	

function ball.update_score()
	if ball.x < 0 or ball.x > 800 then
		if ball.lasttouch == 'p1' then
			p1score = (p1score + 1);
		elseif ball.lasttouch == 'p2' then
			p2score = (p2score + 1);
		end
    ball = {
      lasttouch = nil,
      x = 400,
      y = 300,
      vx = 350,
      vy = -130;
    };
    -- init_ai()
    init_p2();
    init_p1();
	end
end

function ball.draw()
	love.graphics.circle("fill", ball.x, ball.y, 7, 100) -- Origin is in the middle. Diameter is 7. Radius is 3.5
end

return ball
