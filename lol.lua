local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local coinContainer = game.Workspace:WaitForChild("CoinContainer")

-- Adjust flight speed
local flightSpeed = 100

-- Function to get the nearest "Coin_Server"
local function getNearestCoin()
    local nearestCoin = nil
    local shortestDistance = math.huge
    
    -- Loop through all objects in CoinContainer
    for _, coin in pairs(coinContainer:GetChildren()) do
        -- Check if the object is named "Coin_Server"
        if coin:IsA("BasePart") and coin.Name == "Coin_Server" then
            -- Calculate distance between player and the coin
            local distance = (humanoidRootPart.Position - coin.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                nearestCoin = coin
            end
        end
    end
    
    return nearestCoin
end

-- Function to fly towards a coin
local function flyToCoin(coin)
    while coin and coin.Parent == coinContainer do
        -- Move player towards the coin
        local direction = (coin.Position - humanoidRootPart.Position).unit
        humanoidRootPart.Velocity = direction * flightSpeed
        
        -- Break the loop if the player is close enough to the coin
        if (humanoidRootPart.Position - coin.Position).Magnitude < 5 then
            humanoidRootPart.Velocity = Vector3.new(0, 0, 0) -- Stop moving when close to the coin
            break
        end
        
        wait(0.1) -- Wait a bit before recalculating
    end
end

-- Main loop to continuously find and fly to the nearest "Coin_Server"
while wait(1) do
    local nearestCoin = getNearestCoin()
    
    if nearestCoin then
        flyToCoin(nearestCoin)
    end
end
