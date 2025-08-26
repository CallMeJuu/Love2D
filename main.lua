

local Player = require "src.player"

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    player = Player.new(100, 100)
end

function love.update(dt)
    Player.update(player, dt)
end

function love.draw()
    love.graphics.setBackgroundColor(0.1, 0.1, 0.1)
    Player.draw(player)
end
