function loadmap(mapname)
    local sti = require "lib.sti"
    local map = sti("data/maps/" .. mapname .. ".lua")

    if map then
        if map.layers["Ground"] then
            map:drawLayer(map.layers["Ground"])
        end

        if map.layers["Ground Top"] then
            map:drawLayer(map.layers["Ground Top"])
        end
    end
end

return loadmap