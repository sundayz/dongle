function menu_logic()
	if states.menu_selected == 1 then 			-- EHHHHHHHHHH
		ax = 55
		ay = 200
	elseif states.menu_selected == 2 then
		ax = 55
		ay = 250
	elseif states.menu_selected == 3 then
		ax = 55
		ay = 300
	elseif states.menu_selected == 4 then
		ax = 55
		ay = 350
	end
  
	if playedintrosound == true then
		love.graphics.setColor(255, 255, 255, 255)
		playedintrosound = false
	end

function love.keypressed(key)
		-- MAIN MENU
		if key == 'up' then
			states.menu_selected = (states.menu_selected - 1)
      TEsound.play(blip3)
		elseif key == 'down' then
    	TEsound.play(blip3)
			states.menu_selected = (states.menu_selected + 1)
		end
	
		if key == 'return' then			-- Thanks Torin
      TEsound.play(blip3)
			if states.menu_selected == 1 then
				state = 'game'
				TEsound.stop("all")
			elseif states.menu_selected == 2 then
				state = 'options'
			elseif states.menu_selected == 3 then
				state = 'credits'
			elseif states.menu_selected == 4 then
				love.event.quit()         -- exit game code
			end
		end
end
	
	if states.menu_selected > 4 then
		states.menu_selected = 1
	elseif states.menu_selected < 1 then
		states.menu_selected = 4
	end
end

function options_logic()				-- OPTIONS
	if states.options_selected == 1 then
		ax = 55
		ay = 200
	elseif states.options_selected == 2 then
		ax = 55
		ay = 250
  elseif states.options_selected == 3 then
    ax = 55
    ay = 560
	end
  
  function love.keypressed(key)  
    if key == 'up' then
      TEsound.play(blip3)
      states.options_selected = (states.options_selected - 1)
    elseif key == 'down' then
      TEsound.play(blip3)
      states.options_selected = (states.options_selected + 1)
    end
    
    if key == 'return' then 
      TEsound.play(blip3)
      if states.options_selected == 1 then
        state = 'options_display'
      elseif states.options_selected == 2 then		-- Vsync
        state = 'options_sound'
      elseif states.options_selected == 3 then
        state = 'menu'
      end
    end
  end
  
  if states.options_selected > 3 then
		states.options_selected = 1
	elseif states.options_selected < 1 then
		states.options_selected = 3
	end
end
 
function credits_logic()						-- CREDITS
	if states.credits_selected == 1 then
		ax = 55
		ay = 560
	end
	
	function love.keypressed(key)
		if key == 'return' and states.credits_selected == 1 then
      TEsound.play(blip3)
			state = 'menu'
		end	
	end
end

function options_display_logic()   -- DISPLAY OPTIONS
	if states.options_display_selected == 1 then
		ax = 55
		ay = 200
	elseif states.options_display_selected == 2 then
		ax = 55
		ay = 250
	elseif states.options_display_selected == 3 then
		ax = 55
		ay = 300
	elseif states.options_display_selected == 4 then
		ax = 55
		ay = 350
	elseif states.options_display_selected == 5 then
		ax = 55
		ay = 560
	end
	
	if states.options_display_selected > 5 then
		states.options_display_selected = 1
	elseif states.options_display_selected < 1 then
		states.options_display_selected = 5
	end
	
	if mode.aa > 4 then
		mode.aa = 0
	end
	
	if states.options_display_selected == 1 then
		hint1 = true
	else hint1 = false
	end
	
	function love.keypressed(key)
    if key == 'up' then
      TEsound.play(blip3)
			states.options_display_selected = (states.options_display_selected - 1)
		elseif key == 'down' then
      TEsound.play(blip3)
			states.options_display_selected = (states.options_display_selected + 1)
		end

		if key == 'return' then 
      TEsound.play(blip3)
			if states.options_display_selected == 1 then			-- FSAA
				mode.aa = (mode.aa + 4)
			elseif states.options_display_selected == 2 then		-- Vsync
				mode.vsync = not mode.vsync
			elseif states.options_display_selected == 3 then		-- Fullscreen
				mode.full = not mode.full
			elseif states.options_display_selected == 4 then
				update_settings()					-- Save
			elseif states.options_display_selected == 5 then		-- Back
				state = 'options'
			end
		end
	end
end

function options_sound_logic()
  if states.options_sound_selected == 1 then
    ax = 55
		ay = 560
  end
  
  function love.keypressed(key)
    if key == 'return' then
      TEsound.play(blip3)
      if states.options_sound_selected == 1 then
        state = 'options'
      end
    end
  end
end


--					//  START DRAWING STUFF  \\

function draw_menu()
	love.graphics.draw(dlogo, 150, 10)
	love.graphics.print("Play", 70, 200)
	love.graphics.print("Options", 70, 250)
	love.graphics.print("Credits", 70, 300)
	love.graphics.print("Quit", 70, 350)
end

function draw_options()
	love.graphics.print("Display", 70, 200)
	love.graphics.print("Sound", 70, 250)
	love.graphics.print("Back", 70, 560)
end

function draw_credits()		
	love.graphics.print("Thank you to the following:", 70, 95)
	love.graphics.print("zxbobxz", 70, 135)
	love.graphics.print("Maurice", 70, 155)
	love.graphics.print("Wagn", 70, 175)
	love.graphics.print("Moonbear/Wai-man", 70, 195)
	love.graphics.print("Archimaredes", 70, 215)
	love.graphics.print("Costinteo", 70, 235)
	love.graphics.print("Zeh Fernando for the font 'Perfect DOS'", 70, 255)
	love.graphics.print("Music by Patrick 'aceisclose' K.", 70, 275)
	love.graphics.print("LOVE2D 0.9.1", 70, 315)
	love.graphics.print("TEsound v1.3 by Ensayia & Taehl", 70, 335)
	love.graphics.print("TLfres by Taehl", 70, 355)
	love.graphics.draw(plogo, 178, 28)
	
	
	love.graphics.print("Back", 70, 560)
end

function draw_options_display()
  if mode.full == true then
    love.graphics.print("Fullscreen: Yes", 70, 200)
    else love.graphics.print("Fullscreen: No", 70, 200)
  end

  if mode.aa == 0 then
    love.graphics.print("Smooth graphics: Off", 70, 300) -- 0 FSAA or x4 FSAA
  elseif mode.aa == 4 then
    love.graphics.print("Smooth graphics: On", 70, 300)
  end
    
  if mode.vsync == true then
    love.graphics.print("Vertical Sync: On", 70, 250) -- vsync on or off
  else love.graphics.print("Vertical Sync: Off" , 70, 250)
  end
  
  if hint1 == true then
    love.graphics.print("Only on supported graphics cards.", 325, 560)
  end

  love.graphics.print("Apply", 70, 350)
  love.graphics.print("Back", 70, 560)
end

function draw_options_sound()
	love.graphics.print("Back", 70, 560)
end

function draw_arrow()
	love.graphics.print(">", ax, ay)
end