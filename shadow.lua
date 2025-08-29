-- Notification de chargement
game.StarterGui:SetCore("SendNotification", {
    Title = "SHADOW HUB",
    Text = "Chargement du mod... Prépare-toi à dominer 😈",
    Duration = 5
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")
local camera = workspace.CurrentCamera
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- Variables globales
_G.flyEnabled = false
_G.speedEnabled = false
_G.jumpEnabled = false
_G.noclip = false
local passwordAccepted = false
local PASSWORD = "95741"

-- GUI principale
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ShadowHub"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Visible = false -- invisible jusqu'au mot de passe

-- Header
local header = Instance.new("Frame", frame)
header.Size = UDim2.new(1,0,0,50)
header.BackgroundColor3 = Color3.fromRGB(10,10,10)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1,0,1,0)
title.BackgroundTransparency = 1
title.Text = "SHADOW HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(255,0,0)

-- Boutons fermer et réouvrir
local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Position = UDim2.new(1,-35,0,10)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(100,0,0)
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18

local reopenBtn = Instance.new("TextButton", gui)
reopenBtn.Size = UDim2.new(0,100,0,30)
reopenBtn.Position = UDim2.new(0,10,0,10)
reopenBtn.Text = "SHADOW"
reopenBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
reopenBtn.TextColor3 = Color3.fromRGB(255,0,0)
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

-- Chargement stylé
local loadingFrame = Instance.new("Frame", gui)
loadingFrame.Size = UDim2.new(0, 400, 0, 300)
loadingFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
loadingFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)

local loadingText = Instance.new("TextLabel", loadingFrame)
loadingText.Size = UDim2.new(1,0,0,50)
loadingText.Position = UDim2.new(0,0,0.4,0)
loadingText.BackgroundTransparency = 1
loadingText.TextColor3 = Color3.fromRGB(255,255,255)
loadingText.TextScaled = true
loadingText.Text = "Chargement..."

for i=1,5 do
    loadingText.Text = "Chargement"..string.rep(".",i)
    wait(1)
end
loadingFrame:Destroy()

-- Frame mot de passe
local passwordFrame = Instance.new("Frame", frame)
passwordFrame.Size = UDim2.new(1,0,1,0)
passwordFrame.Position = UDim2.new(0,0,0,0)
passwordFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
passwordFrame.ZIndex = 10

local passLabel = Instance.new("TextLabel", passwordFrame)
passLabel.Size = UDim2.new(1,-20,0,50)
passLabel.Position = UDim2.new(0,10,0.3,0)
passLabel.BackgroundTransparency = 1
passLabel.TextColor3 = Color3.fromRGB(255,255,255)
passLabel.Text = "Entrez le mot de passe :"
passLabel.TextScaled = true

local passBox = Instance.new("TextBox", passwordFrame)
passBox.Size = UDim2.new(0,200,0,40)
passBox.Position = UDim2.new(0.5,-100,0.5,0)
passBox.Text = ""
passBox.ClearTextOnFocus = true
passBox.TextColor3 = Color3.fromRGB(255,255,255)
passBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
passBox.TextScaled = true

local submitBtn = Instance.new("TextButton", passwordFrame)
submitBtn.Size = UDim2.new(0,100,0,40)
submitBtn.Position = UDim2.new(0.5,-50,0.7,0)
submitBtn.Text = "OK"
submitBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
submitBtn.TextColor3 = Color3.fromRGB(255,0,0)
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 24

submitBtn.MouseButton1Click:Connect(function()
    if passBox.Text == PASSWORD then
        passwordAccepted = true
        passwordFrame:Destroy()
        frame.Visible = true -- Affiche le frame principal
    else
        passBox.Text = ""
        passLabel.Text = "Mot de passe incorrect"
    end
end)

-- Pages main et settings
local mainPage = Instance.new("Frame", frame)
mainPage.Size = UDim2.new(1,0,1,-50)
mainPage.Position = UDim2.new(0,0,0,50)
mainPage.BackgroundTransparency = 1

local settingsPage = Instance.new("Frame", frame)
settingsPage.Size = UDim2.new(1,0,1,-50)
settingsPage.Position = UDim2.new(0,0,0,50)
settingsPage.BackgroundTransparency = 1
settingsPage.Visible = false

-- Bouton retour settings
local backBtn = Instance.new("TextButton", settingsPage)
backBtn.Size = UDim2.new(0,100,0,30)
backBtn.Position = UDim2.new(0.5,-50,1,-40)
backBtn.Text = "← Retour"
backBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
backBtn.TextColor3 = Color3.fromRGB(255,255,255)
backBtn.Font = Enum.Font.GothamBold
backBtn.TextSize = 18
backBtn.MouseButton1Click:Connect(function()
    settingsPage.Visible = false
    mainPage.Visible = true
end)

-- Bouton Settings
local settingsBtn = Instance.new("TextButton", header)
settingsBtn.Size = UDim2.new(0,30,0,30)
settingsBtn.Position = UDim2.new(0,5,0,10)
settingsBtn.Text = "⚙️"
settingsBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
settingsBtn.TextColor3 = Color3.fromRGB(255,255,255)
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.TextSize = 18
settingsBtn.MouseButton1Click:Connect(function()
    settingsPage.Visible = true
    mainPage.Visible = false
end)

-- Infos joueur dans settings
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

-- Création boutons mainPage
local buttonY = 0.1
local spacing = 0.15
local function createButton(name, toggleVar, callback)
    local btn = Instance.new("TextButton", mainPage)
    btn.Position = UDim2.new(0.1,0,buttonY,0)
    btn.Size = UDim2.new(0,280,0,40)
    btn.Text = name..": OFF"
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 20
    btn.MouseButton1Click:Connect(function()
        _G[toggleVar] = not _G[toggleVar]
        btn.Text = name..(_G[toggleVar] and ": ON" or ": OFF")
        callback(_G[toggleVar])
    end)
    buttonY = buttonY + spacing
end

-- Vol mobile fluide + multi-saut
createButton("Vol","flyEnabled",function(state)
    if state then
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        local bv = Instance.new("BodyVelocity",hrp)
        bv.MaxForce = Vector3.new(1e5,1e5,1e5)
        bv.Velocity = Vector3.zero
        local bg = Instance.new("BodyGyro",hrp)
        bg.MaxTorque = Vector3.new(1e5,1e5,1e5)
        bg.CFrame = hrp.CFrame
        local conn
        conn = runService.RenderStepped:Connect(function()
            if not _G.flyEnabled then
                bv:Destroy()
                bg:Destroy()
                humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
                conn:Disconnect()
                return
            end
            local moveDir = humanoid.MoveDirection
            bg.CFrame = CFrame.new(hrp.Position, hrp.Position + camera.CFrame.LookVector)
            local up = uis:IsKeyDown(Enum.KeyCode.Space) and 50 or 0
            bv.Velocity = moveDir * 50 + Vector3.new(0,up,0)
        end)
    else
        local bv = hrp:FindFirstChildOfClass("BodyVelocity")
        local bg = hrp:FindFirstChildOfClass("BodyGyro")
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
        humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    end
end)

-- Vitesse, Saut, Noclip
createButton("Vitesse","speedEnabled",function(state) humanoid.WalkSpeed = state and 100 or 16 end)
createButton("Saut","jumpEnabled",function(state) humanoid.JumpPower = state and 150 or 50 end)
createButton("Noclip","noclip",function(state)
    runService.Stepped:Connect(function()
        if _G.noclip then
            for _,part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end
    end)
end)

-- Animation titre rouge ↔ bleu
spawn(function()
    while true do
        for i=0,1,0.01 do
            title.TextColor3 = Color3.fromRGB(math.floor(255*(1-i)),0,math.floor(255*i))
            wait(0.05)
        end
        for i=0,1,0.01 do
            title.TextColor3 = Color3.fromRGB(math.floor(255*i),0,math.floor(255*(1-i)))
            wait(0.05)
        end
    end
end)
