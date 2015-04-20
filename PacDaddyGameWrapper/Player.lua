require("PacDaddyGameWrapper/PactorCollisionFunction")
local Pactor = require("PacDaddyGameWrapper/Pactor")

local player = Pactor:new()
player:setAttribute("IS_PLAYER", true)

local function onPactorCollision(otherPactorAttributes)
    if otherPactorAttributes:getValueOf("IS_ENEMY") 
    and not otherPactorAttributes:getValueOf("IS_PICKUP") then
        player:respawn()
        local gameAttributes = GAME:getModifiableAttributes()
        gameAttributes:setAttribute("LIVES", gameAttributes:getValueOf("LIVES") - 1)
    end
end

player:setOnCollisionFunction(PactorCollisionFunction(onPactorCollision))

return player