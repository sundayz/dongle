local ai = {
  width = 15,
  height = 100,
  x = 765,
  y = 250,
  ticker = 0,
  target = 0;
};

local function setspeed(y1, y2)
  if y1 > y2 then
    local speed = (y1 - y2);
    if speed < 100 then
      return speed * 2;
    else
      return speed;
    end
  elseif y1 < y2 then
    local speed = (y2 - y1);
    if speed < 100 then
      return speed * 2;
    else
      return speed;
    end
  else -- y1 == y2
    return 0;
  end
end

function ai.update(dt)
  if ai.y + (ai.height - math.random(25, 35)) < ai.target then
    ai.y = ai.y + (setspeed(ai.y, ai.target) * dt);
  else
    ai.y = ai.y - (setspeed(ai.y, ai.target) * dt);
  end
	if ai.y < 0 then
		ai.y = 0;
	elseif ai.y + ai.height > 600 then
		ai.y = (600 - ai.height);
	end
end

function ai.draw()
	love.graphics.rectangle('fill', ai.x, ai.y, ai.width, ai.height);
end

return ai;
