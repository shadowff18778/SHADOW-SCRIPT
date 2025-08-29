-- SHADOW HUB [SUPPORT ALL EXECUTOR]

-- Notification d'intro
game.StarterGui:SetCore("SendNotification", {
    Title = "SHADOW HUB",
    Text = "Chargement du mod... Prépare-toi à dominer 😈",
    Duration = 5
})

-- GUI Setup
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ShadowHub"

-- Fenêtre principale
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 250)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

-- Header
local header = Instance.new("TextLabel", frame)
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
header.Text = "SHADOW HUB"
header.TextColor3 = Color3.fromRGB(255, 0, 0)
header.Font = Enum.Font.GothamBold
header.TextSize = 24

-- Bouton de fermeture
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18

-- Bouton pour rouvrir
local reopenBtn = Instance.new("TextButton", gui)
reopenBtn.Size = UDim2.new(0, 100, 0, 30)
reopenBtn.Position = UDim2.new(0, 10, 0, 10)
reopenBtn.Text = "SHADOW"
reopenBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
reopenBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
reopenBtn.Font = Enum.Font.GothamBold
reopenBtn.TextSize = 18
reopenBtn.Visible = false

-- Fermer la fenêtre
closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    reopenBtn.Visible = true
end)

-- Rouvrir la fenêtre
reopenBtn.MouseButton1Click:Connect(function()
    frame.Visible = true
    reopenBtn.Visible = false
end)

-- Boutons de mods
local speedBtn = Instance.new("TextButton", frame)
speedBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
speedBtn.Size = UDim2.new(0, 240, 0, 40)
speedBtn.Text = "Super Vitesse"
speedBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
speedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
speedBtn.MouseButton1Click:Connect(function()
    player.Character.Humanoid.WalkSpeed = 100
end)

local jumpBtn = Instance.new("TextButton", frame)
jumpBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
jumpBtn.Size = UDim2.new(0, 240, 0, 40)
jumpBtn.Text = "Super Saut"
jumpBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
jumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpBtn.MouseButton1Click:Connect(function()
    player.Character.Humanoid.JumpPower = 150
end)

local noclipBtn = Instance.new("TextButton", frame)
noclipBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
noclipBtn.Size = UDim2.new(0, 240, 0, 40)
noclipBtn.Text = "Noclip"
noclipBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
noclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local noclip = false
noclipBtn.MouseButton1Click:Connect(function()
    noclip = not noclip
    noclipBtn.Text = noclip and "Noclip: ON" or "Noclip: OFF"
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)
