game.StarterGui:SetCore("SendNotification", {
    Title = "SHADOW HUB",
    Text = "Chargement du mod... Prépare-toi à dominer 😈",
    Duration = 5
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")
local camera = workspace.CurrentCamera
local runService = game:GetService("RunService")

-- GUI principale
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ShadowHub"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 250)
frame.Position = UDim2.new(0.5, -160, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.BackgroundTransparency = 1
for i = 1, 10 do
    frame.BackgroundTransparency = 1 - (i * 0.1)
    wait(0.05)
end

-- Header et boutons
local header = Instance.new("Frame", frame)
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.new(0, 40, 0, 0)
title.Text = "SHADOW HUB"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.BackgroundTransparency = 1

local settingsBtn = Instance.new("TextButton", header)
settingsBtn.Size = UDim2.new(0, 30, 0, 30)
settingsBtn.Position = UDim2.new(0, 5, 0, 5)
settingsBtn.Text = "⚙️"
settingsBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
settingsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.TextSize = 18

local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18

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

-- Pages
local mainPage = Instance.new("Frame", frame)
mainPage.Size = UDim2.new(1, 0, 1, -40)
mainPage.Position = UDim2.new(0, 0, 0, 40)
mainPage.BackgroundTransparency = 1

local settingsPage = Instance.new("Frame", frame)
settingsPage.Size = UDim2.new(1, 0, 1, -40)
settingsPage.Position = UDim2.new(0, 0, 0, 40)
settingsPage.BackgroundTransparency = 1
settingsPage.Visible = false

local backBtn = Instance.new("TextButton", settingsPage)
backBtn.Size = UDim2.new(0, 100, 0, 30)
backBtn.Position = UDim2.new(0.5, -50, 1, -40)
backBtn.Text = "← Retour"
backBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
backBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
backBtn.Font = Enum.Font.GothamBold
backBtn.TextSize = 18
backBtn.MouseButton1Click:Connect(function()
    settingsPage.Visible = false
    mainPage.Visible = true
end)
settingsBtn.MouseButton1Click:Connect(function()
    settingsPage.Visible = true
    mainPage.Visible = false
end)

-- Infos joueur
local infoText = Instance.new("TextLabel", settingsPage)
infoText.Size = UDim2.new(1, -20, 0, 200)
infoText.Position = UDim2.new(0, 10, 0, 20)
infoText.TextColor3 = Color3.fromRGB(200, 200, 200)
infoText.TextWrapped = true
infoText.TextYAlignment = Enum.TextYAlignment.Top
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 18
infoText.BackgroundTransparency = 1
infoText.Text = string.format("👤 Nom : %s\n🆔 UserId : %d\n💎 Premium : %s\n📅 Ancienneté : %s jours",
    player.Name,
    player.UserId,
    tostring(player.MembershipType == Enum.MembershipType.Premium),
    tostring(player.AccountAge)
)

-- Variables globales
_G.flyEnabled = false
_G.speedEnabled = false
_G.jumpEnabled = false
_G.noclip = false
local buttonY = 0.1
local spacing = 0.2

-- Création des boutons
local function createButton(name, toggleVar, callback)
    local btn = Instance.new("TextButton", mainPage)
    btn.Position = UDim2.new(0.1, 0, buttonY, 0)
    btn.Size = UDim2.new(0, 240, 0, 30)
    btn.Text = name .. ": OFF"
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.MouseButton1Click:Connect(function()
        _G[toggleVar] = not _G[toggleVar]
        btn.Text = name .. (_G[toggleVar] and ": ON" or ": OFF")
        callback(_G[toggleVar])
    end)
    buttonY = buttonY + spacing
end

-- VOL classique style créatif (mobile, bouton saut)
createButton("Vol", "flyEnabled", function(state)
    local speed = 60
    local vertical = 0

    local conn
    conn = runService.RenderStepped:Connect(function(deltaTime)
        if not _G.flyEnabled then
            conn:Disconnect()
            return
        end

        -- Vérifier si le joueur appuie sur le bouton saut
        vertical = humanoid:GetState() == Enum.HumanoidStateType.Jumping or humanoid.Jump
        vertical = vertical and 1 or 0

        -- Mouvement horizontal joystick
        local moveDir = humanoid.MoveDirection
        if moveDir.Magnitude > 0 then
            hrp.CFrame = CFrame.new(hrp.Position, hrp.Position + camera.CFrame.LookVector)
        end

        -- Calcul vecteur de mouvement
        local moveVector = moveDir * speed + Vector3.new(0, vertical * speed, 0)
        hrp.CFrame = hrp.CFrame + moveVector * deltaTime
    end)
end)

-- Vitesse
createButton("Vitesse", "speedEnabled", function(state)
    humanoid.WalkSpeed = state and 100 or 16
end)

-- Saut
createButton("Saut", "jumpEnabled", function(state)
    humanoid.JumpPower = state and 150 or 50
end)

-- Noclip
createButton("Noclip", "noclip", function(state)
    local stepped
    stepped = runService.Stepped:Connect(function()
        if _G.noclip then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        else
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
            if stepped then stepped:Disconnect() end
        end
    end)
end)

-- Animation rouge ↔ bleu
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

animateColor(title)
animateColor(reopenBtn)
