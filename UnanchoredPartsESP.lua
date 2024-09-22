-- ESP Script for Unanchored Parts using Highlight

-- Function to create a highlight around a part
local function createESP(part)
    if not part:FindFirstChild("ESPHighlight") then
        local highlight = Instance.new("Highlight")
        highlight.Name = "ESPHighlight"
        highlight.Adornee = part
        highlight.FillColor = Color3.new(1, 0, 0) -- Red color
        highlight.FillTransparency = 1 -- Fully transparent fill
        highlight.OutlineColor = Color3.new(1, 0, 0) -- Red outline
        highlight.OutlineTransparency = 0 -- Visible outline
        highlight.Parent = part
    end
end

-- Function to remove the highlight from a part
local function removeESP(part)
    if part:FindFirstChild("ESPHighlight") then
        part.ESPHighlight:Destroy()
    end
end

-- Function to check unanchored parts
local function checkUnanchoredParts()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            if not part.Anchored then
                createESP(part) -- Add highlight to unanchored parts
            else
                removeESP(part) -- Remove highlight from anchored parts
            end
        end
    end
end

-- Run the check continuously
while true do
    checkUnanchoredParts()
    wait(1) -- Adjust the delay if needed
end
