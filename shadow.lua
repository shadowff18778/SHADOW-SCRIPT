-- SHADOW HUB LOADER by ṨἬᾋƉὋẂ

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Button = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "ShadowHub"

Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

Title.Text = "SHADOW HUB"
Title.Size = UDim2.new(1, 0, 0.3, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.Parent = Frame

Button.Text = "Activer le script"
Button.Size = UDim2.new(0.8, 0, 0.4, 0)
Button.Position = UDim2.new(0.1, 0, 0.5, 0)
Button.BackgroundColor3 = Color3.fromRGB(92, 107, 192) -- Bleu stylé
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.Gotham
Button.TextScaled = true
Button.Parent = Frame

Button.MouseButton1Click:Connect(function()
    local scriptURL = "https://raw.githubusercontent.com/TonPseudo/TonRepo/main/shadow.lua"
    loadstring(game:HttpGet(scriptURL))()
end)
