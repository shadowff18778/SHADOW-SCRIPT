game.StarterGui:SetCore("SendNotification", {
    Title = "SHADOW HUB",
    Text = "Prépare-toi à dominer 😈",
    Duration = 5
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera
local RS = game:GetService("RunService")

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ShadowHub"

-- =========================
-- PAGE MOT DE PASSE
-- =========================
local passPage = Instance.new("Frame", gui)
passPage.Size = UDim2.new(0, 380, 0, 250)
passPage.Position = UDim2.new(0.5,0,0.5,0)
passPage.AnchorPoint = Vector2.new(0.5,0.5)
passPage.BackgroundColor3 = Color3.fromRGB(25,25,25)
Instance.new("UICorner", passPage).CornerRadius = UDim.new(0,15)
passPage.ClipsDescendants = true
passPage.Visible = true

local passTitle = Instance.new("TextLabel", passPage)
passTitle.Size = UDim2.new(1,-40,0,50)
passTitle.Position = UDim2.new(0,20,0,20)
passTitle.Text = "Mot de passe requis"
passTitle.TextColor3 = Color3.fromRGB(255,50,50)
passTitle.Font = Enum.Font.GothamBold
passTitle.TextSize = 26
passTitle.BackgroundTransparency = 1

local passBox = Instance.new("TextBox", passPage)
passBox.Size = UDim2.new(0,250,0,40)
passBox.Position = UDim2.new(0.5,-125,0.5,-20)
passBox.PlaceholderText = "Entre le mot de passe"
passBox.TextColor3 = Color3.fromRGB(255,255,255)
passBox.BackgroundColor3 = Color3.fromRGB(45,45,45)
passBox.Font = Enum.Font.Gotham
passBox.TextSize = 20
Instance.new("UICorner", passBox).CornerRadius = UDim.new(0,10)

local submitBtn = Instance.new("TextButton", passPage)
submitBtn.Size = UDim2.new(0,140,0,40)
submitBtn.Position = UDim2.new(0.5,-70,0.7,0)
submitBtn.Text = "Valider"
submitBtn.TextColor3 = Color3.fromRGB(255,255,255)
submitBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 22
Instance.new("UICorner", submitBtn).CornerRadius = UDim.new(0,12)

local loadingBarFrame = Instance.new("Frame", passPage)
loadingBarFrame.Size = UDim2.new(0,300,0,20)
loadingBarFrame.Position = UDim2.new(0.5,-150,0.85,0)
loadingBarFrame.BackgroundColor3 = Color3.fromRGB(60,60,60)
Instance.new("UICorner", loadingBarFrame).CornerRadius = UDim.new(0,10)
loadingBarFrame.Visible = false

local loadingBar = Instance.new("Frame", loadingBarFrame)
loadingBar.Size = UDim2.new(0,0,1,0)
loadingBar.BackgroundColor3 = Color3.fromRGB(255,0,0)
Instance.new("UICorner", loadingBar).CornerRadius = UDim.new(0,10)

-- =========================
-- FRAME PRINCIPALE
-- =========================
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,400,0,300)
frame.Position = UDim2.new(0.5,0,0.5,0)
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.BorderSizePixel = 0
frame.Visible = false
frame.ClipsDescendants = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,15)

-- HEADER
local header = Instance.new("Frame", frame)
header.Size = UDim2.new(1,0,0,45)
header.BackgroundColor3 = Color3.fromRGB(15,15,15)
Instance.new("UICorner", header).CornerRadius = UDim.new(0,15)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1,-90,1,0)
title.Position = UDim2.new(0,50,0,0)
title.Text = "SHADOW HUB"
title.TextColor3 = Color3.fromRGB(255,0,0)
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.BackgroundTransparency = 1

local settingsBtn = Instance.new("TextButton", header)
settingsBtn.Size = UDim2.new(0,35,0,35)
settingsBtn.Position = UDim2.new(0,5,0,5)
settingsBtn.Text = "⚙️"
settingsBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
settingsBtn.TextColor3 = Color3.fromRGB(255,255,255)
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.TextSize = 22
Instance.new("UICorner", settingsBtn).CornerRadius = UDim.new(0,8)

local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0,35,0,35)
closeBtn.Position = UDim2.new(1,-40,0,5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(120,0,0)
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 22
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,8)

local reopenBtn = Instance.new("TextButton", gui)
reopenBtn.Size = UDim2.new(0,120,0,35)
reopenBtn.Position = UDim2.new(0.5,-60,0.9,0)
reopenBtn.Text = "SHADOW"
reopenBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
reopenBtn.TextColor3 = Color3.fromRGB(255,0,0)
reopenBtn.Font = Enum.Font.GothamBold
reopenBtn.TextSize = 20
reopenBtn.Visible = false
Instance.new("UICorner", reopenBtn).CornerRadius = UDim.new(0,10)

-- PAGES
local mainPage = Instance.new("Frame", frame)
mainPage.Size = UDim2.new(1,0,1,-45)
mainPage.Position = UDim2.new(0,0,0,45)
mainPage.BackgroundTransparency = 1

local settingsPage = Instance.new("Frame", frame)
settingsPage.Size = UDim2.new(1,0,1,-45)
settingsPage.Position = UDim2.new(0,0,0,45)
settingsPage.BackgroundTransparency = 1
settingsPage.Visible = false

local infoPage = Instance.new("Frame", frame)
infoPage.Size = UDim2.new(1,0,1,-45)
infoPage.Position = UDim2.new(0,0,0,45)
infoPage.BackgroundTransparency = 1
infoPage.Visible = false

local personalPage = Instance.new("Frame", frame)
personalPage.Size = UDim2.new(1,0,1,-45)
personalPage.Position = UDim2.new(0,0,0,45)
personalPage.BackgroundTransparency = 1
personalPage.Visible = false

-- =========================
-- INFOS JOUEUR
-- =========================
local infoBtn = Instance.new("TextButton", settingsPage)
infoBtn.Size = UDim2.new(0,180,0,35)
infoBtn.Position = UDim2.new(0.5,-90,0.2,0)
infoBtn.Text = "Infos Joueurs"
infoBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
infoBtn.TextColor3 = Color3.fromRGB(255,255,255)
infoBtn.Font = Enum.Font.GothamBold
infoBtn.TextSize = 20
Instance.new("UICorner", infoBtn).CornerRadius = UDim.new(0,10)

local backInfoBtn = Instance.new("TextButton", infoPage)
backInfoBtn.Size = UDim2.new(0,120,0,35)
backInfoBtn.Position = UDim2.new(0.5,-60,1,-50)
backInfoBtn.Text = "← Retour"
backInfoBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
backInfoBtn.TextColor3 = Color3.fromRGB(255,255,255)
backInfoBtn.Font = Enum.Font.GothamBold
backInfoBtn.TextSize = 20
Instance.new("UICorner", backInfoBtn).CornerRadius = UDim.new(0,10)
backInfoBtn.MouseButton1Click:Connect(function()
    infoPage.Visible = false
    settingsPage.Visible = true
end)

local infoText = Instance.new("TextLabel", infoPage)
infoText.Size = UDim2.new(1,-40,1,-60)
infoText.Position = UDim2.new(0,20,0,20)
infoText.TextColor3 = Color3.fromRGB(200,200,200)
infoText.TextWrapped = true
infoText.TextYAlignment = Enum.TextYAlignment.Top
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 18
infoText.BackgroundTransparency = 1

-- Page perso
local backPersonalBtn = Instance.new("TextButton", personalPage)
backPersonalBtn.Size = UDim2.new(0,120,0,35)
backPersonalBtn.Position = UDim2.new(0.5,-60,1,-50)
backPersonalBtn.Text = "← Retour"
backPersonalBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
backPersonalBtn.TextColor3 = Color3.fromRGB(255,255,255)
backPersonalBtn.Font = Enum.Font.GothamBold
backPersonalBtn.TextSize = 20
Instance.new("UICorner", backPersonalBtn).CornerRadius = UDim.new(0,10)
backPersonalBtn.MouseButton1Click:Connect(function()
    personalPage.Visible = false
    infoPage.Visible = true
end)

local personalInfoText = Instance.new("TextLabel", personalPage)
personalInfoText.Size = UDim2.new(1,-40,1,-60)
personalInfoText.Position = UDim2.new(0,20,0,20)
personalInfoText.TextColor3 = Color3.fromRGB(255,50,50)
personalInfoText.TextWrapped = true
personalInfoText.TextYAlignment = Enum.TextYAlignment.Top
personalInfoText.TextXAlignment = Enum.TextXAlignment.Left
personalInfoText.Font = Enum.Font.GothamBold
personalInfoText.TextSize = 18
personalInfoText.BackgroundTransparency = 1

infoBtn.MouseButton1Click:Connect(function()
    settingsPage.Visible = false
    infoPage.Visible = true
    spawn(function()
        while infoPage.Visible do
            local text = "👤 Joueurs dans le jeu :\n"
            for i, plr in pairs(game.Players:GetPlayers()) do
                text = text..string.format("%d. %s\n", i, plr.Name)
            end
            infoText.Text = text
            wait(1)
        end
    end)
end)

-- Infos perso quand on clique sur son nom
infoText.MouseButton1Click:Connect(function()
    infoPage.Visible = false
    personalPage.Visible = true
    personalInfoText.Text = string.format(
        "👤 Nom : %s\n🆔 UserId : %d\n💎 Premium : %s\n📅 Ancienneté : %s jours\n- HumanoidRootPart Pos: %s",
        player.Name,
        player.UserId,
        tostring(player.MembershipType == Enum.MembershipType.Premium),
        tostring(player.AccountAge),
        tostring(character:FindFirstChild("HumanoidRootPart") and tostring(character.HumanoidRootPart.Position) or "N/A")
    )
end)

-- =========================
-- CHEATS ET TELEPORT
-- =========================
_G.flyEnabled = false
_G.speedEnabled = false
_G.jumpEnabled = false
_G.noclip = false
local teleportPoint = nil
local teleportMarker = nil

local buttonY = 0.1
local spacing = 0.18

local function createButton(name,toggleVar,callback)
    local btn = Instance.new("TextButton", mainPage)
    btn.Size = UDim2.new(0,280,0,35)
    btn.Position = UDim2.new(0.5,-140,buttonY,0)
    btn.Text = name..": OFF"
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 20
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)

    btn.MouseButton1Click:Connect(function()
        _G[toggleVar] = not _G[toggleVar]
        btn.Text = name..(_G[toggleVar] and ": ON" or ": OFF")
        callback(_G[toggleVar])
    end)

    buttonY = buttonY + spacing
end

-- Fly
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
        conn = RS.Heartbeat:Connect(function()
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

-- Speed
createButton("Vitesse","speedEnabled",function(state)
    character.Humanoid.WalkSpeed = state and 100 or 16
end)

-- Jump
createButton("Saut","jumpEnabled",function(state)
    character.Humanoid.JumpPower = state and 150 or 50
end)

-- Noclip
createButton("Noclip","noclip",function(state)
    RS.Stepped:Connect(function()
        if _G.noclip then
            for _,part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end)

-- TELEPORT BUTTON
local teleportBtn = Instance.new("TextButton", mainPage)
teleportBtn.Size = UDim2.new(0,280,0,35)
teleportBtn.Position = UDim2.new(0.5,-140,buttonY,0)
teleportBtn.Text = "Set Teleport Point"
teleportBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
teleportBtn.TextColor3 = Color3.fromRGB(255,255,255)
teleportBtn.Font = Enum.Font.GothamBold
teleportBtn.TextSize = 20
Instance.new("UICorner", teleportBtn).CornerRadius = UDim.new(0,10)
buttonY = buttonY + spacing

teleportBtn.MouseButton1Click:Connect(function()
    if teleportPoint then
        teleportPoint:Destroy()
        teleportPoint = nil
        if teleportMarker then teleportMarker:Destroy() teleportMarker=nil end
        teleportBtn.Text = "Set Teleport Point"
        return
    end
    teleportPoint = character.HumanoidRootPart.Position
    teleportBtn.Text = "Teleport Here"
    teleportMarker = Instance.new("BillboardGui", workspace)
    teleportMarker.Adornee = Instance.new("Part", workspace)
    teleportMarker.Adornee.Anchored = true
    teleportMarker.Adornee.CanCollide = false
    teleportMarker.Adornee.Size = Vector3.new(1,1,1)
    teleportMarker.Size = UDim2.new(0,50,0,50)
    local txt = Instance.new("TextLabel", teleportMarker)
    txt.Text = "POINT"
    txt.Size = UDim2.new(1,0,1,0)
    txt.BackgroundTransparency = 1
    txt.TextColor3 = Color3.fromRGB(255,0,0)
    txt.Font = Enum.Font.GothamBold
    txt.TextScaled = true
end)

spawn(function()
    while true do
        if teleportPoint and teleportBtn.Text == "Teleport Here" then
            if teleportBtn.MouseButton1Click then
                character.HumanoidRootPart.CFrame = CFrame.new(teleportPoint + Vector3.new(0,3,0))
            end
        end
        wait(0.1)
    end
end)

-- Animations de couleurs
spawn(function()
    while true do
        for i=0,1,0.01 do
            title.TextColor3 = Color3.fromHSV(i,1,1)
            reopenBtn.TextColor3 = Color3.fromHSV(i,1,1)
            wait(0.03)
        end
    end
end)

-- OPEN/CLOSE FRAME
local function openFrame(f)
    f.Visible = true
    f.Size = UDim2.new(0,0,0,0)
    for i=0,1,0.05 do
        f.Size = UDim2.new(0,400*i,0,300*i)
        wait(0.01)
    end
end

local function closeFrame(f)
    for i=1,0,-0.05 do
        f.Size = UDim2.new(0,400*i,0,300*i)
        wait(0.01)
    end
    f.Visible = false
end

closeBtn.MouseButton1Click:Connect(function()
    closeFrame(frame)
    reopenBtn.Visible = true
end)

reopenBtn.MouseButton1Click:Connect(function()
    openFrame(frame)
    reopenBtn.Visible = false
end)

-- MOT DE PASSE
submitBtn.MouseButton1Click:Connect(function()
    if passBox.Text == "95741" then
        loadingBarFrame.Visible = true
        for i=1,100 do
            loadingBar.Size = UDim2.new(i/100,0,1,0)
            loadingBar.BackgroundColor3 = Color3.fromHSV(i/100,1,1)
            wait(0.03)
        end
        passPage:Destroy()
        wait(0.1) -- petit délai pour s'assurer que GUI est prêt
        if frame and player:FindFirstChild("PlayerGui") then
            openFrame(frame)
        end
    else
        passBox.Text = ""
        passBox.PlaceholderText = "Mot de passe incorrect"
    end
end)
