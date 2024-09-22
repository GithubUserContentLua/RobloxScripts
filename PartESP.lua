-- Configuration
local espColor = Color3.fromRGB(255, 0, 0) -- Set the ESP color to red
local espTransparency = 1 -- Transparency set to 1 for no filling (fully transparent)

-- Function to create ESP for a part
local function createESP(part)
    if part:IsA("BasePart") then
        local box = Instance.new("SelectionBox")
        box.Adornee = part
        box.Color3 = espColor
        box.LineThickness = 0.05 -- Adjust the thickness of the outline
        box.SurfaceTransparency = espTransparency -- Ensure no filling
        box.AlwaysOnTop = true
        box.Parent = part
    end
end

-- Adding ESP to all parts in the workspace
for _, part in pairs(workspace:GetDescendants()) do
    createESP(part)
end

-- Adding ESP to new parts that are added to the workspace
workspace.DescendantAdded:Connect(function(part)
    createESP(part)
end)
