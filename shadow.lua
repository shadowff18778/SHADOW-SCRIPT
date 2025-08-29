game.StarterGui:SetCore("SendNotification", {
    Title = "SHADOW HUB",
    Text = "Chargement du mod... Prépare-toi à dominer 😈",
    Duration = 5
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")
local camera = workspace.CurrentCamera
local runService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

-- Variables globales
_G.flyEnabled = false
_G.speedEnabled = false
_G.jumpEnabled = false
_G.noclip = false
_G.invisibleEnabled = false
local buttonY = 0.1
local spacing = 0.2

-- GUI principale
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ShadowHub"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 320, 0, 250)
frame.Position = UDim2.new(0.5, -160, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.BackgroundTransparency = 0.2

-- ScrollingFrame pour défilement
local scrollFrame = Instance.new("ScrollingFrame", frame)
scrollFrame.Size = UDim2.new(1, 0, 1, -40)
scrollFrame.Position = UDim2.new(0,0,0,40)
scrollFrame.CanvasSize = UDim2.new(0,0,0,0)
scrollFrame.ScrollBarThickness = 8
scrollFrame.BackgroundTransparency = 1

-- Header
local header = Instance.new("Frame", frame)
header.Size = UDim2.new(1,0,0,40)
header.BackgroundColor3 = Color3.fromRGB(0,0,0)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.new(0,40,0,0)
title.Text = "SHADOW HUB"
title.TextColor3 = Color3.fromRGB(255,0,0)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.BackgroundTransparency = 1

-- Boutons settings et fermer
local settingsBtn = Instance.new("TextButton", header)
settingsBtn.Size = UDim2.new(0,30,0,30)
settingsBtn.Position = UDim2.new(0,5,0,5)
settingsBtn.Text = "⚙️"
settingsBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
settingsBtn.TextColor3 = Color3.fromRGB(255,255,255)
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.TextSize = 18

local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0,30,0,30)
closeBtn.Position = UDim2.new(1,-35,0,5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(100,0,0)
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18

local reopenBtn = Instance.new("TextButton", gui)
reopenBtn.Size = UDim2.new(0,100,0,30)
reopenBtn.Position = UDim2.new(0,10,0,10)
reopenBtn.Text = "SHADOW"
reopenBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
reopenBtn.TextColor3 = Color3.fromRGB(255,0,0)
reopenBtn.Font = Enum.Font.GothamBold
reopenBtn.TextSize = 18
reopenBtn.Visible = false

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    reopenBtn.Visible = true
end)
reopenBtn.MouseButton1Click:Connect(function()
    frame.Visible = true
    reopenBtn.Visible = false
end)

-- Fonction pour créer des boutons
local function createButton(name, toggleVar, callback)
    local btn = Instance.new("TextButton", scrollFrame)
    btn.Position = UDim2.new(0.05,0,buttonY,0)
    btn.Size = UDim2.new(0.9,0,0,30)
    btn.Text = name..": OFF"
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.MouseButton1Click:Connect(function()
        _G[toggleVar] = not _G[toggleVar]
        btn.Text = name..(_G[toggleVar] and ": ON" or ": OFF")
        callback(_G[toggleVar])
    end)
    buttonY = buttonY + 0.05
    scrollFrame.CanvasSize = UDim2.new(0,0,0,buttonY*scrollFrame.AbsoluteSize.Y + 40)
end

-- VOL classique + multi saut
createButton("Vol", "flyEnabled", function(state)
    local vertical = 0
    local speed = 60
    local jumps = 0
    local maxJumps = 5 -- multi-saut
    humanoid.UseJumpPower = true

    local conn
    conn = runService.RenderStepped:Connect(function(deltaTime)
        if not _G.flyEnabled then conn:Disconnect() return end

        -- Vérifie si le joueur appuie sur le bouton saut
        if humanoid:GetState() == Enum.HumanoidStateType.Jumping or humanoid.Jump then
            vertical = 1
            if jumps < maxJumps then
                jumps = jumps + 1
            end
        else
            vertical = 0
            jumps = 0
        end

        -- Direction joystick
        local moveDir = humanoid.MoveDirection
        if moveDir.Magnitude > 0 then
            hrp.CFrame = CFrame.new(hrp.Position, hrp.Position + camera.CFrame.LookVector)
        end

        local moveVector = moveDir*speed + Vector3.new(0, vertical*speed,0)
        hrp.CFrame = hrp.CFrame + moveVector*deltaTime
    end)
end)

-- Vitesse
createButton("Vitesse","speedEnabled",function(state)
    humanoid.WalkSpeed = state and 100 or 16
end)

-- Saut
createButton("Saut","jumpEnabled",function(state)
    humanoid.JumpPower = state and 150 or 50
end)

-- Noclip
createButton("Noclip","noclip",function(state)
    local stepped
    stepped = runService.Stepped:Connect(function()
        if _G.noclip then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        else
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
            if stepped then stepped:Disconnect() end
        end
    end)
end)

-- Invisibilité totale
createButton("Invisible","invisibleEnabled",function(state)
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("Decal") then
            part.Transparency = state and 1 or 0
            part.CanCollide = not state
        end
    end
    humanoid.NameDisplayDistance = state and 0 or 100
end)

-- Animation rouge ↔ bleu
local function animateColor(textLabel)
    spawn(function()
        while true do
            for i = 0,1,0.01 do
                local r = math.floor(255*(1-i))
                local b = math.floor(255*i)
                textLabel.TextColor3 = Color3.fromRGB(r,0,b)
                wait(0.05)
            end
            for i = 0,1,0.01 do
                local r = math.floor(255*i)
                local b = math.floor(255*(1-i))
                textLabel.TextColor3 = Color3.fromRGB(r,0,b)
                wait(0.05)
            end
        end
    end)
end

animateColor(title)
animateColor(reopenBtn)
