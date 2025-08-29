game.StarterGui:SetCore("SendNotification", {
    Title = "SHADOW HUB",
    Text = "Chargement du mod... Prépare-toi à dominer 😈",
    Duration = 5
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera
local uis = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ShadowHub"

-- Fenêtre principale (taille réduite)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 250) -- 🔹 hauteur ajustée
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

-- Header
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

-- Bouton Settings
local settingsBtn = Instance.new("TextButton", header)
settingsBtn.Size = UDim2.new(0, 30, 0, 30)
settingsBtn.Position = UDim2.new(0, 5, 0, 5)
settingsBtn.Text = "⚙️"
settingsBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
settingsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.TextSize = 18

-- Bouton Fermer
local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18

-- Bouton Réouverture
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

-- Retour vers main
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

-- 🔥 VOL style Minecraft (mobile)
createButton("Vol", "flyEnabled", function(state)
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    if state then
        local bv = Instance.new("BodyVelocity")
        bv.Name = "FlyVelocity"
        bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        bv.Velocity = Vector3.zero
        bv.Parent = hrp

        local conn = game:GetService("RunService").Heartbeat:Connect(function()
            if not _G.flyEnabled then
                conn:Disconnect()
                bv:Destroy()
                return
            end

            -- Déplacement basé sur la caméra
            local move = Vector3.zero
            if uis.TouchEnabled then
                -- mobile : avance avec un bouton tactile spécial
                move = camera.CFrame.LookVector * 50
            end

            bv.Velocity = move
        end)

        -- 📱 Boutons tactiles pour monter/descendre
        local upBtn = Instance.new("TextButton", gui)
        upBtn.Size = UDim2.new(0, 60, 0, 60)
        upBtn.Position = UDim2.new(1, -70, 0.5, -70)
        upBtn.Text = "⬆️"
        upBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        upBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        upBtn.Font = Enum.Font.GothamBold
        upBtn.TextSize = 24
        upBtn.Visible = true

        local downBtn = Instance.new("TextButton", gui)
        downBtn.Size = UDim2.new(0, 60, 0, 60)
        downBtn.Position = UDim2.new(1, -70, 0.5, 10)
        downBtn.Text = "⬇️"
        downBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        downBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        downBtn.Font = Enum.Font.GothamBold
        downBtn.TextSize = 24
        downBtn.Visible = true

        upBtn.MouseButton1Down:Connect(function()
            bv.Velocity = camera.CFrame.UpVector * 50
        end)
        downBtn.MouseButton1Down:Connect(function()
            bv.Velocity = -camera.CFrame.UpVector * 50
        end)

        table.insert(_G.cleanupFlyUI or {}, function()
            upBtn:Destroy()
            downBtn:Destroy()
        end)
    else
        local oldBV = hrp:FindFirstChild("FlyVelocity")
        if oldBV then oldBV:Destroy() end
        if _G.cleanupFlyUI then
            for _, f in pairs(_G.cleanupFlyUI) do f() end
            _G.cleanupFlyUI = {}
        end
    end
end)

-- ⚡ Vitesse
createButton("Vitesse", "speedEnabled", function(state)
    character.Humanoid.WalkSpeed = state and 100 or 16
end)

-- 🦘 Saut
createButton("Saut", "jumpEnabled", function(state)
    character.Humanoid.JumpPower = state and 150 or 50
end)

-- 🧱 Noclip
createButton("Noclip", "noclip", function(state)
    game:GetService("RunService").Stepped:Connect(function()
        if _G.noclip then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end)

-- 🌈 Animation rouge ↔ bleu
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
