
-- Welcome to DONGLE. Inspired by DONG.
-- Visit torin.org.uk for more.
-- DEVELOPMENT VERSION
-- SEE LICENSE.TXT

	require 'conf'
	require 'ball'
	require 'player1'
	require 'player2'
	require 'core'
	require 'TEsound'
	require 'menu'
	require 'ai'
	require 'splash'
  require 'TLfres'

function love.load()
	init_core()                                           -- Variables and stuff
  update_settings()                                 -- load the settings, set resolution, etc
	init_ball()                                            -- variables for the ball, such as velocity, position, etc
	init_p1()                                             -- variables for player 1
	init_p2()                                             -- variables for player 2
	--init_ai()                                           -- variables for AI [UNUSED]
	init_splash()                                        -- play splash sequence
	
	debugg = true                                     -- enables debugging info display
	p1score = 0
	p2score = 0
	lasttouch = nil                                     -- which player touched the ball last?
  TEsound.playLooping(music, "music") 
end




function love.update(dt)
	if state == 'splash' then
		update_splash(dt)
	end
	
	if state == 'game' then
	  TEsound.pause(music)
		update_ball(dt)
		ball_collision_top()                       -- collision with the top of the screen
		ball_collision_bot()                       -- collision with the bottom of the screen
		ball_collision_p1()                        -- collision withj player 1
		--ball_collision_ai()
		ball_collision_p2()                        -- collision withj player 2
		ball_update_score()                     -- keeps the score
		update_p1(dt)
		--update_ai(dt)
		update_p2(dt)
		function love.keypressed(key)
			if key == 'escape' then
				state = 'menu'
				TEsound.stop("music")
			end
		end
	end

	if state == 'menu' then
		menu_logic()
	end
	
	if state == 'options' then
		options_logic()
	end
  
  if state == 'options_display' then
    options_display_logic()
  end
	
  if state == 'options_sound' then
    options_sound_logic()
  end
  
	if state == 'credits' then
		credits_logic()
	end
	
	fps = 1 / dt -- Thanks to Bob!
	delta = 1 + dt -- Make dt global
	TEsound.cleanup()
end


function love.draw()
  TLfres.transform()
	if state == 'splash' then
		draw_splash()
	end
	
	if state == 'menu' then
	--	love.graphics.setFont(menufont)
		draw_menu()
		draw_arrow()
	end
	
	if state == 'game' then
		--love.graphics.setFont(gamefont)
		love.graphics.print("Player 1 score: "..p1score, 50, 550)
		love.graphics.print("Player 2 score: "..p2score, 550, 550)
		draw_ball()
		draw_p1()
		draw_p2()
		--draw_ai()
	end
	
	if state == 'options' then
		draw_options()
		draw_arrow()
	end
  
  if state == 'options_display' then
    draw_options_display()
    draw_arrow()
  end
  
  if state == 'options_sound' then
    draw_options_sound()
    draw_arrow()
  end
	
	if state == 'credits' then
		draw_credits()
		draw_arrow()
	end
	
	if debugg == true then		-- For debugging.
		love.graphics.print("Debug", 500, 5)
		love.graphics.print("fps: "..(fps), 500, 25)
		love.graphics.print("dt: "..delta, 500, 45) -- time since last frame.
		love.graphics.print("bspx: "..bspx, 500, 65)
		love.graphics.print("bspy: "..bspy, 500, 85)
		love.graphics.print("state: "..tostring(state), 500, 105)
	end
   --TLfres.letterbox(4, 3)     -- aspect ratio
end


--[[ CHUNKS - FROM https://www.love2d.org/wiki/love.filesystem.load

local ok, chunk, result
ok, chunk = pcall( love.filesystem.load, name ) -- load the chunk safely
	if not ok then
		print('The following error happend: ' .. tostring(chunk))
			else
				ok, result = pcall(chunk) -- execute the chunk safely

	if not ok then -- will be false if there is an error
		print('The following error happened: ' .. tostring(result))
			else
				print('The result of loading is: ' .. tostring(result))
	end
end

--]]
