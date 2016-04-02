
-- Welcome to DONGLE. Inspired by DONG.
-- DEVELOPMENT VERSION
-- SEE LICENSE.TXT

require 'conf';
local ball     = require 'ball';
require 'player1';
require 'player2';
local core     = require 'core';
require 'TEsound';
require 'menu';
-- require 'ai'
local language = require 'LanguageMgr';
require 'splash';
require 'TLfres';

function love.load()
  -- init_core()          -- Variables and stuff
  -- print(string.format("LUA VERSION: %s, LOVE2D VERSION: %d.%d.%d, GAME VERSION: %d", _VERSION, core.major .. core.minor .. core.revision, core.VERSION));
  core.update_settings()    -- load the settings, set resolution, etc
	-- ball.init()          -- variables for the ball, such as velocity, position, etc
	init_p1()            -- variables for player 1
	init_p2()            -- variables for player 2
	--init_ai()          -- variables for AI [UNUSED]
	init_splash()        -- play splash sequence
	p1score = 0
	p2score = 0
	lasttouch = nil      -- which player touched the ball last?
  -- TEsound.playLooping(music, "music") 
  local count = 0;
  for i,v in pairs(_G) do
    count = count + 1;
    print(count, i, v);
  end
end




function love.update(dt)
	if state == 'splash' then
		update_splash(dt)
	end
	
	if state == 'game' then
	  TEsound.pause(music)
    ball.update(dt)
		ball.collision_top()                       -- collision with the top of the screen
		ball.collision_bot()                       -- collision with the bottom of the screen
		ball.collision_p1()                        -- collision with player 1
		-- ball.collision_ai()
		ball.collision_p2()                        -- collision with player 2
		ball.update_score()                        -- keeps the score
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
  
  if state == 'options_language' then
    options_language_logic()
  end
	
  if core.Debug then
    fps = 1 / dt -- Thanks to Bob!
  else end
  
	delta = dt -- Make dt global
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
		love.graphics.print(language[core.Language.language].P1_SCORE..p1score, 50, 550)
		love.graphics.print(language[core.Language.language].P2_SCORE..p2score, 550, 550)
		ball.draw()
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
  
  if state == 'options_language' then
    draw_options_language()
    draw_arrow()
  end
	
	if core.Debug then		-- For debugging.
    local info = [[
    Debug
    fps: %d
    dt: %.4f
    res: %dx%d
    state: %s
    mem: %.4fKB
    ]];
    love.graphics.print(string.format(info, fps, delta, core.Graphics.mode.w, core.Graphics.mode.h, tostring(state), collectgarbage('count')), 525, 5);
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
