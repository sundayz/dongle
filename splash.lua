local core = require 'core';

-- Thanks Maurice Guégan :)

local splash = {
  playedintrosound = false,
  introduration = 2.5,
  blackafterintro = 0.3,
  introfadetime = 0.5,
  introprogress = -0.2;
};

function splash.update(dt)
  function love.keypressed(key)
    if key then
      TEsound.stop("all")
      splash.introprogress = 0
      core.state = 'menu'
      splash.restore_alpha()
    end
  end
  
  if splash.introprogress < splash.introduration + splash.blackafterintro then
    splash.introprogress = (splash.introprogress + dt)
    if splash.introprogress > splash.introduration + splash.blackafterintro then
      splash.introprogress = splash.introduration + splash.blackafterintro
    end	
    if splash.introprogress > 0.5 and splash.playedintrosound == nil then 
      TEsound.play(core.Sound.startup)
      splash.playedintrosound = true
    end	
    if splash.introprogress == splash.introduration + splash.blackafterintro then
      splash.restore_alpha();
      core.state = 'menu'
    end
  end
end

function splash.draw()
  if splash.introprogress >= 0 and splash.introprogress < splash.introduration then
    local a = 255
    if splash.introprogress < splash.introfadetime then
      a = splash.introprogress / splash.introfadetime * 255
    elseif splash.introprogress >= splash.introduration - splash.introfadetime then
      a = (1 - (splash.introprogress - (splash.introduration - splash.introfadetime)) / splash.introfadetime) * 255
    end
		love.graphics.setColor(255, 255, 255, a)
    if splash.introprogress > splash.introfadetime + 0.3 and splash.introprogress < splash.introduration - splash.introfadetime then
      love.graphics.draw(core.Graphics.plogo, 178, 281)
    else
      love.graphics.draw(core.Graphics.plogo, 178, 281)
    end
  end
end

function splash.restore_alpha()
    love.graphics.setColor(255, 255, 255, 255)
end

return splash;
