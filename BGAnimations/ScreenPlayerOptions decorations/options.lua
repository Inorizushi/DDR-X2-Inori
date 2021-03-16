local args = {...};
local pn = args[1];

local screen = SCREENMAN:GetTopScreen();

local function p(text)
    return text:gsub("%%", ToEnumShortString(pn));
end

local function base_x()
	if pn == PLAYER_1 then
		if IsUsingWideScreen() then
			return SCREEN_CENTER_X-566
		else
			return _screen.cx-360
		end
	elseif pn == PLAYER_2 then
		if IsUsingWideScreen() then
			return SCREEN_CENTER_X+566
		else
			return _screen.cx+360
		end
    else
        error("Pass a valid player number, dingus.",2)
    end
end

local screen = SCREENMAN:GetTopScreen();

local rowtoind = {
	["SPEED"] = 0,
	["BOOST"] = 1,
	["APPEARANCE"] = 2,
	["TURN"] = 3,
	["DARK"] = 4,
	["SCROLL"] = 5,
	["ARROW"] = 6,
	["CUT"] = 7,
	["FREEZE ARROW"] = 8,
	["JUMP"] = 9,
	["Step"] = 15,
	["FILTER"] = 14,
	["RISKY"] = 13,
	["CHARACTERS"] = 11,
	["Exit"] = 11,
}

local rownames = {
	"Speed",
	"Accel",
	"Appearance",
	"Turn",
	"Step Zone",
	"Scroll",
	"NoteSkins",
	"Remove",
	"Freeze",
	"Jump",
	"Steps",
	"Filter",
	"Gauge",
	"Characters",
	"Exit",
};

local function GetOptionName(screen, idx)
    return screen:GetOptionRow(idx-1):GetName();
end

local exitIndex = #rownames

function setting(self,screen)
	local index = screen:GetCurrentRowIndex(pn);
	local row = screen:GetOptionRow(index);
	local name = row:GetName();
	local choice = row:GetChoiceInRowWithFocus(pn);
	if name ~= "Exit" then
		if THEME:GetMetric( "ScreenOptionsMaster",name.."Explanation" ) then
			self:settext(THEME:GetString("OptionItemExplanations",name..tostring(choice)));
		else self:settext("");
		end;
	else
		self:settext("")
	end;
end;

local function MakeRow(rownames, idx)
    --the first row begins with focus
    local hasFocus = idx == 1;
    local function IsExitRow()
        return idx == exitIndex;
    end
	return Def.ActorFrame{
		Name="Row"..idx;
		--InitCommand=function(s) s:y(-300+46*(idx-1)); end;
		InitCommand=function(s) s:y(-240+28*(idx-1)); end;
		OnCommand=function(self)
			self:playcommand(hasFocus and "GainFocus" or "LoseFocus");
		end;
		ChangeRowMessageCommand=function(self,param)
            if param.PlayerNumber ~= pn then return end
			if param.RowIndex+1 == idx then
                if not hasFocus then
                    hasFocus = true;
				    self:stoptweening();
				    self:queuecommand("GainFocus");
                end;
			elseif hasFocus then
                hasFocus = false;
				self:queuecommand("LoseFocus");
			end;
		end;
		Def.Sprite{
			Texture=ToEnumShortString(pn).."_WAIT";
			InitCommand=function(s) s:xy(pn==PLAYER_1 and -250 or 250,80):draworder(100):visible(false) end,
			GainFocusCommand=function(self)
                if IsExitRow() then
                    self:visible(true)             
                end;
			end;
			LoseFocusCommand=function(self)
				self:visible(false)    
			end;
			OffCommand=function(self)
				self:Load(THEME:GetPathB("","ScreenPlayerOptions decorations/"..ToEnumShortString(pn).."_OK.png"));
			end;
		};
		Def.ActorFrame{
			Name="Highlight",
			GainFocusCommand=function(s)
				if not IsExitRow() then
					s:visible(true)
				else
					s:visible(false)
				end
			end,
			LoseFocusCommand=function(s) s:visible(false) end,
			Def.Sprite{
				Texture="linedark",
				InitCommand=function(s) s:x(pn==PLAYER_1 and -310 or 310) end,
			};
			Def.Sprite{ Texture="hl",};
		};
		LoadFont("_arial Bold 24px")..{
			InitCommand=function(s) s:x(pn==PLAYER_1 and -310 or 310):uppercase(true):zoom(0.7):maxwidth(150):halign(0.4) end,
			OnCommand=function(s) s:queuecommand("Set") end,
			SetCommand=function(self)
                if IsExitRow() then return end;
				local screen = SCREENMAN:GetTopScreen();
				if screen then
					local SongOrCourse;
					if GAMESTATE:IsCourseMode() then
						SongOrCourse = GAMESTATE:GetCurrentCourse()
					else
						SongOrCourse = GAMESTATE:GetCurrentSong()
					end
                    local name = GetOptionName(screen, idx);
                    local choice = screen:GetOptionRow(idx-1):GetChoiceInRowWithFocus(pn);
                    local function ChoiceToText(choice)
                        if THEME:GetMetric("ScreenOptionsMaster",name.."Explanation") then
                            return THEME:GetString("OptionItemNames",name..tostring(choice))
                        else
                            return ""
                        end
                    end
					if name ~= "NoteSkins" and name ~= "Steps" and name ~= "Characters" then
                        --normal option, handle default choice coloring.
                        local ChoiceText = ChoiceToText(choice)
                        --for most options, 0 is the default choice, for Speed it is 3.
						if ChoiceText and ChoiceText == ChoiceToText(name == "Speed" and 3 or 0) 
                        then
							self:diffuse(color("#07ff07"))
						else
							self:diffuse(color("1,1,1,1"));
						end;
                        self:settext(ChoiceText);
					elseif name == "NoteSkins" then
						--self:settext(choice)
						--Wow that actually worked lol, add 1 to choice otherwise it shows the noteskin before the actual chosen one. -Inori
						self:settext(NOTESKIN:GetNoteSkinNames()[choice+1])
					elseif name == "Steps" then
						local difftable = SongOrCourse:GetStepsByStepsType(GAMESTATE:GetCurrentStyle():GetStepsType())
						local diff = difftable[choice+1]
						self:settext(THEME:GetString("CustomDifficulty",ToEnumShortString(diff:GetDifficulty())));
						self:diffuse(CustomDifficultyToColor(diff:GetDifficulty()))
						--self:diffuse(color(diffcolor[limited_choice]));
					elseif name == "Characters" then
						if choice == 0 then
							self:settext(THEME:GetString('OptionNames','Off'))
						else
							self:settext(Characters.GetAllCharacterNames()[choice])
						end;
					else
						self:settext("");
					end;
				end;
			end;
	    [p"MenuLeft%MessageCommand"]=function(s) s:queuecommand("Set") end,
		[p"MenuRight%MessageCommand"]=function(s) s:queuecommand("Set") end,
		CurrentSongChangedMessageCommand=function(s) s:queuecommand("Set") end,
		GainFocusCommand=function(s) s:queuecommand("Set") end,
		LoseFocusCommand=function(s) s:diffuse(color("#5e5e5e")) end,
		};
		Def.ActorFrame{
			InitCommand=function(s) s:x(pn==PLAYER_1 and -310 or 310) end,
			GainFocusCommand=function(self)
                self:visible(not IsExitRow());
			end;
			LoseFocusCommand=function(s) s:visible(false) end,
			LoadActor("arrow")..{
				InitCommand=function(s) s:x(-112):diffuseblink():effectcolor1(Color.White):effectcolor2(color("#7e7e7e")):effectperiod(2) end,
			};
			LoadActor("arrow")..{
				InitCommand=function(s) s:x(112):zoomx(-1):diffuseblink():effectcolor1(Color.White):effectcolor2(color("#7e7e7e")):effectperiod(2) end,
			};
			LoadActor("arrow")..{
				InitCommand=function(s) s:x(-112):diffusealpha(0) end,
			    [p"MenuLeft%MessageCommand"]=function(s) s:finishtweening():diffuse(Color.White):sleep(0.1):diffuse(color("#7e7e7e")):sleep(0.1):diffuse(Color.White):sleep(0.1):diffuse(color("#7e7e7e")):sleep(0.1):diffuse(Color.White):sleep(0.1):diffusealpha(0) end,
			};
			LoadActor("arrow")..{
				InitCommand=function(s) s:x(112):zoomx(-1):diffusealpha(0) end,
				[p"MenuRight%MessageCommand"]=function(s) s:finishtweening():diffuse(Color.White):sleep(0.1):diffuse(color("#7e7e7e")):sleep(0.1):diffuse(Color.White):sleep(0.1):diffuse(color("#7e7e7e")):sleep(0.1):diffuse(Color.White):sleep(0.1):diffusealpha(0) end,
			};
		};
		Def.Sprite{
			Name="RowName";
			Texture="TitleGreen 1x17",
			InitCommand=function(s) s:animate(false):setstate(0) end,
			OnCommand=function(s) s:queuecommand("Set") end,
			SetCommand=function(s)
				if not IsExitRow() then
					local screen = SCREENMAN:GetTopScreen()
					if screen then
						s:setstate(rowtoind[THEME:GetString("OptionTitles",GetOptionName(screen,idx))])
					else
						s:setstate(11):diffusealpha(0)
						s:queuecommand("Set")
					end
				else
					s:diffusealpha(0)
				end
			end,
			GainFocusCommand=function(self)
				self:finishtweening()
				self:diffuseshift():diffusealpha(1):effectcolor1(color("1,1,1,1")):effectcolor2(color("0.5,0.5,0.5,1")):effectperiod(1)
				self:queuecommand("Set")
			end;
			LoseFocusCommand=function(self)
				self:finishtweening()
				self:stopeffect()
				self:diffusealpha(0)
				self:queuecommand("Set")
			end;
		}
	};
end;

local RowList = {};
for i=1,#rownames do
	RowList[#RowList+1] = MakeRow(rownames[i],i)
end;

local t = Def.ActorFrame{
	InitCommand=function(s) s:xy(_screen.cx-14,SCREEN_CENTER_Y-7) end,
	OnCommand=cmd(addx,-SCREEN_WIDTH;accelerate,0.5;addx,SCREEN_WIDTH);
	  OffCommand=cmd(sleep,0.2;accelerate,0.5;addx,SCREEN_WIDTH);
	  Def.ActorFrame{
		InitCommand=function(s) s:xy(pn==PLAYER_1 and-250 or 250,224) end,
		LoadActor("exp.png");
		LoadFont("_helveticaneuelt pro 65 md Bold 24px")..{
	    InitCommand=function(s) s:xy(-118,-38):maxwidth(360):zoom(0.8):align(0,0) end,
		BeginCommand=function(s) s:queuecommand("Set") end,
	    SetCommand=function(self)
	      local screen = SCREENMAN:GetTopScreen();
	      if screen then
	        setting(self,screen);
	      end;
	    end;
	    [p"MenuLeft%MessageCommand"]=function(s) s:playcommand("Set") end,
	    [p"MenuRight%MessageCommand"]=function(s) s:playcommand("Set") end,
	    ChangeRowMessageCommand=function(s,param)
            if param.PlayerNumber == pn then s:playcommand "Set"; end;
        end;
	  };
	};
    Def.ActorFrame{children=RowList};
};

return t;
