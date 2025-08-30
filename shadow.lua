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

local infoText = Instance.new("TextLabel", infoPage)
infoText.Size = UDim2.new(1,-40,0.2,0)
infoText.Position = UDim2.new(0,20,0,20)
infoText.TextColor3 = Color3.fromRGB(200,200,200)
infoText.TextWrapped = true
infoText.TextYAlignment = Enum.TextYAlignment.Top
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.Font = Enum.Font.Gotham
infoText.TextSize = 18
infoText.BackgroundTransparency = 1

infoBtn.MouseButton1Click:Connect(function()
    settingsPage.Visible = false
    infoPage.Visible = true

    spawn(function()
        while infoPage.Visible do
            -- Affiche les infos du joueur local
            infoText.Text = string.format("🟢 Tes Infos :\nNom: %s\nUserId: %d\nPremium: %s\nAccountAge: %s jours",
                player.Name,
                player.UserId,
                tostring(player.MembershipType == Enum.MembershipType.Premium),
                tostring(player.AccountAge)
            )

            -- Supprime anciens boutons
            for _, child in pairs(infoPage:GetChildren()) do
                if child:IsA("TextButton") and child ~= backInfoBtn then
                    child:Destroy()
                end
            end

            -- Crée des boutons pour chaque joueur
            local yPos = 0.25
            for i, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= player then
                    local plrBtn = Instance.new("TextButton", infoPage)
                    plrBtn.Size = UDim2.new(0,200,0,30)
                    plrBtn.Position = UDim2.new(0.05,0,yPos,0)
                    plrBtn.Text = plr.Name
                    plrBtn.Font = Enum.Font.Gotham
                    plrBtn.TextSize = 18
                    plrBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
                    plrBtn.TextColor3 = Color3.fromRGB(255,255,255)
                    Instance.new("UICorner", plrBtn).CornerRadius = UDim.new(0,8)

                    -- Clique pour téléporter
                    plrBtn.MouseButton1Click:Connect(function()
                        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                            character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0)
                        end
                    end)

                    yPos = yPos + 0.05
                end
            end
            wait(1)
        end
    end)
end)

-- =========================
-- Le reste du code (Game Set, Fly, Speed, Jump, Noclip, Mot de passe, etc.)
-- reste identique à ton script original
-- Il suffit d’intégrer cette section modifiée pour les joueurs cliquables
