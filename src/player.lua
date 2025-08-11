
local Class = require 'lib.middleclass'
local Vector = require 'lib.vector'
local Anim8 = require 'lib.anim8'

local player = Class('player')

function player:initialize(x, y)
    self.position = Vector(x or 0, y or 0)
    self.speed = 200
    self.SpriteSheet = love.graphics.newImage('graphics/Player/Player_SpriteSheet.png')
end

function player:update(dt)
    
end

function player:draw()
    
end