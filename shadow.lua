-- Fichier : LocalScript à placer dans le StarterGui ou un GUI de ton choix

local player = game.Players.LocalPlayer
local playerList = game.Players:GetPlayers() -- Liste des joueurs connectés
local screenGui = Instance.new("ScreenGui") -- Créer un ScreenGui
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame") -- Conteneur pour les joueurs
frame.Size = UDim2.new(0, 300, 0, 400)
frame.Position = UDim2.new(0.5, -150, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Fond gris foncé
frame.Parent = screenGui

local closeButton = Instance.new("TextButton") -- Bouton de fermeture
closeButton.Size = UDim2.new(0, 50, 0, 30)
closeButton.Position = UDim2.new(1, -60, 0, 10)
closeButton.Text = "Fermer"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Parent = frame

local playerListFrame = Instance.new("Frame") -- Frame pour la liste des joueurs
playerListFrame.Size = UDim2.new(1, -20, 1, -50)
playerListFrame.Position = UDim2.new(0, 10, 0, 40)
playerListFrame.BackgroundTransparency = 1
playerListFrame.Parent = frame

local playerButtons = {} -- Table pour stocker les boutons des joueurs

-- Fonction pour mettre à jour la liste des joueurs
local function updatePlayerList()
    -- Supprimer les anciens boutons (si la liste change)
    for _, button in pairs(playerButtons) do
        button:Destroy()
    end
    playerButtons = {} -- Réinitialiser la table des boutons

    -- Créer des boutons pour chaque joueur
    for i, p in ipairs(game.Players:GetPlayers()) do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, 0, 0, 30) -- Taille de chaque bouton
        button.Position = UDim2.new(0, 0, 0, (i - 1) * 35)
        button.Text = p.Name
        button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Parent = playerListFrame

        -- Définir l'action à effectuer quand on clique sur un joueur
        button.MouseButton1Click:Connect(function()
            -- Exemple d'action : Déconnecter le joueur (ou toute autre action)
            if p == player then
                print("Vous ne pouvez pas vous déconnecter vous-même.")
            else
                -- Ici, on peut "déconnecter" le joueur de la partie (par exemple en le kickant)
                p:Kick("Vous avez été déconnecté par un administrateur.")
                print(p.Name .. " a été déconnecté.")
            end
        end)

        -- Ajouter le bouton à la liste
        table.insert(playerButtons, button)
    end
end

-- Mettre à jour la liste des joueurs chaque fois que la liste change
game.Players.PlayerAdded:Connect(updatePlayerList)
game.Players.PlayerRemoving:Connect(updatePlayerList)

-- Initialiser la liste au démarrage
updatePlayerList()

-- Fonction pour fermer la fenêtre
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Réouvrir la fenêtre
local openButton = Instance.new("TextButton") -- Créer un bouton pour réouvrir la fenêtre
openButton.Size = UDim2.new(0, 100, 0, 50)
openButton.Position = UDim2.new(0.5, -50, 0.9, 0)
openButton.Text = "Ouvrir Liste"
openButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
openButton.Parent = player:WaitForChild("PlayerGui")

openButton.MouseButton1Click:Connect(function()
    screenGui.Parent = player:WaitForChild("PlayerGui") -- Afficher la fenêtre
end)
