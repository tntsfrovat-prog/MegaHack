-- SATWARE CHEATS v2.0
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

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
WatermarkLabel.Text = "SATWARE CHEATS v2.2"
WatermarkLabel.TextColor3 = Color3.fromRGB(200, 230, 255)
WatermarkLabel.Font = Enum.Font.GothamBold
WatermarkLabel.TextSize = 16
WatermarkLabel.Parent = WatermarkFrame

-- Main GUI Container
local MainGUI = Instance.new("Frame")
MainGUI.Size = UDim2.new(0, 350, 0, 650)
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
ScrollFrame.CanvasSize = UDim2.new(0, 0, 2.8, 0)
ScrollFrame.Parent = MainGUI

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

WatermarkFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        MainGUI.Visible = not MainGUI.Visible
    end
end)

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
local OldNamecall

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

CreateButton("Aim Toggle", function()
    AimEnabled = not AimEnabled
end)

CreateButton("Kill All Players", function()
    for i, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            player.Character:BreakJoints()
        end
    end
end)

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

CreateButton("Infinite Jump Toggle", function()
    InfJumpEnabled = not InfJumpEnabled
end)

UserInputService.JumpRequest:Connect(function()
    if InfJumpEnabled then
        LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState("Jumping")
    end
end)

CreateButton("High Speed Toggle", function()
    SpeedEnabled = not SpeedEnabled
    if SpeedEnabled then
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
    else
        LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

CreateButton("High Jump Toggle", function()
    HighJumpEnabled = not HighJumpEnabled
    if HighJumpEnabled then
        LocalPlayer.Character.Humanoid.JumpPower = 200
    else
        LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)

CreateButton("Invisible Toggle", function()
    InvisibleEnabled = not InvisibleEnabled
    if InvisibleEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = 1
                    end
                end
            end
        end
    else
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = 0
                    end
                end
            end
        end
    end
end)

CreateButton("AFK Mode Toggle", function()
    AFKEnabled = not AFKEnabled
    if AFKEnabled then
        for i, v in pairs(getconnections(LocalPlayer.Idled)) do
            v:Disable()
        end
    end
end)

CreateButton("AntiKick Toggle", function()
    AntiKickEnabled = not AntiKickEnabled
end)

CreateButton("AntiBan Toggle", function()
    AntiBanEnabled = not AntiBanEnabled
end)

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
