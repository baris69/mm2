-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false  -- Optional: Keeps the GUI after respawning

-- Create the Frame (draggable GUI part)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)  -- Centered on screen
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Active = true  -- Needed for dragging
frame.Draggable = true  -- Enables dragging
frame.Parent = screenGui

-- Create a TextLabel to show "Hi"
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "Hi"
textLabel.TextScaled = true
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.Parent = frame
