-- LocalScript (place in StarterPlayerScripts)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local sellEvent = ReplicatedStorage:WaitForChild("GameEvents"):WaitForChild("Sell_Inventory")

local sellPosition = Vector3.new(61.585, 2.999, 0.426)
local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local tweenInProgress = false

-- Function to get inventory count
local function getInventoryCount()
	local backpack = player:FindFirstChild("Backpack")
	return backpack and #backpack:GetChildren() or 0
end

-- Tween helper
local function tweenToPosition(hrp, position)
	local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(position)})
	tween:Play()
	tween.Completed:Wait()
end

-- Main loop
task.spawn(function()
	while true do
		task.wait(0.5)

		if getInventoryCount() >= 150 and not tweenInProgress then
			local character = player.Character or player.CharacterAdded:Wait()
			local hrp = character:WaitForChild("HumanoidRootPart")

			tweenInProgress = true

			-- Save original position
			local originalPosition = hrp.Position

			-- Tween to sell position
			tweenToPosition(hrp, sellPosition)

			-- Snap to exact sell position
			character:SetPrimaryPartCFrame(CFrame.new(sellPosition))

			-- Fire the sell remote
			sellEvent:FireServer()

			-- Tween back to original position
			tweenToPosition(hrp, originalPosition)

			tweenInProgress = false
		end
	end
end)
