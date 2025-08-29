-- SHADOW HUB [SUPPORT ALL EXECUTOR]

-- Intro Notification
game.StarterGui:SetCore("SendNotification", {
    Title = "SHADOW HUB",
    Text = "Chargement du mod... Prépare-toi à dominer 😈",
    Duration = 5
})

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ButtonSpeed = Instance.new("TextButton")
local ButtonJump = Instance.new("TextButton")
local ButtonNoclip = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "ShadowHub"

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 300, 0, 250)
Frame.BorderSizePixel = 0

Title.Parent = Frame
Title.Text = "SHADOW HUB"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24

-- Speed Button
ButtonSpeed.Parent = Frame
ButtonSpeed.Position = UDim2.new(0.1, 0, 0.3, 0)
ButtonSpeed.Size = UDim2.new(0, 240, 0, 40)
ButtonSpeed.Text = "Activer Super Vitesse"
ButtonSpeed.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ButtonSpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonSpeed.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

-- Jump Button
ButtonJump.Parent = Frame
ButtonJump.Position = UDim2.new(0.1, 0, 0.5, 0)
ButtonJump.Size = UDim2.new(0, 240, 0, 40)
ButtonJump.Text = "Activer Super Saut"
ButtonJump.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ButtonJump.TextColor3 = Color3.fromRGB(255, 255, 255)
ButtonJump.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
end)

-- Noclip Button
ButtonNoclip.Parent = Frame
ButtonNoclip.Position = UDim2.new(0.1, 0, 0.7, 0)
ButtonNoclip.Size = UDim2.new(0, 240, 0, 40)
ButtonNoclip.Text = "Activer Noclip"
ButtonNoclip.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ButtonNoclip.TextColor3 = Color3.fromRGB(255, 255, 255)

local noclip = false
ButtonNoclip.MouseButton1Click:Connect(function()
    noclip = not noclip
    ButtonNoclip.Text = noclip and "Noclip: ON" or "Noclip: OFF"
end)

-- Noclip loop
game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)
