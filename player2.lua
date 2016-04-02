local player2 = {
  width = 15,
  height = 100,
  x = 765,
  y = 250,
  v = 300;
};

function player2.update(dt)
  if love.keyboard.isDown('up') then
    player2.y = player2.y - (player2.v * dt);
  elseif love.keyboard.isDown('down') then
    player2.y = player2.y + (player2.v * dt);
  end

  if player2.y < 0 then
    player2.y = 0;
  elseif player2.y + player2.height > 600 then
    player2.y = 600 - player2.height;
  end
end

function player2.draw()
  love.graphics.rectangle('fill', player2.x, player2.y, player2.width, player2.height);
end

return player2;
