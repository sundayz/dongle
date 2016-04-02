local player = {
  width = 15,
  height = 100,
  x = 20,
  y = 250,
  v = 300;
};

function player.update(dt)
  if love.keyboard.isDown('w') then
    player.y = player.y - (player.v * dt);
  elseif love.keyboard.isDown('s') then
    player.y = player.y + (player.v * dt);
  end

  if player.y < 0 then
    player.y = 0;
   elseif player.y + player.height > 600 then
    player.y = 600 - player.height;
  end
end

function player.draw()
  love.graphics.rectangle('fill', player.x, player.y, player.width, player.height);
end

return player;
