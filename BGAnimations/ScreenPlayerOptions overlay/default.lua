local t = Def.ActorFrame{};

local index = 0;
local row = "";
local name = "";
local choice = 0;

function setting(self,screen,pn)
	index = screen:GetCurrentRowIndex(pn);
	row = screen:GetOptionRow(index);
	name = row:GetName();
	choice = row:GetChoiceInRowWithFocus(pn);
	(cmd(zoom,0.55;wrapwidthpixels,494;horizalign,left;strokecolor,Color("Black")))(self)
	self:settext(THEME:GetString("OptionExplanations",name));
	if PREFSMAN:GetPreference("ArcadeOptionsNavigation") == 0 then
		choice = 1 + choice;
	end;
	if name ~= "Exit" then
		if THEME:GetMetric( "ScreenOptionsMaster",name.."Explanation" ) then
			self:settext(THEME:GetString("OptionItemExplanations",THEME:GetMetric( "ScreenOptionsMaster",name.."Explanation" )..""..choice));
		else self:settext("");
		end;
	end;
	return self;
end;

if GAMESTATE:IsHumanPlayer(PLAYER_1) then
  t[#t+1] = LoadFont("Common Normal")..{
    InitCommand=cmd(x,(SCREEN_CENTER_X*0.575)-158;y,SCREEN_BOTTOM-50;settext,"";);
    OnCommand=cmd(settext,"";);
    SetP1Command=function(self)
      local screen = SCREENMAN:GetTopScreen();
      if screen then
        setting(self,screen,PLAYER_1);
      end;
    end;
    MenuLeftP1MessageCommand=cmd(playcommand,"SetP1");
    MenuRightP1MessageCommand=cmd(playcommand,"SetP1");
    MenuUpP1MessageCommand=cmd(playcommand,"SetP1");
    MenuDownP1MessageCommand=cmd(playcommand,"SetP1");
  };
end;

if GAMESTATE:IsHumanPlayer(PLAYER_2) then
  t[#t+1] = LoadFont("Common Normal")..{
    InitCommand=cmd(x,(SCREEN_CENTER_X*1.425)-104;y,SCREEN_BOTTOM-50;settext,"";);
    OnCommand=cmd(settext,"";);
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
end;


return t;
