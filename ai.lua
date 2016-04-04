local ai = {
  width = 15,
  height = 100,
  x = 765,
  y = 250,
  ticker = 0,
  target = 0,
  difficulty = 0.45;
};

local function setspeed(y1, y2)
  local rand = math.random(50, 100);
  if y1 > y2 then
    local diff = (y1 - y2);
      if diff < 100 then
        return 200 + rand;
      else
        return 250 + rand;
      end
  elseif y1 < y2 then
    local diff = (y2 - y1);
    if diff < 100 then
      return 200 + rand;
    else
      return 250 + rand;
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
