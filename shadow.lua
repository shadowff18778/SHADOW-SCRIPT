game.StarterGui:SetCore("SendNotification", {
    Title = "SHADOW HUB",
    Text = "Prépare-toi à dominer 😈",
    Duration = 5
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ShadowHub"

-- =========================
-- PAGE MOT DE PASSE
-- =========================
local passPage = Instance.new("Frame", gui)
passPage.Size = UDim2.new(0, 360, 0, 260)
passPage.Position = UDim2.new(0.5, -180, 0.5, -130)
passPage.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
passPage.BorderSizePixel = 0
passPage.AnchorPoint = Vector2.new(0.5, 0.5)

local passTitle = Instance.new("TextLabel", passPage)
passTitle.Size = UDim2.new(1, -20, 0, 50)
passTitle.Position = UDim2.new(0, 10, 0, 20)
passTitle.Text = "Mot de passe requis"
passTitle.TextColor3 = Color3.fromRGB(255, 50, 50)
passTitle.Font = Enum.Font.GothamBold
passTitle.TextSize = 24
passTitle.BackgroundTransparency = 1

local passBox = Instance.new("TextBox", passPage)
passBox.Size = UDim2.new(0, 240, 0, 40)
passBox.Position = UDim2.new(0.5, -120, 0.5, -20)
passBox.PlaceholderText = "Entre le mot de passe"
passBox.Text = ""
passBox.ClearTextOnFocus = true
passBox.TextColor3 = Color3.fromRGB(255,255,255)
passBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
passBox.Font = Enum.Font.Gotham
passBox.TextSize = 20
Instance.new("UICorner", passBox).CornerRadius = UDim.new(0,8)

local submitBtn = Instance.new("TextButton", passPage)
submitBtn.Size = UDim2.new(0, 120, 0, 35)
submitBtn.Position = UDim2.new(0.5, -60, 0.7, 0)
submitBtn.Text = "Valider"
submitBtn.TextColor3 = Color3.fromRGB(255,255,255)
submitBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 20
Instance.new("UICorner", submitBtn).CornerRadius = UDim.new(0,10)

local loadingBar = Instance.new("Frame", passPage)
loadingBar.Size = UDim2.new(0, 0, 0, 20)
loadingBar.Position = UDim2.new(0.5, -150, 0.85, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(255,0,0)
Instance.new("UICorner", loadingBar).CornerRadius = UDim.new(0,10)
loadingBar.Visible = false

-- =========================
-- FRAME PRINCIPALE
-- =========================
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 360, 0, 260)
frame.Position = UDim2.new(0.5, -180, 0.5, -130)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Visible = false
frame.BackgroundTransparency = 0
frame.AnchorPoint = Vector2.new(0.5,0.5)
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,15)

-- Header
local header = Instance.new("Frame", frame)
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(10,10,10)
local headerCorner = Instance.new("UICorner", header)
headerCorner.CornerRadius = UDim.new(0,15)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.new(0, 40, 0, 0)
title.Text = "SHADOW HUB"
title.TextColor3 = Color3.fromRGB(255,0,0)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.BackgroundTransparency = 1

-- Boutons
local settingsBtn = Instance.new("TextButton", header)
settingsBtn.Size = UDim2.new(0, 30, 0, 30)
settingsBtn.Position = UDim2.new(0,5,0,5)
settingsBtn.Text = "⚙️"
settingsBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
settingsBtn.TextColor3 = Color3.fromRGB(255,255,255)
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.TextSize = 18
Instance.new("UICorner", settingsBtn).CornerRadius = UDim.new(0,5)

local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1,-35,0,5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(100,0,0)
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,5)

local reopenBtn = Instance.new("TextButton", gui)
reopenBtn.Size = UDim2.new(0,100,0,30)
reopenBtn.Position = UDim2.new(0,10,0,10)
reopenBtn.Text = "SHADOW"
reopenBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
reopenBtn.TextColor3 = Color3.fromRGB(255,0,0)
reopenBtn.Font = Enum.Font.GothamBold
reopenBtn.TextSize = 18
reopenBtn.Visible = false
Instance.new("UICorner", reopenBtn).CornerRadius = UDim.new(0,8)

-- Pages
local mainPage = Instance.new("Frame", frame)
mainPage.Size = UDim2.new(1,0,1,-40)
mainPage.Position = UDim2.new(0,0,0,40)
mainPage.BackgroundTransparency = 1

local settingsPage = Instance.new("Frame", frame)
settingsPage.Size = UDim2.new(1,0,1,-40)
settingsPage.Position = UDim2.new(0,0,0,40)
settingsPage.BackgroundTransparency = 1
settingsPage.Visible = false

-- Retour vers main
local backBtn = Instance.new("TextButton", settingsPage)
backBtn.Size = UDim2.new(0,100,0,30)
backBtn.Position = UDim2.new(0.5,-50,1,-40)
backBtn.Text = "← Retour"
backBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
backBtn.TextColor3 = Color3.fromRGB(255,255,255)
backBtn.Font = Enum.Font.GothamBold
backBtn.TextSize = 18
Instance.new("UICorner", backBtn).CornerRadius = UDim.new(0,5)

backBtn.MouseButton1Click:Connect(function()
    settingsPage.Visible = false
    mainPage.Visible = true
end)

settingsBtn.MouseButton1Click:Connect(function()
    settingsPage.Visible = true
    mainPage.Visible = false
end)

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    reopenBtn.Visible = true
end)

reopenBtn.MouseButton1Click:Connect(function()
    frame.Visible = true
    reopenBtn.Visible = false
end)

-- Infos joueur
local infoText = Instance.new("TextLabel", settingsPage)
infoText.Size = UDim2.new(1,-20,0,200)
infoText.Position = UDim2.new(0,10,0,20)
infoText.TextColor3 = Color3.fromRGB(200,200,200)
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

-- Création des boutons
local buttonY = 0.1
local spacing = 0.2

local function createButton(name, toggleVar, callback)
    local btn = Instance.new("TextButton", mainPage)
    btn.Position = UDim2.new(0.1,0,buttonY,0)
    btn.Size = UDim2.new(0,240,0,30)
    btn.Text = name..": OFF"
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)

    btn.MouseButton1Click:Connect(function()
        _G[toggleVar] = not _G[toggleVar]
        btn.Text = name..(_G[toggleVar] and ": ON" or ": OFF")
        callback(_G[toggleVar])
    end)

    buttonY = buttonY + spacing
end

-- 🔥 Fonctions cheat
createButton("Vol","flyEnabled",function(state)
    local hrp = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not hrp or not humanoid then return end

    if state then
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        local bv = Instance.new("BodyVelocity",hrp)
        bv.Name = "FlyVelocity"
        bv.MaxForce = Vector3.new(1e5,1e5,1e5)
        bv.Velocity = Vector3.zero
        local bg = Instance.new("BodyGyro",hrp)
        bg.Name = "FlyGyro"
        bg.MaxTorque = Vector3.new(1e5,1e5,1e5)
        bg.P = 1e4
        bg.CFrame = hrp.CFrame

        local conn
        conn = game:GetService("RunService").Heartbeat:Connect(function()
            if not _G.flyEnabled then
                conn:Disconnect()
                bv:Destroy()
                bg:Destroy()
                humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
                return
            end
            local moveDir = humanoid.MoveDirection
            local camCF = camera.CFrame
            bg.CFrame = CFrame.new(hrp.Position, hrp.Position + camCF.LookVector)
            if moveDir.Magnitude > 0 then
                local forward = camCF.LookVector
                local right = camCF.RightVector
                local move = (forward*moveDir.Z + right*moveDir.X).Unit
                bv.Velocity = move*60
            else
                bv.Velocity = Vector3.zero
            end
        end)
    else
        local oldBV = hrp:FindFirstChild("FlyVelocity")
        if oldBV then oldBV:Destroy() end
        local oldBG = hrp:FindFirstChild("FlyGyro")
        if oldBG then oldBG:Destroy() end
        humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    end
end)

createButton("Vitesse","speedEnabled",function(state)
    character.Humanoid.WalkSpeed = state and 100 or 16
end)

createButton("Saut","jumpEnabled",function(state)
    character.Humanoid.JumpPower = state and 150 or 50
end)

createButton("Noclip","noclip",function(state)
    game:GetService("RunService").Stepped:Connect(function()
        if _G.noclip then
            for _,part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end)

-- Animation rouge ↔ bleu
local function animateColor(textLabel)
    spawn(function()
        while true do
            for i=0,1,0.01 do
                textLabel.TextColor3 = Color3.fromRGB(math.floor(255*(1-i)),0,math.floor(255*i))
                wait(0.05)
            end
            for i=0,1,0.01 do
                textLabel.TextColor3 = Color3.fromRGB(math.floor(255*i),0,math.floor(255*(1-i)))
                wait(0.05)
            end
        end
    end)
end

animateColor(title)
animateColor(reopenBtn)

-- =========================
-- VALIDATION MOT DE PASSE
-- =========================
submitBtn.MouseButton1Click:Connect(function()
    if passBox.Text == "95741" then
        loadingBar.Visible = true
        for i = 1,100 do
            loadingBar.Size = UDim2.new(i/100,0,0,20)
            wait(0.05)
        end
        passPage:Destroy()
        frame.Visible = true
    else
        passBox.Text = ""
        passBox.PlaceholderText = "Mot de passe incorrect"
    end
end)
