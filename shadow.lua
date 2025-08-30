local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui") -- On attend PlayerGui
local screenGui = Instance.new("ScreenGui") -- Créer un ScreenGui
screenGui.Parent = playerGui -- Parenté au PlayerGui du joueur pour affichage

-- Créer un fond sombre avec des bordures arrondies pour un look plus premium
local background = Instance.new("Frame")
background.Size = UDim2.new(0.8, 0, 0.6, 0) -- Taille ajustée pour une fenêtre plus petite et plus centrée
background.Position = UDim2.new(0.5, -240, 0.5, -180) -- Centré sur l'écran
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BackgroundTransparency = 0.6
background.BorderRadius = UDim.new(0, 20) -- Bordures arrondies
background.Parent = screenGui

-- Créer le texte "SHADOW HUB" avec une animation RGB fluide et plus stylée
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

-- Animation du titre "SHADOW HUB" (changement de couleur fluide RGB)
local function animateTitle()
    local i = 0
    while true do
        local r = math.sin(i) * 127 + 128
        local g = math.sin(i + math.pi / 2) * 127 + 128
        local b = math.sin(i + math.pi) * 127 + 128
        title.TextColor3 = Color3.fromRGB(r, g, b)
        i = i + 0.05
        wait(0.1) -- Transition douce et fluide
    end
end

-- Lancer l'animation du texte "SHADOW HUB"
spawn(animateTitle)

-- Créer le texte "MOD PROBLEME SERVEUR" en rouge
local message = Instance.new("TextLabel")
message.Size = UDim2.new(0, 600, 0, 40)
message.Position = UDim2.new(0.5, -300, 0, 100) -- Centré sous le titre
message.Text = "MOD PROBLEME SERVEUR\nVeuillez attendre la nouvelle mise à jour"
message.TextColor3 = Color3.fromRGB(255, 0, 0) -- Texte en rouge
message.TextSize = 24
message.Font = Enum.Font.Gotham
message.BackgroundTransparency = 1
message.TextWrapped = true
message.TextAlignment = Enum.TextAlignment.Center
message.Parent = background

-- Créer le bouton cliquable pour contacter le développeur (le lien)
local contactText = Instance.new("TextButton")
contactText.Size = UDim2.new(0, 600, 0, 40)
contactText.Position = UDim2.new(0.5, -300, 0, 170) -- Centré sous le message
contactText.Text = "Contacter le développeur sur\nhttps://t.me/+94jtgXlufOA4MDU8"
contactText.TextColor3 = Color3.fromRGB(0, 121, 255) -- Couleur bleue pour le lien
contactText.TextSize = 24
contactText.Font = Enum.Font.Gotham
contactText.BackgroundTransparency = 1
contactText.TextWrapped = true
contactText.TextAlignment = Enum.TextAlignment.Center
contactText.Parent = background

-- Lorsqu'on clique sur le lien, ouvrir le navigateur
contactText.MouseButton1Click:Connect(function()
    -- Ouvrir le lien Telegram dans un nouvel onglet du navigateur
    game:GetService("GuiService"):OpenBrowserWindow("https://t.me/+94jtgXlufOA4MDU8")
end)

-- Créer un bouton "Ouvrir Lien" pour ouvrir le lien Telegram directement
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 300, 0, 50)
openButton.Position = UDim2.new(0.5, -150, 0, 240) -- Centré sous le lien
openButton.Text = "Ouvrir Lien"
openButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openButton.TextSize = 22
openButton.BackgroundColor3 = Color3.fromRGB(0, 121, 255) -- Bleu pour le bouton
openButton.Font = Enum.Font.GothamBold
openButton.BorderRadius = UDim.new(0, 15) -- Bordures arrondies pour le bouton
openButton.Parent = background

-- Ouvrir le lien dans le navigateur au clic
openButton.MouseButton1Click:Connect(function()
    -- Ouvrir le lien Telegram dans un nouvel onglet du navigateur
    game:GetService("GuiService"):OpenBrowserWindow("https://t.me/+94jtgXlufOA4MDU8")
end)

-- Animation de fade-out avant de détruire la fenêtre après 10 secondes
wait(10)

-- Animation de fade-out pour l'ensemble du background
for i = 0.6, 1, 0.1 do
    background.BackgroundTransparency = i
    wait(0.05)
end

screenGui:Destroy()
