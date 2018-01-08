local sort_wheel = setmetatable({}, sick_wheel_mt)

local input = LoadActor("InputHandler.lua", sort_wheel)
local wheel_item_mt = LoadActor("WheelItemMT.lua")

local sortmenu = { w=210, h=160 }
-- - - - - - - - - - - - - - - - - - - - - - - - - - - -

local t = Def.ActorFrame {
	Name="SortMenu",
	InitCommand=function(self)
		-- ALWAYS ensure that the SortMenu is hidden and that players have
		-- input directed back to them on screen initialization.  Always.
		self:queuecommand("HideSortMenu")
	end,
	ShowSortMenuCommand=function(self)
		SOUND:StopMusic()
		SCREENMAN:GetTopScreen():AddInputCallback(input)

		for player in ivalues(GAMESTATE:GetHumanPlayers()) do
			SCREENMAN:set_input_redirected(player, true)
		end
		self:visible(true)
	end,
	HideSortMenuCommand=function(self)
		SCREENMAN:GetTopScreen():RemoveInputCallback(input)
		for player in ivalues(GAMESTATE:GetHumanPlayers()) do
			SCREENMAN:set_input_redirected(player, false)
		end
		self:visible(false)
	end,

	OnCommand=function(self)
		self:visible(false)

		local wheel_options = {
			{"SortBy", "Group"},
			{"SortBy", "Title"},
			{"SortBy", "Artist"},
			{"SortBy", "Genre"},
			{"SortBy", "BPM"},
			{"SortBy", "Length"},
			{"SortBy", "BeginnerMeter"},
			{"SortBy", "EasyMeter"},
			{"SortBy", "MediumMeter"},
			{"SortBy", "HardMeter"},
			{"SortBy", "ChallengeMeter"},
			{"SortBy", "Popularity"},
			{"SortBy", "Recent"}
		}
		-- Override sick_wheel's default focus_pos, which is math.floor(num_items / 2)
		--
		-- keep in mind that num_items is the number of Actors in the wheel (here, 7)
		-- NOT the total number of things you can eventually scroll through (#sort_orders = 12)
		--
		-- so, math.floor(7/2) gives focus to the third item in the wheel, which looks weird
		-- in this particular usage.  Thus, set the focus to the wheel's current 4th Actor.
		sort_wheel.focus_pos = 4

		-- get the currenly active SortOrder and truncate the "SortOrder_" from the beginning
		local current_sort_order = ToEnumShortString(GAMESTATE:GetSortOrder())
		local current_sort_order_index = 1

		for i=1, #wheel_options do
			if wheel_options[i][1] == "SortBy" and wheel_options[i][2] == current_sort_order then
				current_sort_order_index = i
				break
			end
		end

		-- the second argument passed to set_info_set is the index of the item in sort_orders
		-- that we want to have focus when the wheel is created
		sort_wheel:set_info_set(wheel_options, current_sort_order_index)
	end,

	-- slightly darken the entire screen
	Def.Quad {
		InitCommand=function(self) self:FullScreen():diffuse(Color.Black):diffusealpha(0.8) end
	},
	-- this returns an ActorFrame ( see: ./Scripts/Consensual-sick_wheel.lua )
	sort_wheel:create_actors( "sort_wheel", 7, wheel_item_mt, _screen.cx, _screen.cy )
}

t[#t+1] = LoadActor( THEME:GetPathS("ScreenSelectMaster", "change") )..{ Name="change_sound", SupportPan = false }
t[#t+1] = LoadActor( THEME:GetPathS("common", "start") )..{ Name="start_sound", SupportPan = false }

return t
