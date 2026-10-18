-- TVController.client.lua

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local tvUpdatedEvent = ReplicatedStorage:WaitForChild("TVUpdatedEvent")

local function updateTV(tvName, content)
    -- TV update logic
    tvUpdatedEvent:FireServer(tvName, content)
end

-- Example usage: Update TV content
updateTV("TV1", "Welcome to the Mansion!")
updateTV("TV2", "Enjoy your stay!")
updateTV("TV3", "Have a great time!")
updateTV("TV4", "Thanks for visiting!")
