local doorModel = script.Parent.Parent
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage.Remotes

local TweenService = game:GetService("TweenService")
local doorTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out,0,false,0)

local doorTween = TweenService:Create(doorModel.Door, doorTweenInfo, {CFrame = doorModel.DoorOpen.CFrame})
local TS = game:GetService("TweenService")

function OpenDoor()
    doorTween:Play()
end

script.Parent.Touched:Connect(function()

	Remotes.NewRoomEvent:Fire()
	script.Parent.CanTouch = false
	
	OpenDoor()
end)