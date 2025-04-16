-- Will not be receiving updates so it is now open source
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Click Sound
local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://4499400560"
clickSound.Volume = 1
clickSound.Parent = screenGui

local function playClick()
	clickSound:Play()
end

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 440)
frame.Position = UDim2.new(0.5, -160, 0.5, -220)
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

-- Auto Collect Crops Button
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

-- L and R Buttons
local LButton = Instance.new("TextButton")
LButton.Size = UDim2.new(0, 30, 0, 30)
LButton.Position = UDim2.new(0.5, -125, 0.14, 5)
LButton.Text = "L"
LButton.Font = Enum.Font.FredokaOne
LButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
LButton.BorderSizePixel = 0
LButton.Parent = frame
local LCorner = Instance.new("UICorner", LButton)
LCorner.CornerRadius = UDim.new(0, 8)

local RButton = Instance.new("TextButton")
RButton.Size = UDim2.new(0, 30, 0, 30)
RButton.Position = UDim2.new(0.5, 95, 0.14, 5)
RButton.Text = "R"
RButton.Font = Enum.Font.FredokaOne
RButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
RButton.BorderSizePixel = 0
RButton.Parent = frame
local RCorner = Instance.new("UICorner", RButton)
RCorner.CornerRadius = UDim.new(0, 8)

local function updateLRButtons(selected)
	if selected == "L" then
		LButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		RButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	elseif selected == "R" then
		LButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		RButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
	end
end

local selectedPath = "R"
updateLRButtons("R")

-- Efficiency Toggle
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

-- Auto Buy Seeds Button
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

Instance.new("UICorner", autoBuySeedsBtn).CornerRadius = UDim.new(0, 10)

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
Instance.new("UICorner", seedBox).CornerRadius = UDim.new(0, 8)

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
Instance.new("UICorner", autoBuyGearsBtn).CornerRadius = UDim.new(0, 10)

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
Instance.new("UICorner", gearBox).CornerRadius = UDim.new(0, 8)

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 0, 40)
closeButton.Position = UDim2.new(1, 5, 0, -5)
closeButton.Text = "X"
closeButton.TextSize = 20
closeButton.Font = Enum.Font.FredokaOne
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.BorderSizePixel = 0
Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0, 12)
local closeHolder = Instance.new("Frame")
closeHolder.Size = closeButton.Size
closeHolder.Position = closeButton.Position
closeHolder.BackgroundTransparency = 1
closeHolder.Parent = frame
closeButton.Position = UDim2.new(0, 0, 0, 0)
closeButton.Parent = closeHolder

-- Auto Collect Logic
local TweenService = game:GetService("TweenService")
local hrp = player.Character:WaitForChild("HumanoidRootPart")
local scriptEnabled = false
local efficiencyMode = false
local radius = 15

local defaultPath = {
	Vector3.new(34.54681, 3.110025, -84.12538),
	Vector3.new(35.04697, 3.110025, -128.18956),
	Vector3.new(-12.55004, 3.110025, -128.7298),
	Vector3.new(-13.07867, 3.110025, -82.13247),
}

local leftPath = {
	Vector3.new(-72.250, 3.110, -82.371),
	Vector3.new(-72.262, 3.110, -128.690),
	Vector3.new(-134.833, 3.110, -128.543),
	Vector3.new(-134.414, 3.110, -81.896),
}

local function tweenTo(pos)
	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(pos)})
	tween:Play()
	tween.Completed:Wait()
end

LButton.MouseButton1Click:Connect(function()
	selectedPath = "L"
	updateLRButtons("L")
end)

RButton.MouseButton1Click:Connect(function()
	selectedPath = "R"
	updateLRButtons("R")
end)

toggleButton.MouseButton1Click:Connect(function()
	playClick()
	scriptEnabled = not scriptEnabled
	toggleButton.Text = scriptEnabled and "Auto Collect Crops: ON" or "Auto Collect Crops: OFF"
	toggleButton.BackgroundColor3 = scriptEnabled and Color3.fromRGB(0, 180, 100) or Color3.fromRGB(0, 122, 255)

	if scriptEnabled then
		task.spawn(function()
			while scriptEnabled do
				local currentPath = selectedPath == "L" and leftPath or defaultPath

				for _, pos in ipairs(currentPath) do
					if not scriptEnabled then break end
					tweenTo(pos)
					for _, prompt in pairs(workspace:GetDescendants()) do
						if prompt:IsA("ProximityPrompt") and prompt.Enabled then
							local part = prompt.Parent:IsA("BasePart") and prompt.Parent or prompt.Parent:FindFirstChildWhichIsA("BasePart")
							if part and (part.Position - hrp.Position).Magnitude <= radius then
								task.spawn(function()
									pcall(function()
										prompt.RequiresLineOfSight = false
										prompt.MaxActivationDistance = math.huge
										fireproximityprompt(prompt)
									end)
								end)
							end
						end
					end
					task.wait(efficiencyMode and 1 or 0.3)
				end
			end
		end)
	end
end)

efficiencyToggle.MouseButton1Click:Connect(function()
	playClick()
	efficiencyMode = not efficiencyMode
	efficiencyToggle.Text = "Efficiency Mode: " .. (efficiencyMode and "ON" or "OFF")
	efficiencyToggle.BackgroundColor3 = efficiencyMode and Color3.fromRGB(0, 180, 255) or Color3.fromRGB(100, 100, 255)
end)

closeButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- Auto Buy Seeds
local autoBuySeeds = false
autoBuySeedsBtn.MouseButton1Click:Connect(function()
	playClick()
	autoBuySeeds = not autoBuySeeds
	autoBuySeedsBtn.Text = autoBuySeeds and "Stop Auto Buy Seeds" or "Start Auto Buy Seeds"
	while autoBuySeeds do
		local seeds = string.split(seedBox.Text, ",")
		for _, seed in pairs(seeds) do
			seed = seed:match("^%s*(.-)%s*$")
			if seed ~= "" then
				pcall(function()
					game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuySeedStock"):FireServer(seed, 0)
				end)
			end
		end
		task.wait(2)
	end
end)

-- Auto Buy Gears
local autoBuyGears = false
autoBuyGearsBtn.MouseButton1Click:Connect(function()
	playClick()
	autoBuyGears = not autoBuyGears
	autoBuyGearsBtn.Text = autoBuyGears and "Stop Auto Buy Gears" or "Start Auto Buy Gears"
	while autoBuyGears do
		local gears = string.split(gearBox.Text, ",")
		for _, gear in pairs(gears) do
			gear = gear:match("^%s*(.-)%s*$")
			if gear ~= "" then
				pcall(function()
					game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("BuyGearStock"):FireServer(gear, 0)
				end)
			end
		end
		task.wait(2)
	end
end)
