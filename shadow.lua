game.StarterGui:SetCore("SendNotification", {
    Title = "SHADOW HUB",
    Text = "Chargement du mod... Prépare-toi à dominer 😈",
    Duration = 5
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local camera = workspace.CurrentCamera
local uis = game:GetService("UserInputService")
local RS = game:GetService("RunService")

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ShadowHub"

-- =====================
-- PAGE MOT DE PASSE
-- =====================
local passPage = Instance.new("Frame", gui)
passPage.Size = UDim2.new(0, 300, 0, 150)
passPage.Position = UDim2.new(0.5, -150, 0.5, -75)
passPage.BackgroundColor3 = Color3.fromRGB(25,25,25)
passPage.BorderSizePixel = 0
passPage.Active = true
passPage.Draggable = true
Instance.new("UICorner", passPage).CornerRadius = UDim.new(0,10)

local passLabel = Instance.new("TextLabel", passPage)
passLabel.Size = UDim2.new(1, -20, 0, 40)
passLabel.Position = UDim2.new(0, 10, 0, 10)
passLabel.Text = "Mot de passe requis"
passLabel.TextColor3 = Color3.fromRGB(255,0,0)
passLabel.Font = Enum.Font.GothamBold
passLabel.TextSize = 22
passLabel.BackgroundTransparency = 1

local passBox = Instance.new("TextBox", passPage)
passBox.Size = UDim2.new(0, 260, 0, 30)
passBox.Position = UDim2.new(0, 20, 0, 60)
passBox.PlaceholderText = "Entre le mot de passe"
passBox.TextColor3 = Color3.fromRGB(255,255,255)
passBox.BackgroundColor3 = Color3.fromRGB(45,45,45)
passBox.Font = Enum.Font.Gotham
passBox.TextSize = 18
Instance.new("UICorner", passBox).CornerRadius = UDim.new(0,8)

local submitBtn = Instance.new("TextButton", passPage)
submitBtn.Size = UDim2.new(0, 120, 0, 30)
submitBtn.Position = UDim2.new(0.5, -60, 1, -40)
submitBtn.Text = "Valider"
submitBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
submitBtn.TextColor3 = Color3.fromRGB(255,255,255)
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 18
Instance.new("UICorner", submitBtn).CornerRadius = UDim.new(0,8)

local loadingBarFrame = Instance.new("Frame", passPage)
loadingBarFrame.Size = UDim2.new(0, 260, 0, 20)
loadingBarFrame.Position = UDim2.new(0, 20, 1, -70)
loadingBarFrame.BackgroundColor3 = Color3.fromRGB(60,60,60)
Instance.new("UICorner", loadingBarFrame).CornerRadius = UDim.new(0,8)
loadingBarFrame.Visible = false

local loadingBar = Instance.new("Frame", loadingBarFrame)
loadingBar.Size = UDim2.new(0,0,1,0)
loadingBar.BackgroundColor3 = Color3.fromRGB(255,0,0)
Instance.new("UICorner", loadingBar).CornerRadius = UDim.new(0,8)

-- =====================
-- FRAME PRINCIPALE
-- =====================
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 250)
frame.Position = UDim2.new(0.5, -160, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.BackgroundTransparency = 1
frame.Visible = false
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

for i = 1, 10 do
    frame.BackgroundTransparency = 1 - (i * 0.1)
    wait(0.05)
end

-- HEADER
local header = Instance.new("Frame", frame)
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(0,0,0)
Instance.new("UICorner", header).CornerRadius = UDim.new(0,12)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.new(0, 40, 0, 0)
title.Text = "SHADOW HUB"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.BackgroundTransparency = 1

-- BOUTONS HEADER
local settingsBtn = Instance.new("TextButton", header)
settingsBtn.Size = UDim2.new(0, 30, 0, 30)
settingsBtn.Position = UDim2.new(0, 5, 0, 5)
settingsBtn.Text = "⚙️"
settingsBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
settingsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.TextSize = 18
Instance.new("UICorner", settingsBtn).CornerRadius = UDim.new(0,5)

local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,5)

local reopenBtn = Instance.new("TextButton", gui)
reopenBtn.Size = UDim2.new(0, 100, 0, 30)
reopenBtn.Position = UDim2.new(0, 10, 0, 10)
reopenBtn.Text = "SHADOW"
reopenBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
reopenBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
reopenBtn.Font = Enum.Font.GothamBold
reopenBtn.TextSize = 18
reopenBtn.Visible = false
Instance.new("UICorner", reopenBtn).CornerRadius = UDim.new(0,5)

-- =====================
-- PAGES
-- =====================
local mainPage = Instance.new("Frame", frame)
mainPage.Size = UDim2.new(1, 0, 1, -40)
mainPage.Position = UDim2.new(0,0,0,40)
mainPage.BackgroundTransparency = 1

local settingsPage = Instance.new("Frame", frame)
settingsPage.Size = UDim2.new(1, 0, 1, -40)
settingsPage.Position = UDim2.new(0,0,0,40)
settingsPage.BackgroundTransparency = 1
settingsPage.Visible = false

local infoPage = Instance.new("Frame", frame)
infoPage.Size = UDim2.new(1,0,1,-40)
infoPage.Position = UDim2.new(0,0,0,40)
infoPage.BackgroundTransparency = 1
infoPage.Visible = false

-- =====================
-- SIGNATURE
-- =====================
local signature = Instance.new("TextLabel", frame)
signature.Size = UDim2.new(1,0,0,20)
signature.Position = UDim2.new(0,0,1,-25)
signature.Text = "Powered by SHADOW"
signature.Font = Enum.Font.GothamBold
signature.TextSize = 16
signature.TextColor3 = Color3.fromRGB(255,0,0)
signature.BackgroundTransparency = 1

spawn(function()
    while true do
        for i=0,1,0.01 do
            signature.TextColor3 = Color3.fromHSV(i,1,1)
            wait(0.02)
        end
    end
end)

-- =====================
-- VALIDATION MOT DE PASSE
-- =====================
submitBtn.MouseButton1Click:Connect(function()
    if passBox.Text == "95741" then
        loadingBarFrame.Visible = true
        for i=1,100 do
            loadingBar.Size = UDim2.new(i/100,0,1,0)
            loadingBar.BackgroundColor3 = Color3.fromHSV(i/100,1,1)
            wait(0.03)
        end
        passPage:Destroy()
        frame.Visible = true
    else
        passBox.Text = ""
        passBox.PlaceholderText = "Mot de passe incorrect"
    end
end)
