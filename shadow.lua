local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui") -- Créer un ScreenGui
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Créer un fond sombre
local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.BackgroundTransparency = 0.6
background.Parent = screenGui

-- Créer le texte "SHADOW HUB" avec une animation
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 400, 0, 50)
title.Position = UDim2.new(0.5, -200, 0, 50) -- Centré en haut
title.Text = "SHADOW HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 40
title.Font = Enum.Font.GothamBold
title.BackgroundTransparency = 1
title.Parent = background

-- Animation du texte (changement de couleur en mode RGB)
local function animateTextColor()
    while true do
        for r = 0, 255 do
            title.TextColor3 = Color3.fromRGB(r, 0, 255 - r) -- Effet RGB
            wait(0.01)
        end
        for g = 0, 255 do
            title.TextColor3 = Color3.fromRGB(255 - g, g, 0) -- Effet RGB
            wait(0.01)
        end
        for b = 0, 255 do
            title.TextColor3 = Color3.fromRGB(0, 255 - b, b) -- Effet RGB
            wait(0.01)
        end
    end
end

-- Lancer l'animation du texte en arrière-plan
spawn(animateTextColor)

-- Créer le texte "MOD PROBLEME SERVEUR"
local message = Instance.new("TextLabel")
message.Size = UDim2.new(0, 500, 0, 30)
message.Position = UDim2.new(0.5, -250, 0, 120) -- Centré sous le titre
message.Text = "MOD PROBLEME SERVEUR\nVeuillez attendre la nouvelle mise à jour"
message.TextColor3 = Color3.fromRGB(255, 255, 255)
message.TextSize = 20
message.Font = Enum.Font.Gotham
message.BackgroundTransparency = 1
message.Parent = background
message.TextWrapped = true
message.TextYAlignment = Enum.TextYAlignment.Top

-- Créer le texte "Contacter le développeur"
local contactText = Instance.new("TextLabel")
contactText.Size = UDim2.new(0, 500, 0, 30)
contactText.Position = UDim2.new(0.5, -250, 0, 170) -- Centré sous le message
contactText.Text = "Contacter le développeur sur\nhttps://t.me/+94jtgXlufOA4MDU8"
contactText.TextColor3 = Color3.fromRGB(0, 121, 255) -- Couleur bleue pour le lien
contactText.TextSize = 20
contactText.Font = Enum.Font.Gotham
contactText.BackgroundTransparency = 1
contactText.Parent = background
contactText.TextWrapped = true
contactText.TextButton = true

-- Rendre le lien cliquable
contactText.MouseButton1Click:Connect(function()
    -- Ouvrir le lien dans le navigateur
    syn.request({
        Url = "https://t.me/+94jtgXlufOA4MDU8",
        Method = "GET"
    })
end)

-- Fermer l'interface après 10 secondes
wait(10)
screenGui:Destroy()
