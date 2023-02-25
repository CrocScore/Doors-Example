local Brick = script.Parent

local function PlayerTouched(Part)
	local Parent = Part.Parent
	if game.Players:GetPlayerFromCharacter(Parent) then
		Brick.Transparency = 1
	end
end

Brick.Touched:connect(PlayerTouched)