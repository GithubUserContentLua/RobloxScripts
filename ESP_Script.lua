local players = game:GetService("Players")
local player = players.LocalPlayer

-- Function to create ESP
local function createESP(object)
    if object:IsA("Part") and not object.Anchored then
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Size = UDim2.new(0, 100, 0, 100) -- Adjust size as needed
        billboardGui.Adornee = object
        billboardGui.AlwaysOnTop = true
        
        local outlineFrame = Instance.new("Frame")
        outlineFrame.Size = UDim2.new(1, 0, 1, 0)
        outlineFrame.BackgroundColor3 = Color3.new(1, 0, 0) -- Red outline
        outlineFrame.BackgroundTransparency = 0.7 -- Adjust transparency
        outlineFrame.BorderSizePixel = 0
        outlineFrame.Parent = billboardGui
        
        billboardGui.Parent = object
    end
end

-- Connect to when unanchored parts are added
game.Workspace.ChildAdded:Connect(function(child)
    createESP(child)
end)

-- ESP for existing unanchored parts
for _, child in pairs(game.Workspace:GetChildren()) do
    createESP(child)
end
