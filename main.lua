
local gamestate = require "lib.gamestate"

local menu = require "src.screens.menu"
local game = require "src.screens.game"

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setBackgroundColor(0.2, 0.2, 0.2)

    gamestate.switch(menu)
end

function love.update(dt)
    gamestate:current():update(dt)
end

function love.draw()
    gamestate:current():draw()
end

function love.keypressed(key)
    -- This passes keypressed events to the current state
    if key == "space" and gamestate.current() == menu then
        gamestate.switch(game) -- Switch from menu to play
    elseif key == "escape" and gamestate.current() == game then
        gamestate.switch(menu) -- Switch from play back to menu
    else
        gamestate.current():keypressed(key) -- Pass other key presses to the state
    end
end