local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = game.ReplicatedStorage.Remotes

local ServerScriptService = game:GetService("ServerScriptService")

local Room = require(ServerScriptService.Room)
local RoomChoices = game.ReplicatedStorage:WaitForChild("Rooms"):GetChildren()

local prevRoom = workspace.StarterRoom

local prevRoomTable = {}

local function RoomGeneration()
	prevRoomTable[#prevRoomTable + 1] = prevRoom
	prevRoom = Room.Generate(prevRoom)
  
  print(prevRoom)
  print(prevRoomTable)
  if #prevRoomTable > 2 then
    local RoomToDestroy = prevRoomTable[1]
    table.remove(prevRoomTable, 1)
    RoomToDestroy:Destroy()
  end
end
Remotes.NewRoomEvent.Event:Connect(RoomGeneration) -- e