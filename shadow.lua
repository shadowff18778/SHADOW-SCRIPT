-- Création de la fenêtre
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Création du fond sombre avec une animation de fondu (fade-in)
local background = Instance.new("Frame")
background.Size = UDim2.new(0.8, 0, 0.6, 0) -- Taille de la fenêtre
background.Position = UDim2.new(0.5, -240, 0.5, -180) -- Centrée à l'écran
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BackgroundTransparency = 1 -- Initialement transparent
background.BorderRadius = UDim.new(0, 20) -- Bordures arrondies
background.Parent = screenGui

-- Animation de fade-in pour le background
for i = 0, 0.6, 0.1 do
    background.BackgroundTransparency = i
    wait(0.05)
end

-- Création du texte "SHADOW HUB" avec une animation de couleur fluide
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 500, 0, 60)
title.Position = UDim2.new(0.5, -250, 0, 20) -- Centré en haut
title.Text = "SHADOW HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 48
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.TextAlignment = Enum.TextAlignment.Center
title.Parent = background

-- Fonction pour animer le titre avec un changement de couleur RGB fluide
local function animateTitle()
    local i = 0
    while true do
        local r = math.sin(i) * 127 + 128
        local g = math.sin(i + math.pi / 2) * 127 + 128
        local b = math.sin(i + math.pi) * 127 + 128
        title.TextColor3 = Color3.fromRGB(r, g, b)
        i = i + 0.05
        wait(0.1) -- Changement fluide des couleurs
    end
end
spawn(animateTitle)

-- Création du message "MOD PROBLEME SERVEUR"
local message = Instance.new("TextLabel")
message.Size = UDim2.new(0, 600, 0, 40)
message.Position = UDim2.new(0.5, -300, 0, 100) -- Centré sous le titre
message.Text = "MOD PROBLEME SERVEUR\nVeuillez attendre la nouvelle mise à jour"
message.TextColor3 = Color3.fromRGB(255, 0, 0) -- Texte rouge
message.TextSize = 24
message.Font = Enum.Font.Gotham
message.BackgroundTransparency = 1
message.TextWrapped = true
message.TextAlignment = Enum.TextAlignment.Center
message.Parent = background

-- Création du bouton "Contacter le Développeur"
local contactButton = Instance.new("TextButton")
contactButton.Size = UDim2.new(0, 600, 0, 40)
contactButton.Position = UDim2.new(0.5, -300, 0, 170) -- Centré sous le message
contactButton.Text = "Contacter le développeur sur\nhttps://t.me/+94jtgXlufOA4MDU8"
contactButton.TextColor3 = Color3.fromRGB(0, 121, 255) -- Bleu pour le lien
contactButton.TextSize = 24
contactButton.Font = Enum.Font.Gotham
contactButton.BackgroundTransparency = 1
contactButton.TextWrapped = true
contactButton.TextAlignment = Enum.TextAlignment.Center
contactButton.Parent = background

-- Fonction pour ouvrir le lien dans le navigateur
contactButton.MouseButton1Click:Connect(function()
    game:GetService("GuiService"):OpenBrowserWindow("https://t.me/+94jtgXlufOA4MDU8")
end)

-- Création du bouton "Ouvrir Lien"
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 300, 0, 50)
openButton.Position = UDim2.new(0.5, -150, 0, 240) -- Centré sous le lien
openButton.Text = "Ouvrir Lien"
openButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openButton.TextSize = 22
openButton.BackgroundColor3 = Color3.fromRGB(0, 121, 255) -- Bleu pour le bouton
openButton.Font = Enum.Font.GothamBold
openButton.BorderRadius = UDim.new(0, 15)
openButton.Parent = background

-- Fonction pour ouvrir le lien directement avec le bouton
openButton.MouseButton1Click:Connect(function()
    game:GetService("GuiService"):OpenBrowserWindow("https://t.me/+94jtgXlufOA4MDU8")
end)

-- Suppression de la fenêtre après 10 secondes avec animation de fade-out
wait(10)

-- Animation de fade-out pour le background
for i = 0.6, 1, 0.1 do
    background.BackgroundTransparency = i
    wait(0.05)
end

-- Supprimer le screenGui après l'animation
screenGui:Destroy()
