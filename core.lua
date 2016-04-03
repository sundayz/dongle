require 'TLfres';

local DONGLE = {
  VERSION = 1.4,
  Debug = true,
  Graphics = {
    love.graphics.setBackgroundColor(0, 0, 0), -- R, G, B
    logotest = love.graphics.newImage('gfx/test.png'),
    mlogo = love.graphics.newImage('gfx/mlogo.png'), -- unused
    dlogo = love.graphics.newImage('gfx/dlogo.png'), -- v1.3
    plogo = love.graphics.newImage('gfx/plogo.png'), -- banner
    menufont = love.graphics.setNewFont("gfx/PerfectDOS.ttf", 24), --  .ttf, size
	  -- gamefont = love.graphics.setNewFont("gfx/PerfectDOS.ttf", 24)
    mode = {
      w = 800,
      h = 600,
      full = false,
      vsync = true,
      aa = 0;
    };
	},
  Sound = {
    blip1   = love.sound.newSoundData('sfx/blip1.ogg'),	-- Game
    blip2   = love.sound.newSoundData('sfx/blip2.ogg'),	-- Game
    blip3   = love.sound.newSoundData('sfx/blip3.ogg'), -- Menu
    invalid = love.sound.newSoundData('sfx/invalid.ogg');
    startup = love.sound.newSoundData('sfx/Startup.ogg');
    -- music = love.sound.newSoundData('sfx/DENIAL.mp3'),
  },
  Language = {
    language = 1; -- Default
    options_language_name_selected = {
      [1] = 'English',
      [2] = 'English (US)',
      [3] = 'Dutch',
      [4] = 'Irish',
      [5] = 'Welsh',
      [6] = 'Polish',
      [7] = 'Romanian';
    };
  },
  states = {
    menu_selected = 1,
    play_menu_selected = 1,
    difficulty_menu_selected = 1,
    options_selected = 1,
    credits_selected = 1,
    options_display_selected = 1,
    options_sound_selected = 1,
    options_language_selected = 1;
  },
  state = 'splash',
};

DONGLE.major, DONGLE.minor, DONGLE.revision = love.getVersion();

function DONGLE.update_settings()
  print("Updating display.");
  TLfres.setScreen(DONGLE.Graphics.mode, 800, false, false)  -- mode, extent (800), centre (false), stretch
end

return DONGLE;
