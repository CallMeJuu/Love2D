local anim8 = require "lib.anim8"
local vector = require "lib.vector"

local Player = {}

function Player.new(x, y)
    local player = {}

    player.x = x or 0
    player.y = y or 0
    player.speed = 150
    player.scaleX = 1
    player.scaleY = 1
    player.flipH = false
    player.flipV = false
    player.dir = "down"
    player.state = "idle" -- idle

    -- Sprite Sheet and Grid for Animation
    player.spriteSheet = love.graphics.newImage("graphics/player/player_spritesheet.png")
    player.grid = anim8.newGrid(64, 64, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())

    -- Animations
    player.animations = {}
    player.animations.idle_down = anim8.newAnimation(player.grid("1-6", 1), 0.1)
    player.animations.idle_side = anim8.newAnimation(player.grid("1-6", 2), 0.1)
    player.animations.idle_up = anim8.newAnimation(player.grid("1-6", 3), 0.1)

    player.animations.walk_down = anim8.newAnimation(player.grid("1-6", 4), 0.1)
    player.animations.walk_side = anim8.newAnimation(player.grid("1-6", 5), 0.1)
    player.animations.walk_up = anim8.newAnimation(player.grid("1-6", 6), 0.1)

    player.anim = player.animations[player.state .. "_" .. player.dir]

    return player
end

function Player.update(player, dt)
    if player.anim then
        player.anim:update(dt)
    end
    -- Movement
    Player.movement(player, dt)
end

function Player.movement(player, dt)
    local moved = false

    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        player.y = player.y - player.speed * dt
        player.dir = "up"
        player.state = "walk"
        moved = true
    elseif love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        player.y = player.y + player.speed * dt
        player.dir = "down"
        player.state = "walk"
        moved = true
    elseif love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        player.x = player.x - player.speed * dt
        player.dir = "left"
        player.state = "walk"
        player.flipH = true      -- flip when moving left
        moved = true
    elseif love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        player.x = player.x + player.speed * dt
        player.dir = "right"
        player.state = "walk"
        player.flipH = false     -- don't flip when moving right
        moved = true
    end

    if not moved then
        player.state = "idle"
    end

    -- Always use side animation for left/right, flip if right
    if player.dir == "left" or player.dir == "right" then
        player.anim = player.animations[player.state .. "_side"]
    else
        player.anim = player.animations[player.state .. "_" .. player.dir]
    end
end

function Player.draw(player)
    if player.anim then
        local scaleX = player.scaleX
        local offsetX = 16
        if player.flipH then
            scaleX = -player.scaleX
            offsetX = 48 -- 64 - 16, keeps sprite in place when flipped
        end
        player.anim:draw(player.spriteSheet, player.x, player.y, 0, scaleX, player.scaleY, offsetX, 16)
    end
end

return Player