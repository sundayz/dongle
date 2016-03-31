function init_core()
	-- Fonts
	menufont = love.graphics.setNewFont("gfx/PerfectDOS.ttf", 24) --  .ttf, size
	-- gamefont = love.graphics.setNewFont("gfx/PerfectDOS.ttf", 24)
	
	-- Graphics
	love.graphics.setBackgroundColor(0, 0, 0) -- R, G, B
	logotest = love.graphics.newImage('gfx/test.png')
	mlogo = love.graphics.newImage('gfx/mlogo.png') -- unused
	dlogo = love.graphics.newImage('gfx/dlogo.png') -- v1.3
	plogo = love.graphics.newImage('gfx/plogo.png') -- banner
	
	-- Sound
	blip1 = love.sound.newSoundData('sfx/blip1.ogg')	-- Game
	blip2 = love.sound.newSoundData('sfx/blip2.ogg')	-- Game
	blip3 = love.sound.newSoundData('sfx/blip3.ogg') -- Menu
	startup = love.sound.newSoundData('sfx/Startup.ogg')
	-- music = love.sound.newSoundData('sfx/DENIAL.mp3')
	
	collisionsounds = {blip1, blip2}
  
  -- Language
  language = 1;
  
  options_language_name_selected = {
    [1] = 'English',
    [2] = 'Dutch',
    [3] = 'Irish',
    [4] = 'Welsh',
    [5] = 'Polish',
    [6] = 'Romanian'
  }
	
	-- Define these at start.
  mode = {
    w = 800,
    h = 600,
    full = false,
    vsync = true,
    aa = 0
  }
  
	-- States: 'menu', 'game', 'credits', 'options'
  states = {
    menu_selected = 1,
    options_selected = 1,
    credits_selected = 1,
    options_display_selected = 1,
    options_sound_selected = 1,
    options_language_selected = 1
  }
  
  local major, minor, revision = love.getVersion();
  print(string.format("LUA VERSION: %s, LOVE2D VERSION: %s, GAME VERSION: %s", _VERSION, major..minor..revision, "1.4"));
  --[[
    fsaastring = "Off"
    vsyncstring = tostring(vsync)
    aidiffstring = "Unavailable"
    pcolourstring = "Unavailable"
  --]]
end

function update_settings()
  TLfres.setScreen(mode, 800, false, false)  -- mode, extent (800), centre (false), stretch
end
