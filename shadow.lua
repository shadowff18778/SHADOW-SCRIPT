game.StarterGui:SetCore("SendNotification", {
    Title = "SHADOW HUB",
    Text = "Prépare-toi à dominer 😈",
    Duration = 5
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera
local RS = game:GetService("RunService")
local TS = game:GetService("TweenService")

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

-- Ajout du contour (UIStroke) pour l'effet de glow
local passStroke = Instance.new("UIStroke", passBox)
passStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
passStroke.Color = Color3.fromRGB(255, 50, 50)
passStroke.Transparency = 1 -- Commence transparent
passStroke.Thickness = 2

-- Ajout d'une ombre portée pour un effet 3D subtil
local passShadow = Instance.new("UIStroke", passBox)
passShadow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
passShadow.Color = Color3.fromRGB(0, 0, 0)
passShadow.Transparency = 0.5
passShadow.Thickness = 1
passShadow.LineJoinMode = Enum.LineJoinMode.Round

-- Animation du glow lorsque la boîte de texte est cliquée
passBox.Focused:Connect(function()
	local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local properties = {Transparency = 0, Thickness = 2}
	local glowTween = TS:Create(passStroke, tweenInfo, properties)
	glowTween:Play()
end)

passBox.FocusLost:Connect(function()
	local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
	local properties = {Transparency = 1, Thickness = 1}
	local glowTween = TS:Create(passStroke, tweenInfo, properties)
	glowTween:Play()
end)

local submitBtn = Instance.new("TextButton", passPage)
submitBtn.Size = UDim2.new(0,140,0,40)
submitBtn.Position = UDim2.new(0.5,-70,0.7,0)
submitBtn.Text = "Valider"
submitBtn.TextColor3 = Color3.fromRGB(255,255,255)
submitBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 22
Instance.new("UICorner", submitBtn).CornerRadius = UDim.new(0,12)

-- Loading stylé
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

-- Animation ouverture
local function openFrame(f)
    f.Visible = true
    f.Size = UDim2.new(0,0,0,0)
    for i=0,1,0.05 do
        f.Size = UDim2.new(0,400*i,0,300*i)
        wait(0.01)
    end
end

-- Animation fermeture
local function closeFrame(f)
    for i=1,0,-0.05 do
        f.Size = UDim2.new(0,400*i,0,300*i)
        wait(0.01)
    end
    f.Visible = false
end

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

-- Boutons
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

-- =========================
-- INFOS JOUEUR (avec Scroll et téléport)
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

local infoPage = Instance.new("Frame", frame)
infoPage.Size = UDim2.new(1,0,1,-45)
infoPage.Position = UDim2.new(0,0,0,45)
infoPage.BackgroundTransparency = 1
infoPage.Visible = false

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

-- ScrollingFrame pour la liste des joueurs
local playerList = Instance.new("ScrollingFrame", infoPage)
playerList.Size = UDim2.new(1,-40,1,-60)
playerList.Position = UDim2.new(0,20,0,20)
playerList.BackgroundTransparency = 1
playerList.CanvasSize = UDim2.new(0,0,0,0)
playerList.ScrollBarThickness = 6

-- Layout pour organiser les boutons
local listLayout = Instance.new("UIListLayout", playerList)
listLayout.Padding = UDim.new(0,5)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Texte d’en-tête
local infoText = Instance.new("TextLabel", playerList)
infoText.Size = UDim2.new(1,0,0,30)
infoText.Text = "👤 Joueurs dans le jeu :"
infoText.TextColor3 = Color3.fromRGB(200,200,200)
infoText.Font = Enum.Font.GothamBold
infoText.TextSize = 18
infoText.BackgroundTransparency = 1
infoText.TextXAlignment = Enum.TextXAlignment.Left

-- Fonction pour créer les boutons des joueurs
local function createPlayerButtons()
    -- Supprimer les anciens boutons (sauf le texte d’en-tête)
    for _, child in pairs(playerList:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    -- Créer un bouton pour chaque joueur
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player then
            local playerBtn = Instance.new("TextButton", playerList)
            playerBtn.Size = UDim2.new(1, -10, 0, 30)
            playerBtn.Text = plr.Name
            playerBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
            playerBtn.TextColor3 = Color3.fromRGB(255,255,255)
            playerBtn.Font = Enum.Font.Gotham
            playerBtn.TextSize = 18
            Instance.new("UICorner", playerBtn).CornerRadius = UDim.new(0,5)

            playerBtn.MouseButton1Click:Connect(function()
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    character.HumanoidRootPart.CFrame = CFrame.new(plr.Character.HumanoidRootPart.Position + Vector3.new(0,3,0))
                end
            end)
        end
    end

    -- Ajuste la taille du canvas pour activer le scroll si besoin
    playerList.CanvasSize = UDim2.new(0,0,0,listLayout.AbsoluteContentSize.Y)
end

-- Quand on clique sur "Infos Joueurs"
infoBtn.MouseButton1Click:Connect(function()
    settingsPage.Visible = false
    infoPage.Visible = true
    spawn(function()
        while infoPage.Visible do
            createPlayerButtons()
            wait(1)
        end
    end)
end)


-- =========================
-- BOUTON TELEPORTATION
-- =========================
local gameSetBtn = Instance.new("TextButton", settingsPage)
gameSetBtn.Size = UDim2.new(0,180,0,35)
gameSetBtn.Position = UDim2.new(0.5,-90,0.35,0)
gameSetBtn.Text = "Game Set"
gameSetBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
gameSetBtn.TextColor3 = Color3.fromRGB(255,255,255)
gameSetBtn.Font = Enum.Font.GothamBold
gameSetBtn.TextSize = 20
Instance.new("UICorner", gameSetBtn).CornerRadius = UDim.new(0,10)

local gamePage = Instance.new("Frame", frame)
gamePage.Size = UDim2.new(1,0,1,-45)
gamePage.Position = UDim2.new(0,0,0,45)
gamePage.BackgroundTransparency = 1
gamePage.Visible = false

local backGameBtn = Instance.new("TextButton", gamePage)
backGameBtn.Size = UDim2.new(0,120,0,35)
backGameBtn.Position = UDim2.new(0.5,-60,1,-50)
backGameBtn.Text = "← Retour"
backGameBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
backGameBtn.TextColor3 = Color3.fromRGB(255,255,255)
backGameBtn.Font = Enum.Font.GothamBold
backGameBtn.TextSize = 20
Instance.new("UICorner", backGameBtn).CornerRadius = UDim.new(0,10)
backGameBtn.MouseButton1Click:Connect(function()
    gamePage.Visible = false
    settingsPage.Visible = true
end)

-- Teleport buttons
local setPointBtn = Instance.new("TextButton", gamePage)
setPointBtn.Size = UDim2.new(0,120,0,35)
setPointBtn.Position = UDim2.new(0.5,-60,0.3,0)
setPointBtn.Text = "Set Point"
setPointBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
setPointBtn.TextColor3 = Color3.fromRGB(255,255,255)
setPointBtn.Font = Enum.Font.GothamBold
setPointBtn.TextSize = 20
Instance.new("UICorner", setPointBtn).CornerRadius = UDim.new(0,10)

local goPointBtn = Instance.new("TextButton", gamePage)
goPointBtn.Size = UDim2.new(0,120,0,35)
goPointBtn.Position = UDim2.new(0.5,-60,0.45,0)
goPointBtn.Text = "Go To Point"
goPointBtn.BackgroundColor3 = Color3.fromRGB(0,255,0)
goPointBtn.TextColor3 = Color3.fromRGB(0,0,0)
goPointBtn.Font = Enum.Font.GothamBold
goPointBtn.TextSize = 20
Instance.new("UICorner", goPointBtn).CornerRadius = UDim.new(0,10)

local removePointBtn = Instance.new("TextButton", gamePage)
removePointBtn.Size = UDim2.new(0,120,0,35)
removePointBtn.Position = UDim2.new(0.5,-60,0.6,0)
removePointBtn.Text = "Remove Point"
removePointBtn.BackgroundColor3 = Color3.fromRGB(255,100,100)
removePointBtn.TextColor3 = Color3.fromRGB(0,0,0)
removePointBtn.Font = Enum.Font.GothamBold
removePointBtn.TextSize = 20
Instance.new("UICorner", removePointBtn).CornerRadius = UDim.new(0,10)

local teleportPoint
local marker

setPointBtn.MouseButton1Click:Connect(function()
    teleportPoint = character.HumanoidRootPart.Position
    if marker then marker:Destroy() end
    marker = Instance.new("Part", workspace)
    marker.Size = Vector3.new(2,2,2)
    marker.Anchored = true
    marker.CanCollide = false
    marker.BrickColor = BrickColor.Red()
    marker.Position = teleportPoint + Vector3.new(0,2,0)
    marker.Name = "TeleportMarker"
end)

goPointBtn.MouseButton1Click:Connect(function()
    if teleportPoint then
        character.HumanoidRootPart.CFrame = CFrame.new(teleportPoint + Vector3.new(0,3,0))
    end
end)

removePointBtn.MouseButton1Click:Connect(function()
    teleportPoint = nil
    if marker then
        marker:Destroy()
        marker = nil
    end
end)

gameSetBtn.MouseButton1Click:Connect(function()
    settingsPage.Visible = false
    gamePage.Visible = true
end)

-- BACK BUTTON SETTINGS
local backBtn = Instance.new("TextButton", settingsPage)
backBtn.Size = UDim2.new(0,120,0,35)
backBtn.Position = UDim2.new(0.5,-60,1,-50)
backBtn.Text = "← Retour"
backBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
backBtn.TextColor3 = Color3.fromRGB(255,255,255)
backBtn.Font = Enum.Font.GothamBold
backBtn.TextSize = 20
Instance.new("UICorner", backBtn).CornerRadius = UDim.new(0,10)
backBtn.MouseButton1Click:Connect(function()
    settingsPage.Visible = false
    mainPage.Visible = true
end)

settingsBtn.MouseButton1Click:Connect(function()
    settingsPage.Visible = true
    mainPage.Visible = false
end)

closeBtn.MouseButton1Click:Connect(function()
    closeFrame(frame)
    reopenBtn.Visible = true
end)

reopenBtn.MouseButton1Click:Connect(function()
    openFrame(frame)
    reopenBtn.Visible = false
end)

-- Signature RGB
local signature = Instance.new("TextLabel", frame)
signature.Size = UDim2.new(1,0,0,20)
signature.Position = UDim2.new(0,0,1,-25)
signature.Text = "Powered by SHADOW"
signature.Font = Enum.Font.GothamBold
signature.TextSize = 16
signature.TextColor3 = Color3.fromRGB(255,0,0)
signature.BackgroundTransparency = 1
signature.TextScaled = true

spawn(function()
    while true do
        for i=0,1,0.01 do
            signature.TextColor3 = Color3.fromHSV(i,1,1)
            wait(0.02)
        end
    end
end)

-- =========================
-- VARIABLES GLOBALES CHEATS
-- =========================
_G.flyEnabled = false
_G.speedEnabled = false
_G.jumpEnabled = false
_G.noclip = false

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

-- =========================
-- FONCTIONS CHEATS
-- =========================
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

-- Animation rouge ↔ bleu titre et bouton SHADOW
local function animateColor(textLabel)
    spawn(function()
        while true do
            for i=0,1,0.01 do
                textLabel.TextColor3 = Color3.fromHSV(i,1,1)
                wait(0.03)
            end
        end
    end)
end

animateColor(title)
animateColor(reopenBtn)

-- =========================
-- MOT DE PASSE VALIDATION
-- =========================
submitBtn.MouseButton1Click:Connect(function()
    if passBox.Text == "95741" then
        loadingBarFrame.Visible = true
        for i=1,100 do
            loadingBar.Size = UDim2.new(i/100,0,1,0)
            loadingBar.BackgroundColor3 = Color3.fromHSV(i/100,1,1)
            wait(0.03)
        end
        passPage:Destroy()
        openFrame(frame)
    else
        passBox.Text = ""
        passBox.PlaceholderText = "Mot de passe incorrect"
        -- Ajout d'une animation de secousse pour l'erreur
        local originalPos = passBox.Position
        local shakeTweenInfo = TweenInfo.new(0.05, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 4, true)
        local shakeProperties = {Position = originalPos + UDim2.new(0, 5, 0, 0)}
        local shakeTween = TS:Create(passBox, shakeTweenInfo, shakeProperties)
        shakeTween:Play()
    end
end)
