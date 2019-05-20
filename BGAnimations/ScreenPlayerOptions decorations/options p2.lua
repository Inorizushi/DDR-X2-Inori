local MenuState = 'Menustate_GroupList'
local curIndex = 1;
local oldIndex = curIndex;
local screen = SCREENMAN:GetTopScreen{};
local numrow = THEME:GetMetric("ScreenPlayerOptions","NumRowsShown");
local row = "";
local name = "";

local index = 0;
local row = "";
local name = "";
local choice = 0;

local rowwidth = 0;

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

function setting(self,screen,pn)
	index = screen:GetCurrentRowIndex(pn);
	row = screen:GetOptionRow(index);
	name = row:GetName();
	choice = row:GetChoiceInRowWithFocus(pn);
	self:settext(THEME:GetString("OptionExplanations",name));
	if name ~= "Exit" then
		if THEME:GetMetric( "ScreenOptionsMaster",name.."Explanation" ) then
			self:settext(THEME:GetString("OptionItemExplanations",THEME:GetMetric( "ScreenOptionsMaster",name.."Explanation" )..""..choice));
		else self:settext("");
		end;
	end;
	return self;
end;

local function MakeRow(rownames, idx)
	return Def.ActorFrame{
		Name="Row"..idx;
		BeginCommand=function(self)
			self:playcommand(idx == curIndex and "GainFocus" or "LoseFocus")
		end;
		MoveScrollerP2MessageCommand=function(self,param)
			if curIndex == idx then
				self:playcommand("GainFocus")
			elseif oldIndex == idx then
				self:playcommand("LoseFocus")
			end
		end;
		LoadActor("linedark")..{
			InitCommand=cmd(x,310);
			GainFocusCommand=function(self)
				self:diffusealpha(1)
			end;
			LoseFocusCommand=function(self)
				self:diffusealpha(0)
			end;
		};
		LoadActor("hl")..{
			GainFocusCommand=cmd(diffusealpha,1);
			LoseFocusCommand=cmd(diffusealpha,0);
		};
		LoadFont("_arial Bold 24px")..{
			InitCommand=cmd(x,310;halign,0.7;uppercase,true;zoom,0.7;maxwidth,150);
			OnCommand=cmd(queuecommand,"Set");
			SetCommand=function(self)
				local screen = SCREENMAN:GetTopScreen();
				if screen then
					index = screen:GetCurrentRowIndex(PLAYER_2)
					CurrentRowName = screen:GetOptionRow(index):GetName()
					row = screen:GetOptionRow(idx-1);
					name = row:GetName();
					choice = row:GetChoiceInRowWithFocus(PLAYER_2)
					local DisplayName = THEME:GetString("OptionTitles",name);
					if DisplayName ~= "ARROW" and DisplayName ~= "Step" and DisplayName ~= "CHARACTERS" and name ~= "Exit" then
						local DisplayNameRow = THEME:GetString("OptionItemNames",THEME:GetMetric( "ScreenOptionsMaster",name.."Explanation" )..""..choice)
						self:settext(DisplayNameRow)
						local Default = THEME:GetString("OptionItemNames",THEME:GetMetric( "ScreenOptionsMaster",name.."Explanation" ).."0")
						local SpeedFix = THEME:GetString("OptionItemNames","Speed3" )
						if CurrentRowName == name then
							if DisplayNameRow == Default or DisplayNameRow == SpeedFix then
								self:diffuse(color("#07ff07"))
							else
								self:diffuse(color("1,1,1,1"))
							end;
						end;
					elseif DisplayName == "ARROW" then
						--self:settext(choice)
						--Wow that actually worked lol, add 1 to choice otherwise it shows the noteskin before the actual chosen one. -Inori
						self:settext(NOTESKIN:GetNoteSkinNames()[choice+1])
						if CurrentRowName == name then
							self:diffuse(color("#FFFFFF"))
						end;
					elseif name == "Exit" then
						self:settext("")
					elseif DisplayName == "Step" then
						local difftable = {
							[0] = "Beginner",
							[1] = "Basic",
							[2] = "Difficult",
							[3] = "Expert",
							[4] = "Challenge",
							[5] = "Edit"
						};
						local diffcolor = {
							[0] = "#2ddaff",
							[1] = "#ffae00",
							[2] = "#ff384f",
							[3] = "0,0.996,0,1",
							[4] = "#de52ec",
							[5] = "0.8,0.8,0.8,1"
						}
						self:settext(difftable[choice]);
						if CurrentRowName == name then
							self:diffuse(color(diffcolor[choice]))
						end;
					elseif DisplayName == "CHARACTERS" then
						if choice == 0 then
							self:settext(THEME:GetString('OptionNames','Off'))
						else
							self:settext(Characters.GetAllCharacterNames()[choice])
						end;
						if CurrentRowName == name then
							self:diffuse(color("#FFFFFF"))
						end;
					else
						self:settext("")
					end;
				end;
			end;
			MenuRightP2MessageCommand=cmd(queuecommand,"Set");
			MenuLeftP2MessageCommand=cmd(queuecommand,"Set");
			GainFocusCommand=cmd(queuecommand,"Set");
			LoseFocusCommand=cmd(diffuse,color("#5e5e5e"))
		};
		Def.ActorFrame{
			InitCommand=cmd(x,310);
			LoadActor("arrow")..{
				InitCommand=cmd(x,-112;diffusealpha,1;queuecommand,"Anim");
				GainFocusCommand=cmd(visible,true);
				LoseFocusCommand=cmd(visible,false);
				AnimCommand=cmd(diffuseblink;effectcolor1,color("1,1,1,1");effectcolor2,color("#7e7e7e");effectperiod,2);
			};
			LoadActor("arrow")..{
				InitCommand=cmd(x,-112;diffusealpha,0);
				GainFocusCommand=cmd(visible,true);
				LoseFocusCommand=cmd(visible,false);
				MenuLeftP2MessageCommand=cmd(diffuse,color("1,1,1,1");sleep,0.1;diffuse,color("#7e7e7e");sleep,0.1;diffuse,color("1,1,1,1");sleep,0.1;diffuse,color("#7e7e7e");sleep,0.1;diffuse,color("1,1,1,1");sleep,0.1;diffusealpha,0);
			};
			LoadActor("arrow")..{
				InitCommand=cmd(x,112;diffusealpha,1;zoomx,-1;queuecommand,"Anim");
				GainFocusCommand=cmd(visible,true);
				LoseFocusCommand=cmd(visible,false);
				AnimCommand=cmd(diffuseblink;effectcolor1,color("1,1,1,1");effectcolor2,color("#7e7e7e");effectperiod,2);
			};
			LoadActor("arrow")..{
				InitCommand=cmd(x,112;zoomx,-1;diffusealpha,0);
				GainFocusCommand=cmd(visible,true);
				LoseFocusCommand=cmd(visible,false);
				MenuRightP2MessageCommand=cmd(diffuse,color("1,1,1,1");sleep,0.1;diffuse,color("#7e7e7e");sleep,0.1;diffuse,color("1,1,1,1");sleep,0.1;diffuse,color("#7e7e7e");sleep,0.1;diffuse,color("1,1,1,1");sleep,0.1;diffusealpha,0);
			};
		};
		Def.Sprite{
			Name="Row Name";
			Texture = "TitleGreen 1x17.png";
			InitCommand=cmd(pause;setstate,0);
			OnCommand=cmd(queuecommand,"Set");
			SetCommand=function(self)
				local screen = SCREENMAN:GetTopScreen();
				if screen then
					row = screen:GetOptionRow(idx-1);
					name = row:GetName();
					local DisplayName = THEME:GetString("OptionTitles",name);
					if name ~= "Exit" then
						self:setstate(rowtoind[DisplayName])
					else
						self:setstate(0)
						self:diffusealpha(0)
					end;
				end;
			end;
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
		};
	};
end;

local RowList = {};
for i=1,#rownames do
	RowList[#RowList+1] = MakeRow(rownames[i],i)
end;

local t = Def.ActorFrame{};
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(xy,_screen.cx-14,_screen.cy-248);
	OnCommand=cmd(addx,-SCREEN_WIDTH;accelerate,0.5;addx,SCREEN_WIDTH);
	OffCommand=cmd(sleep,0.2;accelerate,0.5;addx,SCREEN_WIDTH);
	Def.Actor{
		Name="InputHandler";
		MenuUpP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Up", }); end;
		MenuDownP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Down", }); end;
		MenuStartP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Start", }); end;
		CodeMessageCommand=function(self,param)
			MESSAGEMAN:Broadcast("MenuInput", { Player = param.PlayerNumber, Input = param.Name, })
		end;

		MenuInputMessageCommand=function(self,param)
			-- direction
			oldIndex = curIndex
			if param.Input == "Up" and param.Player == PLAYER_2 then
				if curIndex == 1 then
					curIndex = 15
				else
					curIndex = curIndex - 1
				end
			elseif param.Input == "Down" and param.Player == PLAYER_2 then
				if curIndex < #RowList then
					curIndex = curIndex + 1
				elseif curIndex >= 15 then
					curIndex = 1
				end
			end
			MESSAGEMAN:Broadcast("MoveScrollerP2",{Input = param.Input});
		end
	};
	Def.ActorScroller{
		Name="ListScrollerP2";
		SecondsPerItem=0;
		NumItemsToDraw=30;
		TransformFunction=function(self,offsetFromCenter,itemIndex,numItems)
			self:y( offsetFromCenter * 28 );
		end;
		children = RowList;
	};
};

t[#t+1] =	Def.ActorFrame{
	InitCommand=cmd(xy,SCREEN_CENTER_X+250,SCREEN_BOTTOM-140);
	OnCommand=cmd(addx,-SCREEN_WIDTH;accelerate,0.5;addx,SCREEN_WIDTH);
	OffCommand=cmd(sleep,0.2;accelerate,0.5;addx,SCREEN_WIDTH);
	LoadActor("exp.png");
	LoadFont("_helveticaneuelt pro 65 md Bold 24px")..{
	   InitCommand=cmd(xy,118,-38;maxwidth,360;zoom,0.8;halign,1;valign,0);
		BeginCommand=cmd(queuecommand,"SetP2");
	   SetP2Command=function(self)
	     local screen = SCREENMAN:GetTopScreen();
	     if screen then
	       setting(self,screen,PLAYER_2);
	     end;
	   end;
	   MenuLeftP2MessageCommand=cmd(playcommand,"SetP2");
	   MenuRightP2MessageCommand=cmd(playcommand,"SetP2");
	   MenuUpP2MessageCommand=cmd(playcommand,"SetP2");
	   MenuDownP2MessageCommand=cmd(playcommand,"SetP2");
	 };
	 Def.Sprite{
		 InitCommand=cmd(visible,false);
		 SetCommand=function(self)
			 local screen = SCREENMAN:GetTopScreen();
			 if screen then
				 index = screen:GetCurrentRowIndex(PLAYER_2);
 				CurrentRowName = screen:GetOptionRow(index):GetName();
		 		if CurrentRowName == "Exit" then
					self:Load(THEME:GetPathB("","ScreenPlayerOptions decorations/2P_WAIT.png"));
					self:visible(true)
				else
					self:visible(false)
				end;
			end;
		end;
		OffCommand=function(self)
			self:Load(THEME:GetPathB("","ScreenPlayerOptions decorations/2P_OK.png"));
			self:visible(true)
		end;
		MenuLeftP2MessageCommand=cmd(playcommand,"Set");
		MenuRightP2MessageCommand=cmd(playcommand,"Set");
		MenuUpP2MessageCommand=cmd(playcommand,"Set");
		MenuDownP2MessageCommand=cmd(playcommand,"Set");
		MenuStartP2MessageCommand=cmd(playcommand,"Set");
	};
};


return t;
