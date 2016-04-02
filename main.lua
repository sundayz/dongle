
-- Welcome to DONGLE. Inspired by DONG.
-- DEVELOPMENT VERSION
-- SEE LICENSE.TXT

require 'conf';
require 'TLfres';
require 'TEsound';

local ball     = require 'ball';
local player   = require 'player1';
local player2  = require 'player2';
local core     = require 'core';
local menu     = require 'menu';
local language = require 'LanguageMgr';
local splash   = require 'splash';

function love.load()
  print(string.format("LUA VERSION: %s, LOVE2D VERSION: %d.%d.%d, GAME VERSION: %d", _VERSION, core.major, core.minor, core.revision, core.VERSION));
  core.update_settings()    -- load the settings, set resolution, etc
	-- ball.init()          -- variables for the ball, such as velocity, position, etc
	--init_ai()          -- variables for AI [UNUSED]
	p1score = 0
	p2score = 0
  -- TEsound.playLooping(music, "music") 
  local count = 0;
  for i,v in pairs(_G) do
    count = count + 1;
    print(count, i, v);
  end
end




function love.update(dt)
	if core.state == 'splash' then
		splash.update(dt)
	end
	
	if core.state == 'game' then
	  TEsound.pause(music)
    ball.update(dt)
		ball.collision_top();                       -- collision with the top of the screen
		ball.collision_bot();                       -- collision with the bottom of the screen
		ball.collision_p1();                        -- collision with player 1
		ball.collision_p2();                        -- collision with player 2
		ball.update_score();                        -- keeps the score
		player.update(dt);
		player2.update(dt);
		function love.keypressed(key)
			if key == 'escape' then
				core.state = 'menu';
				TEsound.stop("music")
			end
		end
	end

	if core.state == 'menu' then
		menu.menu_logic();
	end
	
	if core.state == 'options' then
		menu.options_logic();
	end
  
  if core.state == 'options_display' then
    menu.options_display_logic();
  end
	
  if core.state == 'options_sound' then
    menu.options_sound_logic();
  end
  
	if core.state == 'credits' then
		menu.credits_logic();
	end
  
  if core.state == 'options_language' then
    menu.options_language_logic();
  end
	
  if core.Debug then
    fps = 1 / dt -- Thanks to Bob!
  else end
  
	delta = dt -- Make dt global
	TEsound.cleanup()
end


function love.draw()
  TLfres.transform()
	if core.state == 'splash' then
    splash.draw();
	end
	
	if core.state == 'menu' then
	--	love.graphics.setFont(menufont)
		menu.draw_menu()
		menu.draw_arrow()
	end
	
	if core.state == 'game' then
		--love.graphics.setFont(gamefont)
		love.graphics.print(language[core.Language.language].P1_SCORE..p1score, 50, 550)
		love.graphics.print(language[core.Language.language].P2_SCORE..p2score, 550, 550)
		ball.draw();
    player.draw();
    player2.draw();
		--draw_ai()
	end
	
	if core.state == 'options' then
		menu.draw_options();
		menu.draw_arrow();
	end
  
  if core.state == 'options_display' then
    menu.draw_options_display();
    menu.draw_arrow();
  end
  
  if core.state == 'options_sound' then
    menu.draw_options_sound();
    menu.draw_arrow();
  end
	
	if core.state == 'credits' then
		menu.draw_credits();
		menu.draw_arrow();
	end
  
  if core.state == 'options_language' then
    menu.draw_options_language();
    menu.draw_arrow();
  end
	
	if core.Debug then		-- For debugging.
    local info = [[
    Debug
    fps: %d
    dt: %.4f
    res: %dx%d
    state: %s
    mem: %.2fKB
    ]];
    love.graphics.print(string.format(info, fps, delta, core.Graphics.mode.w, core.Graphics.mode.h, tostring(core.state), collectgarbage('count')), 525, 5);
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
