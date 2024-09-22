-- ESP Script for Unanchored Parts

-- Function to create a highlight around a part
local function createESP(part)
    if not part:FindFirstChild("ESPBox") then
        local highlight = Instance.new("BoxHandleAdornment")
        highlight.Name = "ESPBox"
        highlight.Adornee = part
        highlight.Size = part.Size + Vector3.new(0.1, 0.1, 0.1) -- Slightly larger than the part
        highlight.Color3 = Color3.fromRGB(255, 0, 0) -- Red color for visibility
        highlight.Transparency = 0.5 -- Adjust transparency (0 is fully opaque, 1 is invisible)
        highlight.ZIndex = 10
        highlight.AlwaysOnTop = true
        highlight.Parent = part
    end
end

-- Function to check unanchored parts
local function checkUnanchoredParts()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part.Anchored then
            createESP(part)
        elseif part:IsA("BasePart") and part:FindFirstChild("ESPBox") and part.Anchored then
            part.ESPBox:Destroy()
        end
    end
end

-- Run the check continuously
while true do
    checkUnanchoredParts()
    wait(1) -- Adjust the delay if needed
end
