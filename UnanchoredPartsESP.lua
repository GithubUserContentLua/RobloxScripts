-- ESP Script for Unanchored Parts using SelectionBox with Orange Outline

-- Function to create an outline around a part
local function createESP(part)
    if not part:FindFirstChild("ESPOutline") then
        local selectionBox = Instance.new("SelectionBox")
        selectionBox.Name = "ESPOutline"
        selectionBox.Adornee = part
        selectionBox.LineThickness = 0.05 -- Thickness of the outline
        selectionBox.Color3 = Color3.fromRGB(255, 165, 0) -- Orange color for the outline
        selectionBox.SurfaceTransparency = 1 -- Fully transparent fill
        selectionBox.Parent = part
    end
end

-- Function to remove the outline from a part
local function removeESP(part)
    if part:FindFirstChild("ESPOutline") then
        part.ESPOutline:Destroy()
    end
end

-- Function to check unanchored parts
local function checkUnanchoredParts()
    for _, part in pairs(workspace:GetDescendants()) do
        -- Ensure that we're only working with BasePart objects
        if part:IsA("BasePart") then
            if not part.Anchored then
                createESP(part) -- Add outline to unanchored parts
            else
                removeESP(part) -- Remove outline from anchored parts
            end
        end
    end
end

-- Run the check continuously
while true do
    checkUnanchoredParts()
    wait(1) -- Adjust the delay if needed
end
