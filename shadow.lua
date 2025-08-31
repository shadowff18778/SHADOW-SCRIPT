-- SHADOW HUB Intro Screen

-- Configuration
local disappearTime = 10 -- secondes avant que l'UI disparaisse
local targetHour = 13 -- heure cible (13h = 1h de l’après-midi)

-- Création du ScreenGui
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false

-- Fond sombre
local background = Instance.new("Frame")
background.Size = UDim2.new(1,0,1,0)
background.BackgroundColor3 = Color3.fromRGB(0,0,0)
background.BackgroundTransparency = 0.3
background.Parent = gui

-- Titre SHADOW HUB
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0.3,0)
title.Position = UDim2.new(0,0,0.3,0)
title.BackgroundTransparency = 1
title.Text = "SHADOW HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 50
title.TextColor3 = Color3.fromRGB(255,0,0)
title.Parent = background

-- Texte "Mise à jour dans :"
local updateText = Instance.new("TextLabel")
updateText.Size = UDim2.new(1,0,0.1,0)
updateText.Position = UDim2.new(0,0,0.7,0)
updateText.BackgroundTransparency = 1
updateText.Text = "Mise à jour dans :"
updateText.Font = Enum.Font.Gotham
updateText.TextSize = 20
updateText.TextColor3 = Color3.fromRGB(255,255,255)
updateText.Parent = background

-- Compteur
local counter = Instance.new("TextLabel")
counter.Size = UDim2.new(1,0,0.1,0)
counter.Position = UDim2.new(0,0,0.8,0)
counter.BackgroundTransparency = 1
counter.Text = "00:00:00"
counter.Font = Enum.Font.Code
counter.TextSize = 24
counter.TextColor3 = Color3.fromRGB(200,200,200)
counter.Parent = background

-- Animation RGB pour le titre
task.spawn(function()
	while gui.Parent do
		for i = 0,1,0.01 do
			local r = math.sin(i*math.pi*2)*127+128
			local g = math.sin(i*math.pi*2 + 2)*127+128
			local b = math.sin(i*math.pi*2 + 4)*127+128
			title.TextColor3 = Color3.fromRGB(r,g,b)
			task.wait(0.05)
		end
	end
end)

-- Mise à jour du compteur
task.spawn(function()
	while gui.Parent do
		local now = os.date("!*t") -- heure actuelle UTC
		local target = os.date("!*t")
		target.hour = targetHour
		target.min = 0
		target.sec = 0

		-- Si on est déjà passé après 10h, on met le lendemain
		if now.hour >= targetHour then
			target.day = target.day + 1
		end

		local nowSec = os.time(now)
		local targetSec = os.time(target)
		local diff = targetSec - nowSec

		local h = math.floor(diff/3600)
		local m = math.floor((diff%3600)/60)
		local s = diff%60

		counter.Text = string.format("%02d:%02d:%02d", h,m,s)
		task.wait(1)
	end
end)

-- Faire disparaître l'UI après 10 secondes
task.delay(disappearTime, function()
	for i = 0,1,0.05 do
		background.BackgroundTransparency = i
		title.TextTransparency = i
		updateText.TextTransparency = i
		counter.TextTransparency = i
		task.wait(0.05)
	end
	gui:Destroy()
end)
