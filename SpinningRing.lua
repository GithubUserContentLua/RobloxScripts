local Players = game:GetService("Players")
local radius = 100 -- Set the radius to 100
local numParts = 12 -- Number of parts in the ring
local speed = 2 -- Speed of rotation

local function createSpinningRing(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local parts = {}

    -- Create the parts
    for i = 1, numParts do
        local part = Instance.new("Part")
        part.Size = Vector3.new(1, 1, 1) -- Size of each part
        part.Anchored = false
        part.CanCollide = false
        part.BrickColor = BrickColor.new("Bright orange") -- Color of the parts
        part.Material = Enum.Material.Neon
        part.Parent = workspace
        
        -- Calculate position in a circular formation
        local angle = (i / numParts) * math.pi * 2
        local x = radius * math.cos(angle)
        local z = radius * math.sin(angle)
        part.Position = rootPart.Position + Vector3.new(x, 0, z)
        
        table.insert(parts, part)
    end

    -- Function to update the positions of the parts
    while true do
        wait(0.03) -- Adjust for performance
        local angleOffset = tick() * speed -- Rotate based on time

        for i, part in ipairs(parts) do
            local angle = (i / numParts) * math.pi * 2 + angleOffset
            local x = radius * math.cos(angle)
            local z = radius * math.sin(angle)
            part.Position = rootPart.Position + Vector3.new(x, 0, z)
        end
    end
end

-- Listen for player joining to create a ring
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        createSpinningRing(player)
    end)
end)
