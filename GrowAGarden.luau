-- Will not be recieving updates so it is now open source
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Click Sound
local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://4499400560"
clickSound.Volume = 1
clickSound.Parent = screenGui

-- Helper to play click sound
local function playClick()
	clickSound:Play()
end

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 400)
frame.Position = UDim2.new(0.5, -160, 0.5, -200)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = frame

-- Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Text = "Grow a Garden GUI"
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.FredokaOne
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = frame

-- Auto Collect Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 180, 0, 40)
toggleButton.Position = UDim2.new(0.5, -90, 0.14, 0)
toggleButton.Text = "Auto Collect Crops: OFF"
toggleButton.TextSize = 16
toggleButton.Font = Enum.Font.FredokaOne
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
toggleButton.BorderSizePixel = 0
toggleButton.Parent = frame

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 10)
toggleCorner.Parent = toggleButton

-- Efficiency Mode Button
local efficiencyToggle = Instance.new("TextButton")
efficiencyToggle.Size = UDim2.new(0, 180, 0, 30)
efficiencyToggle.Position = UDim2.new(0.5, -90, 0.25, 0)
efficiencyToggle.Text = "Efficiency Mode: OFF"
efficiencyToggle.TextSize = 14
efficiencyToggle.Font = Enum.Font.FredokaOne
efficiencyToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
efficiencyToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
efficiencyToggle.BorderSizePixel = 0
efficiencyToggle.Parent = frame

local efficiencyCorner = Instance.new("UICorner")
efficiencyCorner.CornerRadius = UDim.new(0, 10)
efficiencyCorner.Parent = efficiencyToggle

-- Auto Buy Seeds
local autoBuySeedsBtn = Instance.new("TextButton")
autoBuySeedsBtn.Size = UDim2.new(0, 180, 0, 40)
autoBuySeedsBtn.Position = UDim2.new(0.5, -90, 0.38, 0)
autoBuySeedsBtn.Text = "Start Auto Buy Seeds"
autoBuySeedsBtn.TextSize = 16
autoBuySeedsBtn.Font = Enum.Font.FredokaOne
autoBuySeedsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoBuySeedsBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
autoBuySeedsBtn.BorderSizePixel = 0
autoBuySeedsBtn.Parent = frame

local seedBuyCorner = Instance.new("UICorner")
seedBuyCorner.CornerRadius = UDim.new(0, 10)
seedBuyCorner.Parent = autoBuySeedsBtn

-- Seed Input Box
local seedBox = Instance.new("TextBox")
seedBox.Size = UDim2.new(0, 240, 0, 30)
seedBox.Position = UDim2.new(0.5, -120, 0.52, 0)
seedBox.PlaceholderText = "Enter seeds (comma separated)"
seedBox.Text = ""
seedBox.TextSize = 14
seedBox.Font = Enum.Font.FredokaOne
seedBox.TextColor3 = Color3.fromRGB(0, 0, 0)
seedBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
seedBox.Parent = frame

local seedBoxCorner = Instance.new("UICorner")
seedBoxCorner.CornerRadius = UDim.new(0, 8)
seedBoxCorner.Parent = seedBox

-- Auto Buy Gears
local autoBuyGearsBtn = Instance.new("TextButton")
autoBuyGearsBtn.Size = UDim2.new(0, 180, 0, 40)
autoBuyGearsBtn.Position = UDim2.new(0.5, -90, 0.66, 0)
autoBuyGearsBtn.Text = "Start Auto Buy Gears"
autoBuyGearsBtn.TextSize = 16
autoBuyGearsBtn.Font = Enum.Font.FredokaOne
autoBuyGearsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoBuyGearsBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
autoBuyGearsBtn.BorderSizePixel = 0
autoBuyGearsBtn.Parent = frame

local gearBuyCorner = Instance.new("UICorner")
gearBuyCorner.CornerRadius = UDim.new(0, 10)
gearBuyCorner.Parent = autoBuyGearsBtn

-- Gear Input Box
local gearBox = Instance.new("TextBox")
gearBox.Size = UDim2.new(0, 240, 0, 30)
gearBox.Position = UDim2.new(0.5, -120, 0.81, 0)
gearBox.PlaceholderText = "Enter gear (comma separated)"
gearBox.Text = ""
gearBox.TextSize = 14
gearBox.Font = Enum.Font.FredokaOne
gearBox.TextColor3 = Color3.fromRGB(0, 0, 0)
gearBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
gearBox.Parent = frame

local gearBoxCorner = Instance.new("UICorner")
gearBoxCorner.CornerRadius = UDim.new(0, 8)
gearBoxCorner.Parent = gearBox

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, 5, 0, -5)
closeButton.Text = "X"
closeButton.TextSize = 20
closeButton.Font = Enum.Font.FredokaOne
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.BorderSizePixel = 0

local closeUICorner = Instance.new("UICorner")
closeUICorner.CornerRadius = UDim.new(0, 12)
closeUICorner.Parent = closeButton

local closeHolder = Instance.new("Frame")
closeHolder.Size = closeButton.Size
closeHolder.Position = closeButton.Position
closeHolder.BackgroundTransparency = 1
closeHolder.Parent = frame
closeButton.Position = UDim2.new(0, 0, 0, 0)
closeButton.Parent = closeHolder

-- Script logic for Auto Collect Crops with repeated tweening and prompt firing
local TweenService = game:GetService("TweenService")
local hrp = player.Character:WaitForChild("HumanoidRootPart")
local scriptEnabled = false
local efficiencyMode = false
local radius = 15

-- Reference to spawn point and target positions for tweening
local referenceSpawnPosition = Vector3.new(8.171, 5.105, -64.527)
local targetWorldPositions = {
	Vector3.new(34.54681, 3.110025, -84.12538),
	Vector3.new(35.04697, 3.110025, -128.18956),
	Vector3.new(-12.55004, 3.110025, -128.7298),
	Vector3.new(-13.07867, 3.110025, -82.13247),
}
local relativeOffsets = {}
for _, worldPos in ipairs(targetWorldPositions) do
	table.insert(relativeOffsets, worldPos - referenceSpawnPosition)
end

-- Function to tween the player to the target position
local function tweenToPosition(position)
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(position)})
	tween:Play()
	tween.Completed:Wait()
end

-- Auto Collect Crops logic with repeated tweening and prompt firing
toggleButton.MouseButton1Click:Connect(function()
	playClick()
	scriptEnabled = not scriptEnabled
	if scriptEnabled then
		toggleButton.Text = "Auto Collect Crops: ON"
		toggleButton.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
		task.spawn(function()
			while scriptEnabled do
				-- Fire proximity prompts
				local nearbyPrompts = {}
				for _, prompt in pairs(workspace:GetDescendants()) do
					if prompt:IsA("ProximityPrompt") and prompt.Enabled then
						local part = prompt.Parent:IsA("BasePart") and prompt.Parent or prompt.Parent:FindFirstChildWhichIsA("BasePart")
						if part and (part.Position - hrp.Position).Magnitude <= radius then
							table.insert(nearbyPrompts, prompt)
						end
					end
				end

				if #nearbyPrompts > 0 then
					for _, prompt in pairs(nearbyPrompts) do
						pcall(function()
							prompt.RequiresLineOfSight = false
							prompt.MaxActivationDistance = math.huge
							fireproximityprompt(prompt)
						end)
					end
				end

				-- Move to each of the 4 target positions repeatedly
				local spawnPoint = workspace:WaitForChild("Farm"):FindFirstChild("Spawn_Point")
				if spawnPoint then
					local currentSpawnPos = spawnPoint.Position
					for _, offset in ipairs(relativeOffsets) do
						local targetPos = currentSpawnPos + offset
						tweenToPosition(targetPos)
					end
				end

				task.wait(efficiencyMode and 1 or 0.3)
			end
		end)
	else
		toggleButton.Text = "Auto Collect Crops: OFF"
		toggleButton.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
	end
end)

-- Efficiency Toggle
efficiencyToggle.MouseButton1Click:Connect(function()
	playClick()
	efficiencyMode = not efficiencyMode
	efficiencyToggle.Text = "Efficiency Mode: " .. (efficiencyMode and "ON" or "OFF")
	efficiencyToggle.BackgroundColor3 = efficiencyMode and Color3.fromRGB(0, 180, 255) or Color3.fromRGB(100, 100, 255)
end)

-- Close Button functionality
closeButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)
