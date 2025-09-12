-- SATWARE CHEATS v2.6 - Added Ghost Clone, Reality Glitch, Fly & Godmode
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Beautiful Rounded GUI with Blue Theme
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Modern Watermark with Blue Theme
local WatermarkFrame = Instance.new("Frame")
WatermarkFrame.Size = UDim2.new(0, 240, 0, 60)
WatermarkFrame.Position = UDim2.new(0.5, -120, 0.05, 0)
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
WatermarkLabel.Text = "SATWARE CHEATS v2.6"
WatermarkLabel.TextColor3 = Color3.fromRGB(200, 230, 255)
WatermarkLabel.Font = Enum.Font.GothamBold
WatermarkLabel.TextSize = 16
WatermarkLabel.Parent = WatermarkFrame

-- Main GUI Container
local MainGUI = Instance.new("Frame")
MainGUI.Size = UDim2.new(0, 350, 0, 850)
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
ScrollFrame.CanvasSize = UDim2.new(0, 0, 4.0, 0)
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
local GhostCloneEnabled = false
local FlyEnabled = false
local GodmodeEnabled = false
local OldNamecall
local OriginalFOV = 70
local OriginalLightingSettings = {}
local AimFOV = 100
local AimTarget = nil
local GhostClone = nil
local FlySpeed = 50

-- Fly Function
CreateButton("Fly Toggle", function()
    FlyEnabled = not FlyEnabled
    
    if FlyEnabled then
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
        bodyVelocity.Parent = LocalPlayer.Character.HumanoidRootPart
        
        RunService:BindToRenderStep("FlyControl", Enum.RenderPriority.First.Value, function()
            if FlyEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local root = LocalPlayer.Character.HumanoidRootPart
                local velocity = Vector3.new(0, 0, 0)
                
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    velocity = velocity + (Camera.CFrame.LookVector * FlySpeed)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    velocity = velocity + (Camera.CFrame.LookVector * -FlySpeed)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    velocity = velocity + (Camera.CFrame.RightVector * -FlySpeed)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    velocity = velocity + (Camera.CFrame.RightVector * FlySpeed)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    velocity = velocity + Vector3.new(0, FlySpeed, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    velocity = velocity + Vector3.new(0, -FlySpeed, 0)
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

-- Ghost Clone Function
CreateButton("Ghost Clone Toggle", function()
    GhostCloneEnabled = not GhostCloneEnabled
    
    if GhostCloneEnabled and LocalPlayer.Character then
        -- Create ghost clone
        GhostClone = LocalPlayer.Character:Clone()
        GhostClone.Parent = workspace
        GhostClone:SetPrimaryPartCFrame(LocalPlayer.Character.PrimaryPart.CFrame)
        
        -- Make real player invisible
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
                part.CanCollide = false
            end
        end
        
        -- Sync damage to real player
        GhostClone.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("BodyVelocity") or descendant:IsA("BodyForce") then
                descendant:Destroy()
            end
        end)
    else
        if GhostClone then
            GhostClone:Destroy()
            GhostClone = nil
        end
        -- Make real player visible again
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

-- Reality Glitch Function
local GlitchTargetTextBox = CreateTextBox("Enter username for Reality Glitch")

CreateButton("Reality Glitch Activate", function()
    local targetName = GlitchTargetTextBox.Text
    if targetName == "" then return end
    
    for _, player in pairs(Players:GetPlayers()) do
        if (player.Name:lower() == targetName:lower() or player.DisplayName:lower() == targetName:lower()) and player ~= LocalPlayer then
            -- Create fake sounds
            local fakeSound = Instance.new("Sound")
            fakeSound.SoundId = "rbxassetid://130791229" -- Gunshot sound
            fakeSound.Parent = player.Character.HumanoidRootPart
            fakeSound:Play()
            fakeSound.Ended:Connect(function()
                fakeSound:Destroy()
            end)
            
            -- Random mouse glitch
            task.spawn(function()
                wait(math.random(1, 3))
                if player:GetMouse() then
                    local originalSensitivity = player:GetMouse().Sensitivity
                    player:GetMouse().Sensitivity = 0.1
                    wait(0.5)
                    player:GetMouse().Sensitivity = originalSensitivity
                end
            end)
            
            -- Fake player illusion
            task.spawn(function()
                for i = 1, 3 do
                    wait(math.random(2, 4))
                    local fakePlayer = Instance.new("Part")
                    fakePlayer.Size = Vector3.new(2, 4, 1)
                    fakePlayer.BrickColor = BrickColor.new("Bright red")
                    fakePlayer.Material = Enum.Material.Neon
                    fakePlayer.Position = player.Character.HumanoidRootPart.Position + Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))
                    fakePlayer.Parent = workspace
                    fakePlayer.Anchored = true
                    
                    wait(1.5)
                    fakePlayer:Destroy()
                end
            end)
            
            break
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
        Lighting.ClockTime
