local room = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
room.random = Random.new()

function room.GetRandom()
  local possibleRooms = ReplicatedStorage.Rooms:GetChildren()
  local randomRoom = possibleRooms[room.random:NextInteger(1, #possibleRooms)]

  return randomRoom
end

function room.Destroy(room, roomTable)
  -- get room that is indexed in the table as #prevRoomTable - 5
  -- destroy that room
  -- remove that room from the table
  local roomTable = {}
  
  room:Destroy()

  return roomTable
end

function room.Generate(prevRoom)
  local randomRoom = room.GetRandom(prevRoom)
  local newRoom = randomRoom:Clone()

  newRoom.PrimaryPart = newRoom.Entrance
  newRoom:PivotTo(prevRoom.Exit.CFrame)

  newRoom.Parent = workspace.GeneratedRooms

  return newRoom
end

return room