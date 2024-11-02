local function createGui()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AutoFarmGui"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- TextLabel erstellen
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
    TextLabel.Position = UDim2.new(0.25, 0, 0.1, 0)
    TextLabel.Text = "Weshky Auto Farm"
    TextLabel.TextSize = 25
    TextLabel.TextColor3 = Color3.new(1, 1, 1) -- Weiß
    TextLabel.BackgroundColor3 = Color3.new(0, 0, 0) -- Schwarz
    TextLabel.BackgroundTransparency = 0.25 -- 50% transparent
    TextLabel.TextTransparency = 0.1 -- 50% transparent
    TextLabel.Parent = ScreenGui

    -- TextButton erstellen
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.3, 0, 0.1, 0)
    Button.Position = UDim2.new(0.35, 0, 0.25, 0)
    Button.Text = "Start Auto Farm"
    Button.TextSize = 22
    Button.BackgroundColor3 = Color3.new(0, 1, 0) -- Grün
    Button.BackgroundTransparency = 0.25 -- 50% transparent
    Button.TextTransparency = 0.1 -- 50% transparent
    Button.Parent = ScreenGui

    -- Funktion für den Button-Klick
    local function onButtonClicked()
        Button.BackgroundColor3 = Color3.new(0, 1, 0) -- Blau
        Button.Text = "Please Wait..."
        
        -- Skript ausführen
        loadstring(game:HttpGet("https://raw.githubusercontent.com/WeshkyB/Weshkys-Auto-Farm/refs/heads/main/WFarm/Farm.lua"))();
    end

    -- Event verbinden
    Button.MouseButton1Click:Connect(onButtonClicked)
    
    return ScreenGui
end

-- GUI erstellen
local gui = createGui()

-- GUI soll bei Tod des Spielers nicht verschwinden
local function onPlayerDied()
    gui.Enabled = true -- GUI aktiv halten
end

-- Verbindung zu Charakter hinzufügen
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid").Died:Connect(onPlayerDied)
end)

-- GUI aktivieren
gui.Enabled = true


loadstring(game:HttpGet("https://raw.githubusercontent.com/WeshkyB/Weshkys-Auto-Farm/refs/heads/main/WFarm/Extra.lua"))();

for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
v:Disable()
end