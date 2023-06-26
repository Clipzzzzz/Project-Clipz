local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local COREGUI = game:GetService("CoreGui")
local UIS = game:GetService('UserInputService')
local Window = OrionLib:MakeWindow({Name = "Project Clipz", HidePremium = false, SaveConfig = true, ConfigFolder = "ProjectClipz", IntroEnabled = true, IntroText = "Project Clipz | ROLL the DICE", IntroIcon = "http://www.roblox.com/asset/?id=13865945492", Icon = "http://www.roblox.com/asset/?id=13858114914"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

local Tab = Window:MakeTab({
	Name = "Featured",
	Icon = "http://www.roblox.com/asset/?id=10002492897",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Upgrades",
	Icon = "http://www.roblox.com/asset/?id=2245714171",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

--[[ local Section = Tab:AddSection({
	Name = "Section"
}) ]]

--[[
Name = <string> - The name of the section.
]]

OrionLib:MakeNotification({
	Name = "Project Clipz",
	Content = "Thank you for using Project Clipz",
	Image = "http://www.roblox.com/asset/?id=13858114914",
	Time = 5
})

--[[
Title = <string> - The title of the notification.
Content = <string> - The content of the notification.
Image = <string> - The icon of the notification.
Time = <number> - The duration of the notfication.
]]

local orion = COREGUI:WaitForChild("Orion")

local frame = orion:FindFirstChild("Frame")
local dragToggle = nil
local dragSpeed = 0.25
local dragStart = nil
local startPos = nil

local function updateInput(input)
	local delta = input.Position - dragStart
	local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
end

frame.InputBegan:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
		dragToggle = true
		dragStart = input.Position
		startPos = frame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragToggle = false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		if dragToggle then
			updateInput(input)
		end
	end
end)


OrionLib:Init()
