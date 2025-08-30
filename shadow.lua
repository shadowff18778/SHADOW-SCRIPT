local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui") -- Créer un ScreenGui
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Créer un fond sombre
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BackgroundTransparency = 0.6
background.Position = UDim2.new(0, 0, 0, 0) -- Position en haut de l'écran
background.Parent = screenGui

-- Créer le texte "SHADOW HUB" avec une animation RGB plus douce
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 400, 0, 50)
title.Position = UDim2.new(0.5, -200, 0, 50) -- Centré en haut
title.Text = "SHADOW HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 40
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.Parent = background

-- Animation du texte "SHADOW HUB" (changement de couleur douce)
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
message.Size = UDim2.new(0, 500, 0, 30)
message.Position = UDim2.new(0.5, -250, 0, 120) -- Centré sous le titre
message.Text = "MOD PROBLEME SERVEUR\nVeuillez attendre la nouvelle mise à jour"
message.TextColor3 = Color3.fromRGB(255, 0, 0) -- Texte en rouge
message.TextSize = 20
message.Font = Enum.Font.Gotham
message.BackgroundTransparency = 1
message.Parent = background
message.TextWrapped = true
message.TextYAlignment = Enum.TextYAlignment.Top

-- Créer le texte "Contacter le développeur" avec lien
local contactText = Instance.new("TextButton")
contactText.Size = UDim2.new(0, 500, 0, 30)
contactText.Position = UDim2.new(0.5, -250, 0, 170) -- Centré sous le message
contactText.Text = "Contacter le développeur sur\nhttps://t.me/+94jtgXlufOA4MDU8"
contactText.TextColor3 = Color3.fromRGB(0, 121, 255) -- Couleur bleue pour le lien
contactText.TextSize = 20
contactText.Font = Enum.Font.Gotham
contactText.BackgroundTransparency = 1
contactText.TextWrapped = true
contactText.TextYAlignment = Enum.TextYAlignment.Top
contactText.Parent = background

-- Lorsqu'on clique sur le lien, ouvrir le navigateur
contactText.MouseButton1Click:Connect(function()
    -- Ouvrir le lien Telegram dans un nouvel onglet du navigateur
    game:GetService("GuiService"):OpenBrowserWindow("https://t.me/+94jtgXlufOA4MDU8")
end)

-- Créer un bouton pour ouvrir le lien directement dans le navigateur
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 250, 0, 40)
openButton.Position = UDim2.new(0.5, -125, 0, 230) -- Centré sous le lien
openButton.Text = "Ouvrir Lien"
openButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openButton.TextSize = 18
openButton.BackgroundColor3 = Color3.fromRGB(0, 121, 255) -- Bleu pour le bouton
openButton.Font = Enum.Font.Gotham
openButton.Parent = background

-- Ouvrir le lien dans le navigateur au clic
openButton.MouseButton1Click:Connect(function()
    -- Ouvrir le lien Telegram dans un nouvel onglet du navigateur
    game:GetService("GuiService"):OpenBrowserWindow("https://t.me/+94jtgXlufOA4MDU8")
end)

-- Animation de fade-in sur toute la fenêtre (douce)
background.BackgroundTransparency = 1
for i = 0, 0.6, 0.05 do
    background.BackgroundTransparency = i
    wait(0.05)
end

-- Garder l'interface pendant 10 secondes avant de la fermer
wait(10)

-- Animation de fade-out avant de détruire
for i = 0.6, 1, 0.05 do
    background.BackgroundTransparency = i
    wait(0.05)
end

screenGui:Destroy()  -- Détruire le GUI après le fade-out
