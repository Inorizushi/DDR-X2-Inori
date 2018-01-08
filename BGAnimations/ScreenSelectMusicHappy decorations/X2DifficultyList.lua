local function LoadMetric(name, isBoolean)
	local metricValue = THEME:GetMetric("StarterDifficultyList", name)
	assert(metricValue, "StarterDifficultyList: can't load metric "..name)
	--only numbers and booleans are supported right now
	if isBoolean then
		return (metricValue == "true") or (metricValue=="1")
	else
		local n =tonumber(metricValue)
		assert(n, "SNDifficultyList: metric "..name.." must be a number")
		return n
	end
end

local hardColor = color "#FF0000"

local function DiffToColor(diff, dark)
	local color = CustomDifficultyToColor(ToEnumShortString(diff))
	if dark then
		return ColorDarkTone(color)
	else
		return color
	end
end

--we need this function because we need to get the current Steps for non-human players.
--however, non-human players don't actually have a current Steps.
local function GetCurrentSteps(pn)
	if not GAMESTATE:IsHumanPlayer(pn) then
		return GAMESTATE:GetCurrentSteps(GAMESTATE:GetMasterPlayerNumber())
	end
	return GAMESTATE:GetCurrentSteps(pn)
end

local function AnyPlayerThisDiff(diff)
    for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
        if GetCurrentSteps(pn):GetDifficulty()==diff then return true end
    end
    return false
end

local function BothPlayersThisDiff(diff,self)
	if GAMESTATE:GetCurrentSteps(PLAYER_1):GetDifficulty()==diff and GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty()==diff then return true end
	return false
end

local difficultiesToDraw = {
    'Difficulty_Beginner',
    'Difficulty_Easy',
}

local invDifficultiesToDraw = {}
for k, v in pairs(difficultiesToDraw) do
    invDifficultiesToDraw[v] = k
end

local function PlayerLabelName(pn)
	local name = GAMESTATE:IsHumanPlayer(pn) and string.lower(ToEnumShortString(pn)) or "cpu"
	return '../../Graphics/Badges/_StarterDiff '..name
end


local startPos = LoadMetric "StartPositionY"
local itemSpacingY = LoadMetric "ItemSpacingY"
local itemBGX = LoadMetric "ItemBGX"
local tickPos = LoadMetric "TickPositionX"
local labelPos = LoadMetric "LabelPositionX"
local plabelX = LoadMetric "PlayerLabelXOffset"

local lastSong = nil
local lastSteps = {PlayerNumber_P1=nil, PlayerNumber_P2=nil}

local function DiffToYPos(diff)
	if invDifficultiesToDraw[diff] == nil then return nil end
	return startPos + ( itemSpacingY*( invDifficultiesToDraw[diff]-1) )
end

local function SetXFromPlayerNumber(that, pn)
	if pn == 'PlayerNumber_P1' then
		that:x(-plabelX)
	elseif pn =='PlayerNumber_P2' then
		that:x(plabelX)
	end
end

local function SetXFromPlayerNumberScore(that, pn)
	if pn == 'PlayerNumber_P1' then
		that:x(-scorePos)
	elseif pn =='PlayerNumber_P2' then
		that:x(scorePos)
	end
end

local function Update(self, _)
	if GAMESTATE then
		local song = GAMESTATE:GetCurrentSong()
		local steps = {}
		local anyStepsChanged = false
		for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
			steps[pn] = GetCurrentSteps(pn)
			if steps[pn] ~= lastSteps[pn] then anyStepsChanged = true break end
		end
		local songChanged = song~=lastSong
		if songChanged or anyStepsChanged then
			MESSAGEMAN:Broadcast("SNDLUpdate", {SongChanged=songChanged, StepsChanged=anyStepsChanged})
		end
		lastSong = song
		lastSteps = steps
	end
end

local ret = Def.ActorFrame{InitCommand=function(self) self:xy(SCREEN_CENTER_X,SCREEN_CENTER_Y+170):queuecommand("On"):SetUpdateFunction(Update) end,
    OffCommand=function(self) self:sleep(0.5):linear(0.2):diffusealpha(0) end}

local function IndicatorUpdate(self, pn)
    if not GAMESTATE:IsPlayerEnabled(pn) then return end
    self:finishtweening()
    local currentlyVisible = self:GetVisible()
    local steps = GetCurrentSteps(pn)
    if steps and GAMESTATE:GetCurrentSong() then
        if currentlyVisible then
            self:linear(0.1)
        end
        local yPos = DiffToYPos(steps:GetDifficulty())
        if yPos then
            self:visible(true)
            self:y(yPos)
            return
        end
    end
    self:visible(false)
end


local function AddContentsToOutput(tbl)
    for _, e in pairs(tbl) do
        table.insert(ret, e)
    end
end

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
for idx, diff in pairs(difficultiesToDraw) do
	local element = Def.ActorFrame{
		OnCommand=cmd(diffusealpha,0;sleep,0.3;diffusealpha,1);
		Name = "Row"..diff,
		SNDLUpdateMessageCommand = function(self) for _, item in pairs(self:GetChildren()) do item:playcommand("Update") end end,
		InitCommand=function(self) self:y(DiffToYPos(diff) ) end,
		Def.Sprite{
			Texture = "diffbg 1x2",
			InitCommand = function(self) self:setstate(idx-1):SetAllStateDelays(math.huge):x(itemBGX) end,
			SNDLUpdateMessageCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					if AnyPlayerThisDiff(diff) then
						self:setstate(idx-1):SetAllStateDelays(math.huge)
					elseif song:HasStepsTypeAndDifficulty(GAMESTATE:GetCurrentStyle():GetStepsType(), diff) then
						self:setstate(idx-1):SetAllStateDelays(math.huge)
					else
						self:setstate(idx-1):SetAllStateDelays(math.huge)
					end
				end
			end
		};
		Def.Sprite{
			Name = "Label",
			Texture = "Steps Colored 1x3.png",
			InitCommand = function(self) self:setstate(idx-1):SetAllStateDelays(math.huge):x(labelPos) end,
			SNDLUpdateMessageCommand=function(self)
				local song = GAMESTATE:GetCurrentSong()
				if song then
						self:setstate(idx-1):SetAllStateDelays(math.huge)
						self:diffusealpha(1)
				else
					self:diffusealpha(1)
				end
			end
		},
		Def.Sprite{
			Name = "TicksBright",
			Texture = "ticks.png",
			InitCommand = function(self) self:x(tickPos):diffuse(DiffToColor(diff)):cropright(1):draworder(2) end,
			SNDLUpdateMessageCommand=function(self, params)
					local song = GAMESTATE:GetCurrentSong()
					if song then
							if params.SongChanged then self:stopeffect() end
							local steps = song:GetOneSteps(GAMESTATE:GetCurrentStyle():GetStepsType(), diff)
							if steps then
									local meter = steps:GetMeter()
									if meter > 5 then
											self:cropright(0):glowshift():effectcolor1(DiffToColor(diff)):effectcolor2(color "#FFFFFF")
									else
											self:stopeffect():cropright(1-meter/5)
									end
							else
									self:stopeffect():cropright(1)
							end
					else
							self:stopeffect():cropright(1)
					end
			end,
		},
		Def.Sprite{
				Name="TicksDark",
				Texture="ticks dark.png",
				InitCommand = function(self) self:x(tickPos):draworder(1) end,
		}
	}
	table.insert(ret, element)
end
end

do
    local indicatorBackgrounds = {}
    local indicatorLabels = {}
    for _, pn in pairs(PlayerNumber) do
        table.insert(indicatorLabels, LoadActor(PlayerLabelName(pn))..{
            Name='PlayerLabel',
            InitCommand=function(self) SetXFromPlayerNumber(self:visible(false), pn) self:zoom(0) end,
						OnCommand=function(self) self:zoom(0):sleep(0.4):linear(0.2):zoom(1):queuecommand("Animate") end,
						OffCommand=cmd(sleep,0.8;linear,0.2;zoom,0);
						AnimateCommand=function(self) self:bounce():effectmagnitude(pn=='PlayerNumber_P2' and -4 or 4,0,0):effectclock('beatnooffset') end,
            SNDLUpdateMessageCommand=function(self) return IndicatorUpdate(self, pn) end,
            PlayerJoinedMessageCommand=function(self,p)
                if p.Player==pn then self:Load(ResolveRelativePath(PlayerLabelName(pn),1)) end
            end
        })
    end
    AddContentsToOutput(indicatorLabels)
end

return ret
