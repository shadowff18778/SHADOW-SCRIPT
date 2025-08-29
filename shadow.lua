-- SHADOW HUB [SUPPORT ALL EXECUTOR]

-- Notification d'intro
game.StarterGui:SetCore("SendNotification", {
    Title = "SHADOW HUB",
    Text = "Chargement du mod... Prépare-toi à dominer 😈",
    Duration = 5
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local mouse = player:GetMouse()

-- GUI Setup
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ShadowHub"

-- Fenêtre principale
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 300)
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

-- Placement propre
local buttonY = 0.25
local spacing = 0.14

-- Bouton Vol (Creative Mode)
local flyBtn = Instance.new("TextButton", frame)
flyBtn.Position = UDim2.new(0.1, 0, buttonY, 0)
flyBtn.Size = UDim2.new(0, 240, 0, 30)
flyBtn.Text = "Vol Créatif: OFF"
flyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
flyBtn.Font = Enum.Font.GothamBold
flyBtn.TextSize = 18
flyBtn.Parent = frame

local flying = false
local flySpeed = 3

flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    flyBtn.Text = flying and "Vol Créatif: ON" or "Vol Créatif: OFF"
    local hrp = character:WaitForChild("HumanoidRootPart")
    local bv = hrp:FindFirstChild("FlyVelocity")
    if not flying and bv then
        bv:Destroy()
    elseif flying and not bv then
        local bodyVel = Instance.new("BodyVelocity", hrp)
        bodyVel.Name = "FlyVelocity"
        bodyVel.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        bodyVel.Velocity = Vector3.zero

        game:GetService("RunService").Heartbeat:Connect(function()
            if flying and bodyVel.Parent then
                local move = Vector3.zero
                if mouse.KeyDown then
                    if mouse:IsKeyDown("w") then move = move + workspace.CurrentCamera.CFrame.LookVector end
                    if mouse:IsKeyDown("s") then move = move - workspace.CurrentCamera.CFrame.LookVector end
                    if mouse:IsKeyDown("a") then move = move - workspace.CurrentCamera.CFrame.RightVector end
                    if mouse:IsKeyDown("d") then move = move + workspace.CurrentCamera.CFrame.RightVector end
                    if mouse:IsKeyDown("space") then move = move + Vector3.new(0, 1, 0) end
                    if mouse:IsKeyDown("leftctrl") then move = move - Vector3.new(0, 1, 0) end
                end
                bodyVel.Velocity = move.Unit * flySpeed
            end
        end)
    end
end)

-- Bouton Vitesse
local speedBtn = Instance.new("TextButton", frame)
speedBtn.Position = UDim2.new(0.1, 0, buttonY + spacing, 0)
speedBtn.Size = UDim2.new(0, 240, 0, 30)
speedBtn.Text = "Vitesse: OFF"
speedBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
speedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
speedBtn.Font = Enum.Font.GothamBold
speedBtn.TextSize = 18
speedBtn.Parent = frame

speedBtn.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    speedBtn.Text = speedEnabled and "Vitesse: ON" or "Vitesse: OFF"
    character.Humanoid.WalkSpeed = speedEnabled and 100 or 16
end)

-- Bouton Saut
local jumpBtn = Instance.new("TextButton", frame)
jumpBtn.Position = UDim2.new(0.1, 0, buttonY + spacing * 2, 0)
jumpBtn.Size = UDim2.new(0, 240, 0, 30)
jumpBtn.Text = "Saut: OFF"
jumpBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
jumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpBtn.Font = Enum.Font.GothamBold
jumpBtn.TextSize = 18
jumpBtn.Parent = frame

jumpBtn.MouseButton1Click:Connect(function()
    jumpEnabled = not jumpEnabled
    jumpBtn.Text = jumpEnabled and "Saut: ON" or "Saut: OFF"
    character.Humanoid.JumpPower = jumpEnabled and 150 or 50
end)

-- Bouton Noclip
local noclipBtn = Instance.new("TextButton", frame)
noclipBtn.Position = UDim2.new(0.1, 0, buttonY + spacing * 3, 0)
noclipBtn.Size = UDim2.new(0, 240, 0, 30)
noclipBtn.Text = "Noclip: OFF"
noclipBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
noclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
noclipBtn.Font = Enum.Font.GothamBold
noclipBtn.TextSize = 18
noclipBtn.Parent = frame

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

-- 🌈 Animation de couleur (rouge ↔ bleu)
local function animateColor(textLabel)
    spawn(function()
        while true do
            for i = 0, 1, 0.01 do
                local r = math.floor(255 * (1 - i))
                local b = math.floor(255 * i)
                textLabel.TextColor3 = Color3.fromRGB(r, 0, b)
                wait(0.05)
            end
            for i = 0, 1, 0.01 do
                local r = math.floor(255 * i)
                local b = math.floor(255 * (1 - i))
                textLabel.TextColor3 = Color3.fromRGB(r, 0, b)
                wait(0.05)
            end
        end
    end)
end

-- Appliquer l'animation au header et au bouton SHADOW
animateColor(header)
animateColor(reopenBtn)
