
local screen = require "lib.sunscreen"
local Player = require "src.player"

function love.load()
    screen:init({
        gameWidth = 480,
        gameHeight = 270,
        mode = "stretch"
    })

    love.graphics.setDefaultFilter("nearest", "nearest")
    player = Player.new(100, 100)
end

function love.update(dt)
    Player.update(player, dt)
end

function love.draw()
    screen:apply()
    love.graphics.setBackgroundColor(0.1, 0.1, 0.1)
    Player.draw(player)
end

function love.resize(w, h)
    screen:onResize(w, h)
end