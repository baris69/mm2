local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local screenGui = playerGui:FindFirstChild("ScreenGui")  -- Assuming the ScreenGui's name is "ScreenGui"

if screenGui then
    screenGui:Destroy()  -- Destroys the "Hi" GUI
end
