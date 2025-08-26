
local screen = require "lib.sunscreen"
local Player = require "src.player"
local loadmap = require "src.map.loadmap"

function love.load()
    screen:init({
        gameWidth = 320,
        gameHeight = 180,
        mode = "fit"
    })

    love.graphics.setDefaultFilter("nearest", "nearest")
    loadmap("test")
    player = Player.new(100, 100)
end

function love.update(dt)
    Player.update(player, dt)
end

function love.draw()
    screen:apply()
    love.graphics.setBackgroundColor(0.1, 0.1, 0.1)
    loadmap("test")
    Player.draw(player)
end

function love.resize(w, h)
    screen:onResize(w, h)
end