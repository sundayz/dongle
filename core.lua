function init_core()
	-- Fonts
	menufont = love.graphics.setNewFont("gfx/PerfectDOS.ttf", 24) --  .ttf, size
	gamefont = love.graphics.setNewFont("gfx/PerfectDOS.ttf", 24)
	
	-- Graphics
	love.graphics.setBackgroundColor(0, 0, 0) -- R, G, B
	logotest = love.graphics.newImage('gfx/test.png')
	mlogo = love.graphics.newImage('gfx/mlogo.png')
	dlogo = love.graphics.newImage('gfx/dlogo.png')
	plogo = love.graphics.newImage('gfx/plogo.png')
	
	-- Sound
	blip1 = love.sound.newSoundData('sfx/blip1.ogg')	-- Game
	blip2 = love.sound.newSoundData('sfx/blip2.ogg')	-- Game
	blip3 = love.sound.newSoundData('sfx/blip3.ogg') -- Menu
	startup = love.sound.newSoundData('sfx/Startup.ogg')
	music = love.sound.newSoundData('sfx/DENIAL.mp3')
	
	collisionsounds = {blip1, blip2}
	
	-- Define these at start.
	setting_fullscreen = false
	setting_fullscreentype = "normal"
	setting_vsync = true
	setting_fsaa = 0
	
	-- States: 'menu', 'game', 'credits', 'options'
	menu_selected = 1
	options_selected = 1
	credits_selected = 1
	
	fsaastring = "Off"
	vsyncstring = tostring(vsync)
	aidiffstring = "Unavailable"
	pcolourstring = "Unavailable"
end

function update_settings()	
    love.window.setMode(800, 600, {fullscreen = setting_fullscreen, fullscreentype = setting_fullscreentype, vsync = setting_vsync, fsaa = setting_fsaa})
end
