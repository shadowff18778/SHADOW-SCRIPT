-- SHADOW HUB [SUPPORT ALL EXECUTOR]

-- Notification d'intro
game.StarterGui:SetCore("SendNotification", {
    Title = "SHADOW HUB",
    Text = "Chargement du mod... Prépare-toi à dominer 😈",
    Duration = 5
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera

-- GUI Setup
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ShadowHub"

-- Fenêtre principale
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 320)
frame.Position = UDim2.new(0.5, -150, 0.5, -160)
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

-- Bouton Settings à gauche
local settingsBtn = Instance.new("TextButton", frame)
settingsBtn.Size = UDim2.new(0, 30, 0, 30)
settingsBtn.Position = UDim2.new(0, 5, 0, 5)
settingsBtn.Text = "⚙️"
settingsBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
settingsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.TextSize = 18

-- Bouton de fermeture à droite
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

-- Page Settings
local settingsPage = Instance.new("Frame", gui)
settingsPage.Size = UDim2.new(0, 280, 0, 200)
settingsPage.Position = UDim2.new(0.5, -140, 0.5, -100)
settingsPage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
settingsPage.Visible = false
settingsPage.BorderSizePixel = 0

local infoTitle = Instance.new("TextLabel", settingsPage)
infoTitle.Size = UDim2.new(1, 0, 0, 40)
infoTitle.Text = "👤 Infos Joueur"
infoTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
infoTitle.Font = Enum.Font.GothamBold
infoTitle.TextScaled = true
infoTitle.BackgroundTransparency = 1

local infoText = Instance.new("TextLabel", settingsPage)
infoText.Size = UDim2.new(1, -20, 0, 140)
infoText.Position = UDim2.new(0, 10, 0, 50)
infoText.TextColor3 = Color3.fromRGB(200, 200, 200)
infoText.TextWrapped = true
infoText.TextYAlignment = Enum.TextYAlignment.Top
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 18
infoText.BackgroundTransparency = 1

infoText.Text = string.format("Nom : %s\nUserId : %d\nPremium : %s\nAncienneté : %s jours",
    player.Name,
    player.UserId,
    tostring(player.MembershipType == Enum.MembershipType.Premium),
    tostring(player.AccountAge)
)

settingsBtn.MouseButton1Click:Connect(function()
    settingsPage.Visible = not settingsPage.Visible
end)

-- Variables de toggle
local flyEnabled = false
local speedEnabled = false
local jumpEnabled = false
local noclip = false
local noclipConnection

-- Placement propre
local buttonY = 0.2
local spacing = 0.15

-- Bouton Vol
local flyBtn = Instance.new("TextButton", frame)
flyBtn.Position = UDim2.new(0.1, 0, buttonY, 0)
flyBtn.Size = UDim2.new(0, 240, 0, 30)
flyBtn.Text = "Vol: OFF"
flyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
flyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
flyBtn.Font = Enum.Font.GothamBold
flyBtn.TextSize = 18

local bodyVel = nil

flyBtn.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    flyBtn.Text = flyEnabled and "Vol: ON" or "Vol: OFF"
    local hrp = character:WaitForChild("HumanoidRootPart")

    if flyEnabled then
        bodyVel = Instance.new("BodyVelocity", hrp)
        bodyVel.Name = "FlyVelocity"
        bodyVel.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        bodyVel.Velocity = Vector3.zero

        game:GetService("RunService").Heartbeat:Connect(function()
            if flyEnabled and bodyVel and hrp then
                local direction = camera.CFrame.LookVector
                bodyVel.Velocity = direction * 50
            elseif bodyVel then
                bodyVel:Destroy()
            end
        end)
    elseif bodyVel then
        bodyVel:Destroy()
    end
end)
flyBtn.Parent = frame

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
jumpBtn.Font = Enum.Font.Gotham
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

local noclipConnection = nil

noclipBtn.MouseButton1Click:Connect(function()
    noclip = not noclip
    noclipBtn.Text = noclip and "Noclip: ON" or "Noclip: OFF"

    if noclip and not noclipConnection then
        noclipConnection = game:GetService("RunService").Stepped:Connect(function()
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    elseif not noclip and noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end)

-- 🌈 Animation rouge ↔ bleu (header + bouton SHADOW)
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

animateColor(header)
animateColor(reopenBtn)
