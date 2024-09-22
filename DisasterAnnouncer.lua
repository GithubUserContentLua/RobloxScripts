local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Create a RemoteEvent for disaster announcements
local disasterEvent = Instance.new("RemoteEvent")
disasterEvent.Name = "DisasterEvent"
disasterEvent.Parent = ReplicatedStorage

-- List of disaster types
local disasterTypes = {
    "Flood",
    "Tornado",
    "Earthquake",
    "Meteor Shower",
    "Fire",
}

-- Function to announce the disaster
local function announceDisaster(disaster)
    for _, player in pairs(Players:GetPlayers()) do
        disasterEvent:FireClient(player, disaster)
    end
end

-- Example function to trigger a random disaster
local function triggerRandomDisaster()
    while true do
        wait(30) -- Wait 30 seconds between disasters
        local disaster = disasterTypes[math.random(1, #disasterTypes)]
        announceDisaster(disaster)
    end
end

-- Start triggering disasters
triggerRandomDisaster()

-- Local part to handle displaying messages
local function onDisasterReceived(disaster)
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local messageBox = Instance.new("TextLabel")
    messageBox.Text = "Disaster Incoming: " .. disaster
    messageBox.Size = UDim2.new(0, 300, 0, 50)
    messageBox.Position = UDim2.new(0.5, -150, 0, 50)
    messageBox.BackgroundColor3 = Color3.new(1, 0, 0) -- Red background
    messageBox.TextColor3 = Color3.new(1, 1, 1) -- White text
    messageBox.Parent = playerGui

    -- Remove the message after 5 seconds
    wait(5)
    messageBox:Destroy()
end

-- Connect the disaster event to the function
disasterEvent.OnClientEvent:Connect(onDisasterReceived)
