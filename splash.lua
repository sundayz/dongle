local core = require 'core';

-- Thanks Maurice Guégan :)

function init_splash()
	state = 'splash'
	
	introduration = 2.5
	blackafterintro = 0.3
	introfadetime = 0.5
	introprogress = -0.2 
end

function update_splash(dt)
  function love.keypressed(key)
    if key then
      TEsound.stop("all")
      introprogress = 0
      state = 'menu'
      restore_alpha()
    end
  end
  
	if introprogress < introduration + blackafterintro then
		introprogress = (introprogress + dt)
		if introprogress > introduration + blackafterintro then
			introprogress = introduration+blackafterintro
		end
		
		if introprogress > 0.5 and playedintrosound == nil then 
			TEsound.play(core.Sound.startup)
			playedintrosound = true
		end
		
		if introprogress == introduration + blackafterintro then
			state = 'menu'
		end
	end
end

function draw_splash()  
	if introprogress >= 0 and introprogress < introduration then
		local a = 255
		if introprogress < introfadetime then
			a = introprogress/introfadetime * 255
		elseif introprogress >= introduration-introfadetime then
			a = (1-(introprogress-(introduration-introfadetime))/introfadetime) * 255
		end
		
		love.graphics.setColor(255, 255, 255, a)
		
		if introprogress > introfadetime+0.3 and introprogress < introduration - introfadetime then
--			love.graphics.draw(logotest, 400, 300, 0, 1, 1, 200, 150)
			love.graphics.draw(core.Graphics.plogo, 178, 281)
		else
--			love.graphics.draw(logotest, 400, 300, 0, 1, 1, 200, 150)
			love.graphics.draw(core.Graphics.plogo, 178, 281)
		end
	end
end

function restore_alpha()
		love.graphics.setColor(255, 255, 255, 255)
end