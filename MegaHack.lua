-- SATWARE CHEATS 2.0
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local StarterPlayer = game:GetService("StarterPlayer")

-- Beautiful Rounded GUI with Blue Theme
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Modern Watermark with Blue Theme
local WatermarkFrame = Instance.new("Frame")
WatermarkFrame.Size = UDim2.new(0, 220, 0, 60)
WatermarkFrame.Position = UDim2.new(0.5, -110, 0.05, 0)
WatermarkFrame.BackgroundColor3 = Color3.fromRGB(0, 80, 160)
WatermarkFrame.BackgroundTransparency = 0.2
WatermarkFrame.BorderSizePixel = 0
WatermarkFrame.Active = true
WatermarkFrame.Draggable = true
WatermarkFrame.Parent = ScreenGui

local UICorner1 = Instance.new("UICorner")
UICorner1.CornerRadius = UDim.new(0, 12)
UICorner1.Parent = WatermarkFrame

local UIStroke1 = Instance.new("UIStroke")
UIStroke1.Color = Color3.fromRGB(0, 120, 255)
UIStroke1.Thickness = 2
UIStroke1.Parent = WatermarkFrame

local WatermarkLabel = Instance.new("TextLabel")
WatermarkLabel.Size = UDim2.new(1, 0, 1, 0)
WatermarkLabel.BackgroundTransparency = 1
WatermarkLabel.Text = "SATWARE CHEATS 2.0"
WatermarkLabel.TextColor3 = Color3.fromRGB(200, 230, 255)
WatermarkLabel.Font = Enum.Font.GothamBold
WatermarkLabel.TextSize = 16
WatermarkLabel.Parent = WatermarkFrame

-- Main GUI Container
local MainGUI = Instance.new("Frame")
MainGUI.Size = UDim2.new(0, 350, 0, 800)
MainGUI.Position = UDim2.new(0.5, -175, 0.5, -300)
MainGUI.BackgroundColor3 = Color3.fromRGB(0, 60, 120)
MainGUI.BackgroundTransparency = 0.1
MainGUI.BorderSizePixel = 0
MainGUI.Visible = false
MainGUI.Active = true
MainGUI.Draggable = true
MainGUI.Parent = ScreenGui

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 15)
UICorner2.Parent = MainGUI

local UIStroke2 = Instance.new("UIStroke")
UIStroke2.Color = Color3.fromRGB(0, 150, 255)
UIStroke2.Thickness = 3
UIStroke2.Parent = MainGUI

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, -20, 1, -20)
ScrollFrame.Position = UDim2.new(0, 10, 0, 10)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
ScrollFrame.Parent = MainGUI

-- Function to create beautiful buttons
local buttonYPosition = 0
local function CreateButton(Name, Callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -10, 0, 45)
    Button.Position = UDim2.new(0, 5, 0, buttonYPosition)
    Button.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
    Button.BorderSizePixel = 0
    Button.Text = Name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 14
    Button.Parent = ScrollFrame
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Button
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(0, 150, 255)
    UIStroke.Thickness = 2
    UIStroke.Parent = Button
    
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 120, 240)}):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 100, 200)}):Play()
    end)
    
    Button.MouseButton1Click:Connect(Callback)
    
    buttonYPosition += 50
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, buttonYPosition)
    return Button
end

local function CreateTextBox(Placeholder)
    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(1, -10, 0, 35)
    TextBox.Position = UDim2.new(0, 5, 0, buttonYPosition)
    TextBox.BackgroundColor3 = Color3.fromRGB(0, 80, 160)
    TextBox.BorderSizePixel = 0
    TextBox.PlaceholderText = Placeholder
    TextBox.Text = ""
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.Font = Enum.Font.Gotham
    TextBox.TextSize = 14
    TextBox.Parent = ScrollFrame
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = TextBox
    
    buttonYPosition += 40
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, buttonYPosition)
    return TextBox
end

local function CreateSlider(Name, Min, Max, Default, Callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(1, -10, 0, 50)
    SliderFrame.Position = UDim2.new(0, 5, 0, buttonYPosition)
    SliderFrame.BackgroundTransparency = 1
    SliderFrame.Parent = ScrollFrame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 0, 20)
    Label.BackgroundTransparency = 1
    Label.Text = Name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 12
    Label.Parent = SliderFrame
    
    local Slider = Instance.new("Frame")
    Slider.Size = UDim2.new(1, 0, 0, 15)
    Slider.Position = UDim2.new(0, 0, 0, 25)
    Slider.BackgroundColor3 = Color3.fromRGB(0, 80, 160)
    Slider.BorderSizePixel = 0
    Slider.Parent = SliderFrame
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 7)
    UICorner.Parent = Slider
    
    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((Default - Min) / (Max - Min), 0, 1, 0)
    Fill.Position = UDim2.new(0, 0, 0, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    Fill.BorderSizePixel = 0
    Fill.Parent = Slider
    
    local UICorner2 = Instance.new("UICorner")
    UICorner2.CornerRadius = UDim.new(0, 7)
    UICorner2.Parent = Fill
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0, 40, 0, 15)
    ValueLabel.Position = UDim2.new(1, 5, 0, 25)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Text = tostring(Default)
    ValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ValueLabel.Font = Enum.Font.Gotham
    ValueLabel.TextSize = 12
    ValueLabel.Parent = SliderFrame
    
    Slider.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            local function UpdateSlider(input)
                local pos = UDim2.new(math.clamp((input.Position.X - Slider.AbsolutePosition.X) / Slider.AbsoluteSize.X, 0, 1), 0, 1, 0)
                Fill.Size = pos
                local value = math.floor(Min + (pos.X.Scale * (Max - Min)))
                ValueLabel.Text = tostring(value)
                Callback(value)
            end
            
            UpdateSlider(input)
            local connection
            connection = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    connection:Disconnect()
                else
                    UpdateSlider(input)
                end
            end)
        end
    end)
    
    buttonYPosition += 55
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, buttonYPosition)
    return SliderFrame
end

-- Fixed Mobile Click Detection
WatermarkFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        MainGUI.Visible = not MainGUI.Visible
    end
end)

-- Functions
local ESPEnabled = false
local NoclipEnabled = false
local AimEnabled = false
local KillAllEnabled = false
local ShootThroughWallEnabled = false
local InfJumpEnabled = false
local AntiKickEnabled = false
local AntiBanEnabled = false
local SpeedEnabled = false
local HighJumpEnabled = false
local InvisibleEnabled = false
local AFKEnabled = false
local FullBrightEnabled = false
local FreeCamEnabled = false
local FlyEnabled = false
local GodmodeEnabled = false
local BoxESPEnabled = false
local SpinEnabled = false
local DarkSkyEnabled = false
local ThirdPersonEnabled = false
local AntiLagEnabled = false
local GreenMapEnabled = false
local RedMapEnabled = false
local BlueMapEnabled = false
local R6Enabled = false
local R15Enabled = false
local MouseUnlocked = false
local OldNamecall
local OriginalFOV = 70
local OriginalLightingSettings = {}
local OriginalSky = Lighting:FindFirstChildOfClass("Sky")
local AimFOV = 100
local AimTarget = nil
local BoxESPHandles = {}
local SpinSpeed = 10
local ThirdPersonDistance = 10
local Waypoints = {}
local Configs = {}

-- Anti Lag Function
CreateButton("Anti Lag Toggle", function()
    AntiLagEnabled = not AntiLagEnabled
    
    if AntiLagEnabled then
        -- Remove unnecessary parts
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Part") and not obj.Anchored and obj.Mass > 100 then
                obj:Destroy()
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj:Destroy()
            elseif obj:IsA("ParticleEmitter") then
                obj.Enabled = false
            end
        end
        
        -- Reduce graphics quality
        settings().Rendering.QualityLevel = 1
        settings().Rendering.MeshCacheSize = 10
        settings().Rendering.EnableFRM = false
        
        -- Disable shadows
        Lighting.GlobalShadows = false
        Lighting.ShadowSoftness = 0
        
        -- Clear garbage
        game:GetService("ContentProvider"):ClearContent()
        collectgarbage()
    else
        -- Restore settings
        settings().Rendering.QualityLevel = 10
        settings().Rendering.MeshCacheSize = 100
        settings().Rendering.EnableFRM = true
        Lighting.GlobalShadows = true
        Lighting.ShadowSoftness = 0.5
    end
end)

-- TP to Object by Name
local ObjectNameTextBox = CreateTextBox("Enter object name to TP")

CreateButton("TP to Object", function()
    local objectName = ObjectNameTextBox.Text
    if objectName == "" then return end
    
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Part") and obj.Name:lower():find(objectName:lower()) then
            LocalPlayer.Character:MoveTo(obj.Position + Vector3.new(0, 5, 0))
            break
        end
    end
end)

-- Waypoint System
local WaypointNameTextBox = CreateTextBox("Enter waypoint name")

CreateButton("Add Waypoint", function()
    local waypointName = WaypointNameTextBox.Text
    if waypointName == "" then return end
    
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        Waypoints[waypointName] = LocalPlayer.Character.HumanoidRootPart.Position
        
        -- Create visual marker
        local marker = Instance.new("Part")
        marker.Name = "Waypoint_" .. waypointName
        marker.Size = Vector3.new(2, 5, 2)
        marker.Position = Waypoints[waypointName] + Vector3.new(0, 2.5, 0)
        marker.Anchored = true
        marker.CanCollide = false
        marker.Material = Enum.Material.Neon
        marker.BrickColor = BrickColor.new("Bright green")
        marker.Parent = workspace
        
        local beam = Instance.new("Beam")
        beam.Attachment0 = Instance.new("Attachment")
        beam.Attachment0.Parent = marker
        beam.Attachment1 = Instance.new("Attachment")
        beam.Attachment1.Parent = marker
        beam.Attachment1.Position = Vector3.new(0, 10, 0)
        beam.Color = ColorSequence.new(Color3.new(0, 1, 0))
        beam.Parent = marker
    end
end)

CreateButton("TP to Waypoint", function()
    local waypointName = WaypointNameTextBox.Text
    if waypointName == "" or not Waypoints[waypointName] then return end
    
    LocalPlayer.Character:MoveTo(Waypoints[waypointName])
end)

CreateButton("Remove Waypoint", function()
    local waypointName = WaypointNameTextBox.Text
    if waypointName == "" then return end
    
    Waypoints[waypointName] = nil
    local marker = workspace:FindFirstChild("Waypoint_" .. waypointName)
    if marker then
        marker:Destroy()
    end
end)

-- Map Color Functions
CreateButton("Green Map", function()
    GreenMapEnabled = not GreenMapEnabled
    RedMapEnabled = false
    BlueMapEnabled = false
    
    if GreenMapEnabled then
        Lighting.Ambient = Color3.fromRGB(0, 50, 0)
        Lighting.OutdoorAmbient = Color3.fromRGB(0, 30, 0)
        Lighting.FogColor = Color3.fromRGB(0, 20, 0)
    else
        Lighting.Ambient = OriginalLightingSettings.Ambient or Color3.fromRGB(1, 1, 1)
        Lighting.OutdoorAmbient = OriginalLightingSettings.OutdoorAmbient or Color3.fromRGB(128, 128, 128)
        Lighting.FogColor = OriginalLightingSettings.FogColor or Color3.fromRGB(191, 191, 191)
    end
end)

CreateButton("Red Map", function()
    RedMapEnabled = not RedMapEnabled
    GreenMapEnabled = false
    BlueMapEnabled = false
    
    if RedMapEnabled then
        Lighting.Ambient = Color3.fromRGB(50, 0, 0)
        Lighting.OutdoorAmbient = Color3.fromRGB(30, 0, 0)
        Lighting.FogColor = Color3.fromRGB(20, 0, 0)
    else
        Lighting.Ambient = OriginalLightingSettings.Ambient or Color3.fromRGB(1, 1, 1)
        Lighting.OutdoorAmbient = OriginalLightingSettings.OutdoorAmbient or Color3.fromRGB(128, 128, 128)
        Lighting.FogColor = OriginalLightingSettings.FogColor or Color3.fromRGB(191, 191, 191)
    end
end)

CreateButton("Blue Map", function()
    BlueMapEnabled = not BlueMapEnabled
    GreenMapEnabled = false
    RedMapEnabled = false
    
    if BlueMapEnabled then
        Lighting.Ambient = Color3.fromRGB(0, 0, 50)
        Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 30)
        Lighting.FogColor = Color3.fromRGB(0, 0, 20)
    else
        Lighting.Ambient = OriginalLightingSettings.Ambient or Color3.fromRGB(1, 1, 1)
        Lighting.OutdoorAmbient = OriginalLightingSettings.OutdoorAmbient or Color3.fromRGB(128, 128, 128)
        Lighting.FogColor = OriginalLightingSettings.FogColor or Color3.fromRGB(191, 191, 191)
    end
end)

-- Kick Player
local KickPlayerTextBox = CreateTextBox("Enter username to kick")

CreateButton("Kick Player", function()
    local targetName = KickPlayerTextBox.Text
    if targetName == "" then return end
    
    for _, player in pairs(Players:GetPlayers()) do
        if (player.Name:lower() == targetName:lower() or player.DisplayName:lower() == targetName:lower()) and player ~= LocalPlayer then
            player:Kick("Kicked by SATWARE CHEATS")
            break
        end
    end
end)

-- Config System
local ConfigNameTextBox = CreateTextBox("Enter config name")

CreateButton("Save Config", function()
    local configName = ConfigNameTextBox.Text
    if configName == "" then return end
    
    Configs[configName] = {
        WalkSpeed = LocalPlayer.Character.Humanoid.WalkSpeed,
        JumpPower = LocalPlayer.Character.Humanoid.JumpPower,
        FOV = Camera.FieldOfView
    }
    
    -- Save to file (pseudo-save)
    print("Config '" .. configName .. "' saved!")
end)

CreateButton("Load Config", function()
    local configName = ConfigNameTextBox.Text
    if configName == "" or not Configs[configName] then return end
    
    local config = Configs[configName]
    LocalPlayer.Character.Humanoid.WalkSpeed = config.WalkSpeed
    LocalPlayer.Character.Humanoid.JumpPower = config.JumpPower
    Camera.FieldOfView = config.FOV
end)

-- Unlock Mouse with F Key
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        MouseUnlocked = not MouseUnlocked
        if MouseUnlocked then
            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        else
            UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
        end
    end
end)

CreateButton("Toggle Mouse Lock (F Key)", function()
    MouseUnlocked = not MouseUnlocked
    if MouseUnlocked then
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    else
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    end
end)

-- Change Nickname
local NicknameTextBox = CreateTextBox("Enter new nickname")

CreateButton("Change Nickname", function()
    local newName = NicknameTextBox.Text
    if newName == "" then return end
    
    LocalPlayer.DisplayName = newName
end)

-- Change Skin/Appearance
local SkinColorSlider = CreateSlider("Skin Color", 0, 100, 50, function(value)
    if LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("Part") and part.Name == "Head" then
                part.BrickColor = BrickColor.new("Bright yellow")
            elseif part:IsA("Part") and (part.Name == "Torso" or part.Name:find("Arm") or part.Name:find("Leg")) then
                part.BrickColor = BrickColor.new("Bright yellow")
            end
        end
    end
end)

-- R6 Character
CreateButton("Set R6 Character", function()
    R6Enabled = true
    R15Enabled = false
    
    if LocalPlayer.Character then
        LocalPlayer.Character:BreakJoints()
    end
    
    LocalPlayer.CharacterAdded:Connect(function(character)
        wait(1)
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.HipHeight = 0
        end
    end)
end)

-- R15 Character
CreateButton("Set R15 Character", function()
    R15Enabled = true
    R6Enabled = false
    
    if LocalPlayer.Character then
        LocalPlayer.Character:BreakJoints()
    end
    
    LocalPlayer.CharacterAdded:Connect(function(character)
        wait(1)
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.HipHeight = 1
        end
    end)
end)

-- Animation Hacks
CreateButton("Animation Hacks", function()
    if LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            -- Load custom animations
            local animationIds = {
                125750726, -- Float
                125751173, -- Levitate
                125751434, -- Spin
                125751879  -- Zombie
            }
            
            for _, animId in pairs(animationIds) do
                local animation = Instance.new("Animation")
                animation.AnimationId = "rbxassetid://" .. animId
                local track = humanoid:LoadAnimation(animation)
                track:Play()
                track.Looped = true
            end
        end
    end
end)

-- Delete World
CreateButton("DELETE WORLD", function()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Part") or obj:IsA("Model") or obj:IsA("MeshPart") then
            obj:Destroy()
        end
    end
    
    -- Clear lighting
    for _, obj in pairs(Lighting:GetChildren()) do
        if not obj:IsA("Sky") then
            obj:Destroy()
        end
    end
end)

-- Third Person View Function
CreateButton("Third Person Toggle", function()
    ThirdPersonEnabled = not ThirdPersonEnabled
    
    if ThirdPersonEnabled and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.CameraOffset = Vector3.new(0, 0, 0)
            
            RunService:BindToRenderStep("ThirdPerson", Enum.RenderPriority.Camera.Value, function()
                if ThirdPersonEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local rootPart = LocalPlayer.Character.HumanoidRootPart
                    local camera = workspace.CurrentCamera
                    
                    -- Calculate camera position behind character
                    local lookVector = rootPart.CFrame.LookVector
                    local cameraPosition = rootPart.Position - (lookVector * ThirdPersonDistance) + Vector3.new(0, 3, 0)
                    
                    -- Set camera to look at character
                    camera.CFrame = CFrame.new(cameraPosition, rootPart.Position + Vector3.new(0, 2, 0))
                    camera.CameraType = Enum.CameraType.Scriptable
                end
            end)
        end
    else
        RunService:UnbindFromRenderStep("ThirdPerson")
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.CameraOffset = Vector3.new(0, 0, 0)
            end
        end
        Camera.CameraType = Enum.CameraType.Custom
    end
end)

-- Third Person Distance Slider
CreateSlider("Third Person Distance", 5, 20, 10, function(value)
    ThirdPersonDistance = value
end)

-- Box ESP Function
CreateButton("Box ESP Toggle", function()
    BoxESPEnabled = not BoxESPEnabled
    
    if BoxESPEnabled then
        -- Clear existing boxes
        for _, box in pairs(BoxESPHandles) do
            if box then
                box:Destroy()
            end
        end
        BoxESPHandles = {}
        
        -- Create boxes for existing players
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                CreateBoxESP(player.Character)
            end
        end
        
        -- Connect to player added event
        Players.PlayerAdded:Connect(function(player)
            player.CharacterAdded:Connect(function(character)
                if BoxESPEnabled then
                    CreateBoxESP(character)
                end
            end)
        end)
        
        -- Connect to existing players
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                player.CharacterAdded:Connect(function(character)
                    if BoxESPEnabled then
                        CreateBoxESP(character)
                    end
                end)
            end
        end
    else
        -- Remove all boxes
        for _, box in pairs(BoxESPHandles) do
            if box then
                box:Destroy()
            end
        end
        BoxESPHandles = {}
    end
end)

function CreateBoxESP(character)
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "BoxESP"
    box.Adornee = humanoidRootPart
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Size = Vector3.new(4, 6, 2)
    box.Transparency = 0.3
    box.Color3 = Color3.fromRGB(255, 0, 0)
    box.Parent = humanoidRootPart
    
    BoxESPHandles[character] = box
    
    -- Update box position
    local connection
    connection = RunService.Heartbeat:Connect(function()
        if not character or not character.Parent or not humanoidRootPart or not BoxESPEnabled then
            connection:Disconnect()
            if box then
                box:Destroy()
            end
            return
        end
        box.Adornee = humanoidRootPart
    end)
end

-- Spinbot Function
CreateButton("Spinbot Toggle", function()
    SpinEnabled = not SpinEnabled
    
    if SpinEnabled and LocalPlayer.Character then
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            RunService:BindToRenderStep("Spinbot", Enum.RenderPriority.First.Value, function()
                if SpinEnabled and rootPart then
                    rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, math.rad(SpinSpeed), 0)
                end
            end)
        end
    else
        RunService:UnbindFromRenderStep("Spinbot")
    end
end)

-- Spin Speed Slider
CreateSlider("Spin Speed", 1, 50, 10, function(value)
    SpinSpeed = value
end)

-- Dark Sky Function
CreateButton("Dark Sky Toggle", function()
    DarkSkyEnabled = not DarkSkyEnabled
    
    if DarkSkyEnabled then
        -- Remove original sky
        if OriginalSky then
            OriginalSky.Parent = nil
        end
        
        -- Create dark sky
        local newSky = Instance.new("Sky")
        newSky.Name = "DarkSky"
        newSky.SkyboxBk = "http://www.roblox.com/asset/?id=264909758"
        newSky.SkyboxDn = "http://www.roblox.com/asset/?id=264909758"
        newSky.SkyboxFt = "http://www.roblox.com/asset/?id=264909758"
        newSky.SkyboxLf = "http://www.roblox.com/asset/?id=264909758"
        newSky.SkyboxRt = "http://www.roblox.com/asset/?id=264909758"
        newSky.SkyboxUp = "http://www.roblox.com/asset/?id=264909758"
        newSky.Parent = Lighting
        
        -- Set dark lighting
        Lighting.Ambient = Color3.fromRGB(30, 30, 30)
        Lighting.Brightness = 0.1
        Lighting.OutdoorAmbient = Color3.fromRGB(30, 30, 30)
        Lighting.FogColor = Color3.fromRGB(10, 10, 10)
        Lighting.FogEnd = 500
        Lighting.ClockTime = 0
    else
        -- Restore original sky and lighting
        local darkSky = Lighting:FindFirstChild("DarkSky")
        if darkSky then
            darkSky:Destroy()
        end
        if OriginalSky then
            OriginalSky.Parent = Lighting
        end
        
        -- Restore lighting
        Lighting.Ambient = Color3.fromRGB(1, 1, 1)
        Lighting.Brightness = 1
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        Lighting.FogColor = Color3.fromRGB(191, 191, 191)
        Lighting.FogEnd = 100000
        Lighting.ClockTime = 14
    end
end)

-- Fly Function
CreateButton("Fly Toggle", function()
    FlyEnabled = not FlyEnabled
    
    if FlyEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(40000, 40000, 40000)
        bodyVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
        
        RunService:BindToRenderStep("FlyControl", Enum.RenderPriority.First.Value, function()
            if FlyEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local root = LocalPlayer.Character.HumanoidRootPart
                local velocity = Vector3.new(0, 0, 0)
                
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    velocity = velocity + (Camera.CFrame.LookVector * 50)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    velocity = velocity + (Camera.CFrame.LookVector * -50)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    velocity = velocity + (Camera.CFrame.RightVector * -50)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    velocity = velocity + (Camera.CFrame.RightVector * 50)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    velocity = velocity + Vector3.new(0, 50, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    velocity = velocity + Vector3.new(0, -50, 0)
                end
                
                bodyVelocity.Velocity = velocity
            end
        end)
    else
        RunService:UnbindFromRenderStep("FlyControl")
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local bodyVelocity = LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then
                bodyVelocity:Destroy()
            end
        end
    end
end)

-- Godmode Function
CreateButton("Godmode Toggle", function()
    GodmodeEnabled = not GodmodeEnabled
    
    if GodmodeEnabled and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.MaxHealth = math.huge
            humanoid.Health = math.huge
        end
    end
end)

-- FullBright Function
CreateButton("FullBright Toggle", function()
    FullBrightEnabled = not FullBrightEnabled
    
    if FullBrightEnabled then
        OriginalLightingSettings = {
            Brightness = Lighting.Brightness,
            Ambient = Lighting.Ambient,
            OutdoorAmbient = Lighting.OutdoorAmbient,
            ClockTime = Lighting.ClockTime,
            FogEnd = Lighting.FogEnd,
            GlobalShadows = Lighting.GlobalShadows,
            ShadowSoftness = Lighting.ShadowSoftness
        }
        
        Lighting.Brightness = 2
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.ShadowSoftness = 0
    else
        if OriginalLightingSettings.Brightness then
            Lighting.Brightness = OriginalLightingSettings.Brightness
            Lighting.Ambient = OriginalLightingSettings.Ambient
            Lighting.OutdoorAmbient = OriginalLightingSettings.OutdoorAmbient
            Lighting.ClockTime = OriginalLightingSettings.ClockTime
            Lighting.FogEnd = OriginalLightingSettings.FogEnd
            Lighting.GlobalShadows = OriginalLightingSettings.GlobalShadows
            Lighting.ShadowSoftness = OriginalLightingSettings.ShadowSoftness
        end
    end
end)

-- FOV Changer
CreateSlider("FOV Changer", 50, 120, 70, function(value)
    Camera.FieldOfView = value
end)

-- Zoom Function
CreateButton("Zoom Toggle", function()
    if Camera.FieldOfView == 20 then
        Camera.FieldOfView = OriginalFOV
    else
        OriginalFOV = Camera.FieldOfView
        Camera.FieldOfView = 20
    end
end)

-- Free Camera Function
CreateButton("Free Camera Toggle", function()
    FreeCamEnabled = not FreeCamEnabled
    
    if FreeCamEnabled then
        local camPos = Camera.CFrame
        local character = LocalPlayer.Character
        if character then
            character:FindFirstChildOfClass("Humanoid").CameraOffset = Vector3.new(0, 0, 0)
        end
        
        RunService:BindToRenderStep("FreeCamera", Enum.RenderPriority.Camera.Value, function()
            if FreeCamEnabled then
                local speed = 2
                local moveVector = Vector3.new(
                    UserInputService:IsKeyDown(Enum.KeyCode.D) and speed or UserInputService:IsKeyDown(Enum.KeyCode.A) and -speed or 0,
                    UserInputService:IsKeyDown(Enum.KeyCode.E) and speed or UserInputService:IsKeyDown(Enum.KeyCode.Q) and -speed or 0,
                    UserInputService:IsKeyDown(Enum.KeyCode.S) and speed or UserInputService:IsKeyDown(Enum.KeyCode.W) and -speed or 0
                )
                
                camPos = camPos * CFrame.new(moveVector)
                Camera.CFrame = camPos
                Camera.CameraType = Enum.CameraType.Scriptable
            end
        end)
    else
        RunService:UnbindFromRenderStep("FreeCamera")
        Camera.CameraType = Enum.CameraType.Custom
        if LocalPlayer.Character then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").CameraOffset = Vector3.new(0, 0, 0)
        end
    end
end)

-- Aim FOV Slider
CreateSlider("Aim FOV", 10, 200, 100, function(value)
    AimFOV = value
end)

-- Fixed Aim Function with FOV
CreateButton("Aim Toggle", function()
    AimEnabled = not AimEnabled
    
    if AimEnabled then
        RunService:BindToRenderStep("AimBot", Enum.RenderPriority.Last.Value, function()
            if AimEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local closestPlayer = nil
                local closestDistance = AimFOV
                local cameraPos = Camera.CFrame.Position
                
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local character = player.Character
                        local rootPart = character.HumanoidRootPart
                        
                        -- Calculate screen position
                        local screenPoint, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
                        
                        if onScreen then
                            local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                            
                            if distance < closestDistance then
                                closestDistance = distance
                                closestPlayer = player
                            end
                        end
                    end
                end
                
                if closestPlayer then
                    AimTarget = closestPlayer.Character.HumanoidRootPart
                    if AimTarget then
                        local camCF = Camera.CFrame
                        local targetPos = AimTarget.Position
                        local direction = (targetPos - camCF.Position).Unit
                        Camera.CFrame = CFrame.new(camCF.Position, camCF.Position + direction)
                    end
                else
                    AimTarget = nil
                end
            end
        end)
    else
        RunService:UnbindFromRenderStep("AimBot")
        AimTarget = nil
    end
end)

-- ESP Function
CreateButton("ESP Toggle", function()
    ESPEnabled = not ESPEnabled
    if ESPEnabled then
        for i, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local Highlight = Instance.new("Highlight")
                Highlight.Parent = player.Character
                Highlight.Adornee = player.Character
                Highlight.FillColor = Color3.fromRGB(255, 50, 50)
                Highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
            end
        end
    else
        for i, player in pairs(Players:GetPlayers()) do
            if player.Character then
                local Highlight = player.Character:FindFirstChildWhichIsA("Highlight")
                if Highlight then
                    Highlight:Destroy()
                end
            end
        end
    end
end)

-- Noclip Function
CreateButton("Noclip Toggle", function()
    NoclipEnabled = not NoclipEnabled
end)

RunService.Stepped:Connect(function()
    if NoclipEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Kill All Function
CreateButton("Kill All Players", function()
    for i, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            player.Character:BreakJoints()
        end
    end
end)

-- Shoot Through Walls
CreateButton("Shoot Through Walls Toggle", function()
    ShootThroughWallEnabled = not ShootThroughWallEnabled
    
    if ShootThroughWallEnabled then
        local mt = getrawmetatable(game)
        OldNamecall = mt.__namecall
        
        setreadonly(mt, false)
        
        mt.__namecall = newcclosure(function(...)
            local method = getnamecallmethod()
            local args = {...}
            
            if method == "FindPartOnRayWithIgnoreList" and ShootThroughWallEnabled then
                local newIgnoreList = {}
                for _, item in pairs(args[2]) do
                    if not item:IsA("Part") or (item.Name ~= "Wall" and item.Name ~= "Part" and item.Name ~= "Baseplate") then
                        table.insert(newIgnoreList, item)
                    end
                end
                args[2] = newIgnoreList
            end
            
            return OldNamecall(unpack(args))
        end)
        
        setreadonly(mt, true)
    else
        if OldNamecall then
            local mt = getrawmetatable(game)
            setreadonly(mt, false)
            mt.__namecall = OldNamecall
            setreadonly(mt, true)
        end
    end
end)

-- Infinite Jump
CreateButton("Infinite Jump Toggle", function()
    InfJumpEnabled = not InfJumpEnabled
end)

UserInputService.JumpRequest:Connect(function()
    if InfJumpEnabled then
        LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState("Jumping")
    end
end)

-- High Speed
CreateButton("High Speed Toggle", function()
    SpeedEnabled = not SpeedEnabled
    if SpeedEnabled then
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
    else
        LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

-- High Jump
CreateButton("High Jump Toggle", function()
    HighJumpEnabled = not HighJumpEnabled
    if HighJumpEnabled then
        LocalPlayer.Character.Humanoid.JumpPower = 200
    else
        LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)

-- Invisible Player Function
CreateButton("Invisible Player Toggle", function()
    InvisibleEnabled = not InvisibleEnabled
    if InvisibleEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
                part.CanCollide = false
            end
        end
    else
        if LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Transparency = 0
                    part.CanCollide = true
                end
            end
        end
    end
end)

-- AFK Function
CreateButton("AFK Mode Toggle", function()
    AFKEnabled = not AFKEnabled
    if AFKEnabled then
        for i, v in pairs(getconnections(LocalPlayer.Idled)) do
            v:Disable()
        end
    end
end)

-- AntiKick
CreateButton("AntiKick Toggle", function()
    AntiKickEnabled = not AntiKickEnabled
end)

-- AntiBan
CreateButton("AntiBan Toggle", function()
    AntiBanEnabled = not AntiBanEnabled
end)

-- Player Teleport by Username
local TeleportTextBox = CreateTextBox("Enter player username")

CreateButton("Teleport to Player", function()
    local targetName = TeleportTextBox.Text
    if targetName == "" then return end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player.Name:lower() == targetName:lower() or player.DisplayName:lower() == targetName:lower() then
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character:MoveTo(player.Character.HumanoidRootPart.Position)
                break
            end
        end
    end
end)

-- Kill Player by Username
local KillPlayerTextBox = CreateTextBox("Enter username to kill")

CreateButton("Kill Player by Username", function()
    local targetName = KillPlayerTextBox.Text
    if targetName == "" then return end
    
    for _, player in pairs(Players:GetPlayers()) do
        if (player.Name:lower() == targetName:lower() or player.DisplayName:lower() == targetName:lower()) and player ~= LocalPlayer then
            if player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.Health = 0
                    player.Character:BreakJoints()
                end
                break
            end
        end
    end
end)

-- Give Tool by ID
local ToolIdTextBox = CreateTextBox("Enter Tool ID from Toolbox")

CreateButton("Give Tool", function()
    local toolId = tonumber(ToolIdTextBox.Text)
    if not toolId then return end
    
    local tool = game:GetService("InsertService"):LoadAsset(toolId)
    if tool then
        for _, item in pairs(tool:GetChildren()) do
            if item:IsA("Tool") or item:IsA("HopperBin") then
                item.Parent = LocalPlayer.Backpack
                break
            end
        end
    end
end)
