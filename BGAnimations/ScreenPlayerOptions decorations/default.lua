local t = LoadFallbackB();
t[#t+1] = StandardDecorationFromFileOptional("Header","Header");
t[#t+1] = StandardDecorationFromFileOptional("Footer","Footer");
t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");
-- other items (balloons, etc.)
t[#t+1] = Def.ActorFrame{
  Def.Quad{
		InitCommand=cmd(diffuse,color("0,0,0,0");FullScreen);
		OnCommand=cmd(diffusealpha,0;sleep,0.2;linear,0.2;diffusealpha,0.5);
		OffCommand=cmd(linear,0.2;diffusealpha,0);
	};
  LoadActor("back.png")..{
    InitCommand=cmd(xy,_screen.cx+3,_screen.cy-54;diffusealpha,1);
    OnCommand=cmd(addx,-SCREEN_WIDTH;accelerate,0.5;addx,SCREEN_WIDTH);
    OffCommand=cmd(sleep,0.2;accelerate,0.5;addx,SCREEN_WIDTH);
  };
};

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

local function MakeRow(rownames, idx)
  return Def.ActorFrame{
    Name="Row"..idx;
    LoadActor("line.png")..{
			OnCommand=cmd(queuecommand,"Set");
			SetCommand=function(self)
				local screen = SCREENMAN:GetTopScreen();
				if screen then
					if (idx % 2) == 0 then
						self:diffusealpha(0)
					else
						self:diffusealpha(0.15)
					end;
				end;
			end;
    };
    LoadActor("linelight")..{
      InitCommand=cmd(diffusealpha,0.15;x,-310);
    };
    LoadActor("linelight")..{
      InitCommand=cmd(diffusealpha,0.15;x,310);
    };
    Def.Sprite{
			Name="Row Name";
			Texture = "Title 1x17.png";
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
    };
  };
end;

local RowList = {};
for i=1,#rownames do
	RowList[#RowList+1] = MakeRow(rownames[i],i)
end;

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(xy,_screen.cx-14,_screen.cy-248);
	OnCommand=cmd(addx,-SCREEN_WIDTH;accelerate,0.5;addx,SCREEN_WIDTH);
  OffCommand=cmd(sleep,0.2;accelerate,0.5;addx,SCREEN_WIDTH);
  Def.ActorScroller{
    Name="ListScroller";
		SecondsPerItem=0;
		NumItemsToDraw=30;
		TransformFunction=function(self,offsetFromCenter,itemIndex,numItems)
			self:y( offsetFromCenter * 28 );
		end;
		children = RowList;
  };
};

if GAMESTATE:IsHumanPlayer(PLAYER_1) then
  t[#t+1] = LoadActor("options p1.lua");
end;

if GAMESTATE:IsHumanPlayer(PLAYER_2) then
  t[#t+1] = LoadActor("options p2.lua");
end;

return t
