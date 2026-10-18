-- MansionBuilder.server.lua

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local function buildMansion(player)
    -- Mansion construction logic
    local mansion = Instance.new("Model")
    mansion.Name = "PlayerMansion"
    mansion.Parent = workspace

    -- Create the base of the mansion
    local base = Instance.new("Part")
    base.Name = "Base"
    base.Size = Vector3.new(20, 1, 20)
    base.Position = Vector3.new(0, 0, 0)
    base.Anchored = true
    base.Parent = mansion

    -- Create the walls
    local wall1 = Instance.new("Part")
    wall1.Name = "Wall1"
    wall1.Size = Vector3.new(20, 10, 1)
    wall1.Position = Vector3.new(0, 5, 10)
    wall1.Anchored = true
    wall1.Parent = mansion

    local wall2 = Instance.new("Part")
    wall2.Name = "Wall2"
    wall2.Size = Vector3.new(20, 10, 1)
    wall2.Position = Vector3.new(0, 5, -10)
    wall2.Anchored = true
    wall2.Parent = mansion

    local wall3 = Instance.new("Part")
    wall3.Name = "Wall3"
    wall3.Size = Vector3.new(1, 10, 20)
    wall3.Position = Vector3.new(10, 5, 0)
    wall3.Anchored = true
    wall3.Parent = mansion

    local wall4 = Instance.new("Part")
    wall4.Name = "Wall4"
    wall4.Size = Vector3.new(1, 10, 20)
    wall4.Position = Vector3.new(-10, 5, 0)
    wall4.Anchored = true
    wall4.Parent = mansion

    -- Create the roof
    local roof = Instance.new("Part")
    roof.Name = "Roof"
    roof.Size = Vector3.new(20, 1, 20)
    roof.Position = Vector3.new(0, 10, 0)
    roof.Anchored = true
    roof.Parent = mansion

    -- Create TVs on the walls
    local tv1 = Instance.new("Part")
    tv1.Name = "TV1"
    tv1.Size = Vector3.new(4, 2, 1)
    tv1.Position = Vector3.new(0, 5, 9.5)
    tv1.Anchored = true
    tv1.Parent = mansion

    local tv2 = Instance.new("Part")
    tv2.Name = "TV2"
    tv2.Size = Vector3.new(4, 2, 1)
    tv2.Position = Vector3.new(0, 5, -9.5)
    tv2.Anchored = true
    tv2.Parent = mansion

    local tv3 = Instance.new("Part")
    tv3.Name = "TV3"
    tv3.Size = Vector3.new(4, 2, 1)
    tv3.Position = Vector3.new(9.5, 5, 0)
    tv3.Anchored = true
    tv3.Parent = mansion

    local tv4 = Instance.new("Part")
    tv4.Name = "TV4"
    tv4.Size = Vector3.new(4, 2, 1)
    tv4.Position = Vector3.new(-9.5, 5, 0)
    tv4.Anchored = true
    tv4.Parent = mansion

    -- Assign the mansion to the player
    mansion.Parent = player.Character or workspace
end

Players.PlayerAdded:Connect(function(player)
    buildMansion(player)
end)

-- Function to update TV content
local function updateTVContent(tv, content)
    -- TV content update logic
    local surfaceGui = Instance.new("SurfaceGui")
    surfaceGui.Name = "TVScreen"
    surfaceGui.Parent = tv
    surfaceGui.Face = Enum.NormalId.Front
    surfaceGui.AlwaysOnTop = true

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.Parent = surfaceGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Text = content
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.BackgroundTransparency = 1
    textLabel.Parent = frame
end

-- Example usage: Update TV content
local function onTVUpdated(tvName, content)
    local mansion = workspace:FindFirstChild("PlayerMansion")
    if mansion then
        local tv = mansion:FindFirstChild(tvName)
        if tv then
            updateTVContent(tv, content)
        end
    end
end

-- Example event to update TV content
local tvUpdatedEvent = Instance.new("RemoteEvent")
    tvUpdatedEvent.Name = "TVUpdatedEvent"
    tvUpdatedEvent.Parent = ReplicatedStorage

    tvUpdatedEvent.OnServerEvent:Connect(function(player, tvName, content)
    onTVUpdated(tvName, content)
end)
