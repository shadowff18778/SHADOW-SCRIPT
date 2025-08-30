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

-- Créer le texte "SHADOW HUB" avec une animation RGB
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 400, 0, 50)
title.Position = UDim2.new(0.5, -200, 0, 50) -- Centré en haut
title.Text = "SHADOW HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 40
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.Parent = background

-- Animation du texte (changement de couleur en mode RGB plus rapide)
local function animateTextColor()
    while true do
        for r = 0, 255 do
            title.TextColor3 = Color3.fromRGB(r, 0, 255 - r) -- Effet RGB rapide
            wait(0.05)
        end
        for g = 0, 255 do
            title.TextColor3 = Color3.fromRGB(255 - g, g, 0) -- Effet RGB rapide
            wait(0.05)
        end
        for b = 0, 255 do
            title.TextColor3 = Color3.fromRGB(0, 255 - b, b) -- Effet RGB rapide
            wait(0.05)
        end
    end
end

-- Lancer l'animation du texte en arrière-plan
spawn(animateTextColor)

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
contactText.Parent = background
contactText.TextWrapped = true
contactText.TextYAlignment = Enum.TextYAlignment.Top

-- Lorsqu'on clique sur le lien, ouvrir le navigateur
contactText.MouseButton1Click:Connect(function()
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
    game:GetService("GuiService"):OpenBrowserWindow("https://t.me/+94jtgXlufOA4MDU8")
end)

-- Garder l'interface pendant 10 secondes avant de la fermer
wait(10)
screenGui:Destroy()
