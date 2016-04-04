local core     = require 'core';
local ai       = require 'ai';
local language = require 'LanguageMgr';

local menu = {};
-- Yeah, I did a really bad job of this and there's no going back.
-- Enjoy the massive nested if/else statements.

function menu.menu_logic()
	if core.states.menu_selected == 1 then 			-- EHHHHHHHHHH
		menu.ax = 55
		menu.ay = 200
	elseif core.states.menu_selected == 2 then
		menu.ax = 55
		menu.ay = 250
	elseif core.states.menu_selected == 3 then
		menu.ax = 55
		menu.ay = 300
	elseif core.states.menu_selected == 4 then
		menu.ax = 55
		menu.ay = 350
	end

  function love.keypressed(key)
      -- MAIN MENU
      if key == 'up' then
        core.states.menu_selected = (core.states.menu_selected - 1)
        TEsound.play(core.Sound.blip3)
      elseif key == 'down' then
        TEsound.play(core.Sound.blip3)
        core.states.menu_selected = (core.states.menu_selected + 1)
      end
    
      if key == 'return' then			-- Thanks Torin
        TEsound.play(core.Sound.blip3)
        if core.states.menu_selected == 1 then
          core.state = 'play_menu';
          TEsound.stop("all")
        elseif core.states.menu_selected == 2 then
          core.state = 'options'
        elseif core.states.menu_selected == 3 then
          core.state = 'credits'
        elseif core.states.menu_selected == 4 then
          love.event.quit()         -- exit game code
        end
      end
  end
	
	if core.states.menu_selected > 4 then
		core.states.menu_selected = 1
	elseif core.states.menu_selected < 1 then
		core.states.menu_selected = 4
	end
end

function menu.options_logic()				-- OPTIONS
  if core.states.options_selected == 1 then
    menu.ax = 55
    menu.ay = 200
  elseif core.states.options_selected == 2 then
    menu.ax = 55
		menu.ay = 250
	elseif core.states.options_selected == 3 then
    menu.ax = 55
    menu.ay = 300
  elseif core.states.options_selected == 4 then
    menu.ax = 55
    menu.ay = 560
  end
  
  function love.keypressed(key)  
    if key == 'up' then
      TEsound.play(core.Sound.blip3)
      core.states.options_selected = (core.states.options_selected - 1)
    elseif key == 'down' then
      TEsound.play(core.Sound.blip3)
      core.states.options_selected = (core.states.options_selected + 1)
    end
    
    if key == 'return' then 
      TEsound.play(core.Sound.blip3)
      if core.states.options_selected == 1 then
        core.state = 'options_display'
      elseif core.states.options_selected == 2 then
        core.state = 'options_sound'
      elseif core.states.options_selected == 3 then
        core.state = 'options_language'
      elseif core.states.options_selected == 4 then
        core.state = 'menu'
      end
    end
  end
  
  if core.states.options_selected > 4 then
    core.states.options_selected = 1
	elseif core.states.options_selected < 1 then
    core.states.options_selected = 4
  end
end
 
function menu.credits_logic()						-- CREDITS
  if core.states.credits_selected == 1 then
    menu.ax = 55
    menu.ay = 560
  end

  function love.keypressed(key)
    if key == 'return' and core.states.credits_selected == 1 then
      TEsound.play(core.Sound.blip3)
      core.state = 'menu'
    end	
  end
end

function menu.options_display_logic()   -- DISplay OPTIONS
	if core.states.options_display_selected == 1 then
		menu.ax = 55
		menu.ay = 200
	elseif core.states.options_display_selected == 2 then
		menu.ax = 55
		menu.ay = 250
	elseif core.states.options_display_selected == 3 then
		menu.ax = 55
		menu.ay = 300
	elseif core.states.options_display_selected == 4 then
		menu.ax = 55
		menu.ay = 350
	elseif core.states.options_display_selected == 5 then
		menu.ax = 55
		menu.ay = 560
	end
	
	if core.states.options_display_selected > 5 then
		core.states.options_display_selected = 1
	elseif core.states.options_display_selected < 1 then
		core.states.options_display_selected = 5
	end
	
	if core.Graphics.mode.aa > 4 then
		core.Graphics.mode.aa = 0
	end
	
	if core.states.options_display_selected == 3 then
		hint1 = true
	else hint1 = false
	end
	
	function love.keypressed(key)
    if key == 'up' then
      TEsound.play(core.Sound.blip3)
			core.states.options_display_selected = (core.states.options_display_selected - 1)
		elseif key == 'down' then
      TEsound.play(core.Sound.blip3)
			core.states.options_display_selected = (core.states.options_display_selected + 1)
		end

		if key == 'return' then 
      TEsound.play(core.Sound.blip3)
			if core.states.options_display_selected == 1 then
				core.Graphics.mode.full = not core.Graphics.mode.full;
			elseif core.states.options_display_selected == 2 then
				core.Graphics.mode.vsync = not core.Graphics.mode.vsync;
			elseif core.states.options_display_selected == 3 then	
        core.Graphics.mode.aa = (core.Graphics.mode.aa + 4);
			elseif core.states.options_display_selected == 4 then    -- Save
				core.update_settings();
			elseif core.states.options_display_selected == 5 then		-- Back
				core.state = 'options';
			end
		end
	end
end

function menu.options_sound_logic()
  if core.states.options_sound_selected == 1 then
    menu.ax = 55
		menu.ay = 560
	elseif core.states.options_sound_selected == 2 then
		menu.ax = 55
		menu.ay = 350
	elseif ccore.states.options_sound_selected == 3 then
		menu.ax = 55
		menu.ay = 560
	end
  
  function love.keypressed(key)
    if key == 'return' then
      TEsound.play(core.Sound.blip3)
      if core.states.options_sound_selected == 1 then
        core.state = 'options'
      end
    end
  end
end

function menu.options_language_logic()
  if core.states.options_language_selected == 1 then
    menu.ax = 55;
		menu.ay = 180;
  elseif core.states.options_language_selected == 2 then
    menu.ax = 55;
    menu.ay = 520;
	elseif core.states.options_language_selected == 3 then
		menu.ax = 55;
		menu.ay = 560;
	end
  
  function love.keypressed(key)
    if key == 'up' then     -- MENU NAVIGATION
      TEsound.play(core.Sound.blip3)
      core.states.options_language_selected = (core.states.options_language_selected - 1);
    elseif key == 'down' then     -- MENU NAVIGATION
      TEsound.play(core.Sound.blip3)
      core.states.options_language_selected = (core.states.options_language_selected + 1);
    elseif key == 'left' then      
      TEsound.play(core.Sound.blip3)
      if core.states.options_language_selected == 1 then   -- LANGUAGE SELECTION
        if (core.Language.language - 1) >= 1 then
          core.Language.language = core.Language.language - 1;
        else
          TEsound.play(core.Sound.invalid);
        end
      end
    elseif key == 'right' then
      TEsound.play(core.Sound.blip3)
      if core.states.options_language_selected == 1 then   -- LANGUAGE SELECTION
        if (core.Language.language + 1) <= #language then
          core.Language.language = core.Language.language + 1;
        else
          TEsound.play(core.Sound.invalid);
        end
      end
    elseif key == 'return' then
      TEsound.play(core.Sound.blip3)
      if core.states.options_language_selected == 2 then
        love.system.openURL("http://sundays.org.uk/");
      elseif core.states.options_language_selected == 3 then
        core.state = 'options';
      end
    end
  end
  
  if core.states.options_language_selected > 3 then
		core.states.options_language_selected = 1
	elseif core.states.options_language_selected < 1 then
		core.states.options_language_selected = 3
	end
end

function menu.play_menu_logic()
  if core.states.play_menu_selected == 1 then
    menu.ax = 55;
		menu.ay = 200;
  elseif core.states.play_menu_selected == 2 then
    menu.ax = 55;
    menu.ay = 250;
	elseif core.states.play_menu_selected == 3 then
		menu.ax = 55;
		menu.ay = 300;
  elseif core.states.play_menu_selected == 4 then
    menu.ax = 55;
    menu.ay = 560;
	end
  
  function love.keypressed(key)
    if key == 'up' then
      TEsound.play(core.Sound.blip3);
      core.states.play_menu_selected = core.states.play_menu_selected - 1;
    elseif key == 'down' then
      TEsound.play(core.Sound.blip3);
			core.states.play_menu_selected = core.states.play_menu_selected + 1;
		end
    if key == 'return' then
      TEsound.play(core.Sound.blip3);
      if core.states.play_menu_selected == 1 then
        core.state = 'difficulty_menu';
      elseif core.states.play_menu_selected == 2 then
        TEsound.play(core.Sound.invalid);
      elseif core.states.play_menu_selected == 3 then
        TEsound.play(core.Sound.invalid);
      elseif core.states.play_menu_selected == 4 then
        core.state = 'menu';
      end
    end
  end
  
  if core.states.play_menu_selected > 4 then
    core.states.play_menu_selected = 1;
  elseif core.states.play_menu_selected < 1 then
    core.states.play_menu_selected = 4;
  end
end

function menu.difficulty_menu_logic()
  if core.states.difficulty_menu_selected == 1 then
    menu.ax = 55;
		menu.ay = 200;
  elseif core.states.difficulty_menu_selected == 2 then
    menu.ax = 55;
    menu.ay = 250;
	elseif core.states.difficulty_menu_selected == 3 then
		menu.ax = 55;
		menu.ay = 300;
  elseif core.states.difficulty_menu_selected == 4 then
    menu.ax = 55;
    menu.ay = 560;
	end
  
  function love.keypressed(key)
    if key == 'up' then
      TEsound.play(core.Sound.blip3);
      core.states.difficulty_menu_selected = core.states.difficulty_menu_selected - 1;
    elseif key == 'down' then
      TEsound.play(core.Sound.blip3);
      core.states.difficulty_menu_selected = core.states.difficulty_menu_selected + 1;
    end
    if key == 'return' then
      if core.states.difficulty_menu_selected == 1 then
        ai.difficulty = 0.45;
        core.state = 'game';
      elseif core.states.difficulty_menu_selected == 2 then
        ai.difficulty = 0.30;
        core.state = 'game';
      elseif core.states.difficulty_menu_selected == 3 then
        ai.difficulty = 0.15;
        core.state = 'game';
      elseif core.states.difficulty_menu_selected == 4 then
        core.state = 'play_menu';
      end
    end
  end
  
  if core.states.difficulty_menu_selected > 4 then
    core.states.difficulty_menu_selected = 1;
  elseif core.states.difficulty_menu_selected < 1 then
    core.states.difficulty_menu_selected = 4;
  end
end

--					//  START DRAWING STUFF  \\

function menu.draw_menu()
	love.graphics.draw(core.Graphics.dlogo, 150, 10)
	love.graphics.print(language[core.Language.language].MENU_PLAY, 70, 200)
	love.graphics.print(language[core.Language.language].MENU_OPTIONS, 70, 250)
	love.graphics.print(language[core.Language.language].MENU_CREDITS, 70, 300)
	love.graphics.print(language[core.Language.language].MENU_QUIT, 70, 350)
end

function menu.draw_play_menu()
  love.graphics.print(language[core.Language.language].PLAY_SINGLEPLAYER, 70, 200);
  love.graphics.print(language[core.Language.language].PLAY_MULTIPLAYER, 70, 250);
  love.graphics.print(language[core.Language.language].PLAY_ONLINE, 70, 300);
  love.graphics.print(language[core.Language.language].OPTIONS_BACK, 70, 560);
  if core.states.play_menu_selected == 2 then
    love.graphics.draw(core.Graphics.locked, 250, 250, 0, 0.5, 0.5);
  elseif core.states.play_menu_selected == 3 then
    love.graphics.draw(core.Graphics.locked, 250, 300, 0, 0.5, 0.5);
  end
end

function menu.draw_difficulty_menu()
  love.graphics.print(language[core.Language.language].PLAY_DIFFICULTY, 70, 100);
  love.graphics.print(language[core.Language.language].PLAY_EASY, 70, 200);
  love.graphics.print(language[core.Language.language].PLAY_MEDIUM, 70, 250);
  love.graphics.print(language[core.Language.language].PLAY_HARD, 70, 300);
  love.graphics.print(language[core.Language.language].OPTIONS_BACK, 70, 560);
end

function menu.draw_options()
	love.graphics.print(language[core.Language.language].OPTIONS_DISPLAY, 70, 200)
	love.graphics.print(language[core.Language.language].OPTIONS_SOUND, 70, 250)
  love.graphics.print(language[core.Language.language].OPTIONS_LANGUAGE, 70, 300)
	love.graphics.print(language[core.Language.language].OPTIONS_BACK, 70, 560)
end

function menu.draw_credits()		
	love.graphics.draw(core.Graphics.plogo, 178, 28)
	love.graphics.print(language[core.Language.language].CREDITS_1, 70, 95)
	love.graphics.print(language[core.Language.language].CREDITS_2, 70, 135)
	love.graphics.print(language[core.Language.language].CREDITS_3, 70, 155)
	love.graphics.print(language[core.Language.language].CREDITS_4, 70, 175)
	love.graphics.print(language[core.Language.language].CREDITS_5, 70, 195)
	love.graphics.print(language[core.Language.language].CREDITS_6, 70, 215)
	love.graphics.print(language[core.Language.language].CREDITS_7, 70, 235)
	love.graphics.print(language[core.Language.language].CREDITS_8, 70, 255)
	love.graphics.print(language[core.Language.language].CREDITS_9, 70, 275)
	love.graphics.print(language[core.Language.language].CREDITS_10, 70, 315)
	love.graphics.print(language[core.Language.language].CREDITS_11, 70, 335)
	love.graphics.print(language[core.Language.language].CREDITS_12, 70, 355)
	love.graphics.print(language[core.Language.language].OPTIONS_BACK, 70, 560)
end

function menu.draw_options_display()
  if core.Graphics.mode.full then
    love.graphics.print(language[core.Language.language].OPTIONS_FULLSCREEN_Y, 70, 200)
    else love.graphics.print(language[core.Language.language].OPTIONS_FULLSCREEN_N, 70, 200)
  end

  if core.Graphics.mode.aa ~= 4 then
    love.graphics.print(language[core.Language.language].OPTIONS_AA_N, 70, 300) -- 0 FSAA or x4 FSAA
  else
    love.graphics.print(language[core.Language.language].OPTIONS_AA_Y, 70, 300)
  end
    
  if core.Graphics.mode.vsync then
    love.graphics.print(language[core.Language.language].OPTIONS_VSYNC_Y, 70, 250) -- vsync on or off
  else love.graphics.print(language[core.Language.language].OPTIONS_VSYNC_N , 70, 250)
  end
  
  if hint1 then
    love.graphics.print(language[core.Language.language].OPTIONS_HINT1, 325, 560)
  end
  love.graphics.print(language[core.Language.language].OPTIONS_APPLY, 70, 350)
  love.graphics.print(language[core.Language.language].OPTIONS_BACK, 70, 560)
end

function menu.draw_options_sound()
	love.graphics.print(language[core.Language.language].OPTIONS_BACK, 70, 560)
end

function menu.draw_options_language()
  love.graphics.print(language[core.Language.language].OPTIONS_LANGUAGE .. ": ", 70, 180)
  love.graphics.print(core.Language.options_language_name_selected[core.Language.language], 240, 180)
  love.graphics.print(language[core.Language.language].TRANSLATOR, 70, 520);
  love.graphics.print(language[core.Language.language].OPTIONS_BACK, 70, 560)
end

function menu.draw_arrow()
  love.graphics.print(">", menu.ax, menu.ay)
end

return menu;
