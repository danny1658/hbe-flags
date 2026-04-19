local HitboxManager = {}
HitboxManager.__index = HitboxManager

function HitboxManager:new()
    local self = setmetatable({}, HitboxManager)
    self.hitboxes = {}
    return self
end

function HitboxManager:addHitbox(player, size, color)
    if not self.hitboxes[player] then
        self.hitboxes[player] = {size = size, color = color}
        -- Code to visually add the hitbox in the game
    end
end

function HitboxManager:removeHitbox(player)
    if self.hitboxes[player] then
        self.hitboxes[player] = nil
        -- Code to visually remove the hitbox in the game
    end
end

function HitboxManager:setHitboxSize(player, size)
    if self.hitboxes[player] then
        self.hitboxes[player].size = size
        -- Code to update the size of the existing hitbox in the game
    end
end

function HitboxManager:setHitboxColor(player, color)
    if self.hitboxes[player] then
        self.hitboxes[player].color = color
        -- Code to update the color of the existing hitbox in the game
    end
end

return HitboxManager
