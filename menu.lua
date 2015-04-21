function menu_logic()
	if menu_selected == 1 then 			-- EHHHHHHHHHH
		ax = 55
		ay = 200
	elseif menu_selected == 2 then
		ax = 55
		ay = 250
	elseif menu_selected == 3 then
		ax = 55
		ay = 300
	elseif menu_selected == 4 then
		ax = 55
		ay = 350
	end
	
	if playedintrosound == true then
		love.graphics.setColor(255, 255, 255, 255)
		playedintrosound = false
	end

function love.keypressed(key)
	if key == 'return' or key == 'up' or key == 'down' then
		TEsound.play(blip3)
	end
	
		-- MAIN MENU
		if key == 'up' then
			menu_selected = (menu_selected - 1)
		elseif key == 'down' then
			menu_selected = (menu_selected + 1)
		end
	
		if key == 'return' then			-- Thanks Torin
			if menu_selected == 1 then
				state = 'game'
				TEsound.stop("all")
			elseif menu_selected == 2 then
				state = 'options'
			elseif menu_selected == 3 then
				state = 'credits'
			elseif menu_selected == 4 then
				love.event.quit()
			end
		end
end
	
	if menu_selected > 4 then
		menu_selected = 1
	elseif menu_selected < 1 then
		menu_selected = 4
	end
end

function options_logic()				-- OPTIONS
	if options_selected == 1 then
		ax = 55
		ay = 200
	elseif options_selected == 2 then
		ax = 55
		ay = 250
	elseif options_selected == 3 then
		ax = 55
		ay = 300
	elseif options_selected == 4 then
		ax = 55
		ay = 350
	elseif options_selected == 5 then
		ax = 55
		ay = 560
	end
	
	if options_selected > 5 then
		options_selected = 1
	elseif options_selected < 1 then
		options_selected = 5
	end
	
	if setting_fsaa > 4 then
		setting_fsaa = 0
	end
	
	if options_selected == 1 then 			-- too many of these...
		hint1 = true
	else hint1 = false
	end
	
	function love.keypressed(key)
		if key == 'return' or key == 'up' or key == 'down' then
			TEsound.play(blip3)
		end
	
		if key == 'up' then
			options_selected = (options_selected - 1)
		elseif key == 'down' then
			options_selected = (options_selected + 1)
		end

		if key == 'return' then 
			if options_selected == 1 then			-- FSAA
				setting_fsaa = (setting_fsaa + 4)
			elseif options_selected == 2 then		-- Vsync
				setting_vsync = not setting_vsync
			elseif options_selected == 3 then		-- Fullscreen
				setting_fullscreen = not setting_fullscreen
			elseif options_selected == 4 then
				update_settings()					-- Save
			elseif options_selected == 5 then		-- Back
				state = 'menu'
			end
		end
	end
end

function credits_logic()						-- CREDITS
	if credits_selected == 1 then
		ax = 55
		ay = 560
	end
	
	function love.keypressed(key)
		if key == 'return' and credits_selected == 1 then
			state = 'menu'
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
	if setting_fsaa == 0 then
		love.graphics.print("Smooth graphics: Off", 70, 200) -- 0 FSAA or x4 FSAA
	elseif setting_fsaa == 4 then
		love.graphics.print("Smooth graphics: On", 70, 200)
	end
	
	if setting_vsync == true then
		love.graphics.print("Vertical Sync: On", 70, 250) -- vsync on or off
			else love.graphics.print("Vertical Sync: Off" , 70, 250)
	end
	
	if setting_fullscreen == true then
		love.graphics.print("Fullscreen: Yes", 70, 300)
			else love.graphics.print("Fullscreen: No", 70, 300)
	end
	
	if hint1 == true then
		love.graphics.print("Only on supported graphics cards.", 325, 560)
	end
	
	love.graphics.print("Apply", 70, 350)
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
	love.graphics.draw(plogo, 178, 28)
	
	
	love.graphics.print("Back", 70, 560)
	-- Bob
	-- Maurice
	-- Wagn
	-- Wai-man
	-- Torin
end

function draw_arrow()
	love.graphics.print(">", ax, ay)
end