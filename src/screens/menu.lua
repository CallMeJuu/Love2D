
local menu = {}

function menu:enter()
    
end

function menu:update(dt)
    
end

function menu:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Welcome to the Menu!", 100, 100)
end

return menu