-- SHADOW HUB [SUPPORT ALL EXECUTOR]

-- Notification d'intro
game.StarterGui:SetCore("SendNotification", {
    Title = "SHADOW HUB",
    Text = "Chargement du mod... Prépare-toi à dominer 😈",
    Duration = 5
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- GUI Setup
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
frame.BackgroundTransparency = 1

-- Animation d'ouverture
for i = 1, 10 do
    frame.BackgroundTransparency = 1 - (i * 0.1)
    wait(0.05)
end

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

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    reopenBtn.Visible = true
end)

reopenBtn.MouseButton1Click:Connect(function()
    frame.Visible = true
    reopenBtn.Visible = false
end)

-- Variables de toggle
local flyEnabled = false
local speedEnabled = false
local jumpEnabled = false
local noclip = false

-- Bouton Vol
local flyBtn = Instance.new("TextButton", frame)
flyBtn.Position = UDim2.new(0.1, 0, 0.15, 0)
flyBtn.Size = UDim2.new(0, 240, 0, 30)
flyBtn.Text = "Vol: OFF"
flyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

flyBtn.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    flyBtn.Text = flyEnabled and "Vol: ON" or "Vol: OFF"
    local root = character:FindFirstChild("HumanoidRootPart")
    if flyEnabled then
        local bp = Instance.new("BodyPosition", root)
        bp.Name = "FlyBP"
        bp.MaxForce = Vector3.new(0, math.huge, 0)
        bp.Position = root.Position + Vector3.new(0, 50, 0)
    else
        local bp = root:FindFirstChild("FlyBP")
        if bp then bp:Destroy() end
    end
end)

-- Bouton Vitesse
local speedBtn = Instance.new("TextButton", frame)
speedBtn.Position = UDim2.new(0.1, 0, 0.35, 0)
speedBtn.Size = UDim2.new(0, 240, 0, 30)
speedBtn.Text = "Vitesse: OFF"
speedBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
speedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

speedBtn.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    speedBtn.Text = speedEnabled and "Vitesse: ON" or "Vitesse: OFF"
    character.Humanoid.WalkSpeed = speedEnabled and 100 or 16
end)

-- Bouton Saut
local jumpBtn = Instance.new("TextButton", frame)
jumpBtn.Position = UDim2.new(0.1, 0, 0.55, 0)
jumpBtn.Size = UDim2.new(0, 240, 0, 30)
jumpBtn.Text = "Saut: OFF"
jumpBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
jumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

jumpBtn.MouseButton1Click:Connect(function()
    jumpEnabled = not jumpEnabled
    jumpBtn.Text = jumpEnabled and "Saut: ON" or "Saut: OFF"
    character.Humanoid.JumpPower = jumpEnabled and 150 or 50
end)

-- Bouton Noclip
local noclipBtn = Instance.new("TextButton", frame)
noclipBtn.Position = UDim2.new(0.1, 0, 0.75, 0)
noclipBtn.Size = UDim2.new(0, 240, 0, 30)
noclipBtn.Text = "Noclip: OFF"
noclipBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
noclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

noclipBtn.MouseButton1Click:Connect(function()
    noclip = not noclip
    noclipBtn.Text = noclip and "Noclip: ON" or "Noclip: OFF"
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)
