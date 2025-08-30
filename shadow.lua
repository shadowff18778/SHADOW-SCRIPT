local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Créer le ScreenGui et l'ajouter au PlayerGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Créer un fond sombre avec bordures arrondies
local background = Instance.new("Frame")
background.Size = UDim2.new(0.8, 0, 0.6, 0)  -- Fenêtre centrée
background.Position = UDim2.new(0.5, -240, 0.5, -180)  -- Centré sur l'écran
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BackgroundTransparency = 0.6
background.BorderRadius = UDim.new(0, 20)  -- Bordures arrondies
background.Parent = screenGui

-- Créer le texte "SHADOW HUB" avec animation RGB fluide
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 500, 0, 60)
title.Position = UDim2.new(0.5, -250, 0, 20)  -- Centré en haut
title.Text = "SHADOW HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 48
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.TextAlignment = Enum.TextAlignment.Center
title.Parent = background

-- Animation RGB pour le texte "SHADOW HUB"
local function animateTitle()
    local i = 0
    while true do
        local r = math.sin(i) * 127 + 128
        local g = math.sin(i + math.pi / 2) * 127 + 128
        local b = math.sin(i + math.pi) * 127 + 128
        title.TextColor3 = Color3.fromRGB(r, g, b)
        i = i + 0.05
        wait(0.1)  -- Fluidité de l'animation
    end
end

spawn(animateTitle)  -- Lancer l'animation

-- Créer le message "MOD PROBLEME SERVEUR"
local message = Instance.new("TextLabel")
message.Size = UDim2.new(0, 600, 0, 40)
message.Position = UDim2.new(0.5, -300, 0, 100)  -- Centré sous le titre
message.Text = "MOD PROBLEME SERVEUR\nVeuillez attendre la nouvelle mise à jour"
message.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Texte en rouge
message.TextSize = 24
message.Font = Enum.Font.Gotham
message.BackgroundTransparency = 1
message.TextWrapped = true
message.TextAlignment = Enum.TextAlignment.Center
message.Parent = background

-- Créer le bouton pour "Contacter le Développeur"
local contactButton = Instance.new("TextButton")
contactButton.Size = UDim2.new(0, 600, 0, 40)
contactButton.Position = UDim2.new(0.5, -300, 0, 170)  -- Centré sous le message
contactButton.Text = "Contacter le développeur sur\nhttps://t.me/+94jtgXlufOA4MDU8"
contactButton.TextColor3 = Color3.fromRGB(0, 121, 255)  -- Lien en bleu
contactButton.TextSize = 24
contactButton.Font = Enum.Font.Gotham
contactButton.BackgroundTransparency = 1
contactButton.TextWrapped = true
contactButton.TextAlignment = Enum.TextAlignment.Center
contactButton.Parent = background

-- Lorsque le lien est cliqué, ouvrir le navigateur
contactButton.MouseButton1Click:Connect(function()
    -- Ouvrir le lien Telegram dans le navigateur
    game:GetService("GuiService"):OpenBrowserWindow("https://t.me/+94jtgXlufOA4MDU8")
end)

-- Créer un bouton "Ouvrir Lien" pour ouvrir directement le lien
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 300, 0, 50)
openButton.Position = UDim2.new(0.5, -150, 0, 240)  -- Centré sous le lien
openButton.Text = "Ouvrir Lien"
openButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openButton.TextSize = 22
openButton.BackgroundColor3 = Color3.fromRGB(0, 121, 255)  -- Bouton bleu
openButton.Font = Enum.Font.GothamBold
openButton.BorderRadius = UDim.new(0, 15)  -- Bordures arrondies
openButton.Parent = background

-- Lorsque le bouton "Ouvrir Lien" est cliqué, ouvrir le lien
openButton.MouseButton1Click:Connect(function()
    -- Ouvrir le lien Telegram dans le navigateur
    game:GetService("GuiService"):OpenBrowserWindow("https://t.me/+94jtgXlufOA4MDU8")
end)

-- Créer l'animation de fade-in pour l'arrière-plan
background.BackgroundTransparency = 1
for i = 0, 0.6, 0.1 do
    background.BackgroundTransparency = i
    wait(0.05)
end

-- Afficher la fenêtre pendant 10 secondes
wait(10)

-- Créer l'animation de fade-out pour la fenêtre
for i = 0.6, 1, 0.1 do
    background.BackgroundTransparency = i
    wait(0.05)
end

-- Détruire le ScreenGui après la disparition
screenGui:Destroy()
