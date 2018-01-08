local t = Def.ActorFrame {};
t[#t+1] = Def.ActorFrame {
  Name="Frames";
  LoadActor("Frame")..{
    Name="P1 Frame";
    InitCommand=cmd(x,SCREEN_LEFT;y,SCREEN_BOTTOM-80;halign,1;zoomx,-1);
    OnCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
        self:visible(true)
      else
        self:visible(false)
      end;
      self:diffuse(color("0,0,0,0")):zoomy(0):linear(0.2):diffuse(color("1,1,1,1")):zoomy(1)
    end;
    OffCommand=cmd(smooth,0.2;diffusealpha,0;);
    PlayerJoinedMessageCommand=function(self,param)
      if param.Player == PLAYER_1 then
        self:queuecommand("Off")
      end;
      if param.Player == PLAYER_2 then
        self:queuecommand("Off")
      end;
    end;
  };
  LoadActor("Frame")..{
    Name="P2 Frame";
    InitCommand=cmd(x,SCREEN_RIGHT;y,SCREEN_BOTTOM-80;halign,1);
    OnCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
        self:visible(true)
      else
        self:visible(false)
      end;
      self:diffuse(color("0,0,0,0")):zoomy(0):linear(0.2):diffuse(color("1,1,1,1")):zoomy(1)
    end;
    OffCommand=cmd(smooth,0.2;diffusealpha,0;);
    PlayerJoinedMessageCommand=function(self,param)
      if param.Player == PLAYER_1 then
        self:queuecommand("Off")
      end;
      if param.Player == PLAYER_2 then
        self:queuecommand("Off")
      end;
    end;
  };
};

t[#t+1] = Def.ActorFrame {
  Name="Badges";
  LoadActor(THEME:GetPathG("","_sharedX2/P1 BADGE"))..{
    Name="P1 Badge";
    InitCommand=cmd(visible,false;x,SCREEN_LEFT+106;y,SCREEN_BOTTOM-116);
    OnCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
        self:visible(true)
      else
        self:visible(false)
      end;
      self:diffuse(color("0,0,0,0")):rotationz(90):linear(0.2):diffuse(color("1,1,1,1")):rotationz(0)
    end;
    OffCommand=cmd(smooth,0.2;diffusealpha,0;);
    PlayerJoinedMessageCommand=function(self)
      self:queuecommand("Off")
    end;
  };
  LoadActor(THEME:GetPathG("","_sharedX2/P2 BADGE"))..{
    Name="P2 Badge";
    InitCommand=cmd(visible,false;x,SCREEN_RIGHT-106;y,SCREEN_BOTTOM-116);
    OnCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
        self:visible(true)
      else
        self:visible(false)
      end;
      self:diffuse(color("0,0,0,0")):rotationz(-90):linear(0.2):diffuse(color("1,1,1,1")):rotationz(0)
    end;
    OffCommand=cmd(smooth,0.2;diffusealpha,0;);
    PlayerJoinedMessageCommand=function(self)
      self:queuecommand("Off")
    end;
  };
};

t[#t+1] = Def.ActorFrame{
  Def.Sprite{
    Name="P1 Messages";
    InitCommand=cmd(visible,false;x,SCREEN_LEFT+280;y,SCREEN_BOTTOM-80);
    OnCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
        self:visible(true):queuecommand("Set")
      else
        self:visible(false)
      end;
      self:diffuse(color("0,0,0,0")):zoomy(0):linear(0.2):diffuse(color("1,1,1,1")):zoomy(1)
    end;
    SetCommand=function(self)
      local GetP1 = GAMESTATE:IsPlayerEnabled(PLAYER_1);
      if GetP1 == true and GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 then
        self:visible(true)
        self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/P1here"));
      elseif GetP1 == false and GAMESTATE:PlayersCanJoin() and GAMESTATE:GetMasterPlayerNumber() == PLAYER_2 then
        self:visible(true)
        self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/P1CanJoin"));
      elseif GAMESTATE:GetNumPlayersEnabled() == 2 then
        self:visible(false)
      end;
    end;
    OffCommand=cmd(smooth,0.2;diffusealpha,0);
    PlayerJoinedMessageCommand=function(self)
      self:queuecommand("Off")
    end;
  };
  Def.Sprite{
    Name="P2 Messages";
    InitCommand=cmd(visible,false;x,SCREEN_RIGHT-280;y,SCREEN_BOTTOM-80);
    OnCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
        self:visible(true):queuecommand("Set")
      else
        self:visible(false)
      end;
      self:diffuse(color("0,0,0,0")):zoomy(0):linear(0.2):diffuse(color("1,1,1,1")):zoomy(1)
    end;
    SetCommand=function(self)
      local GetP2 = GAMESTATE:IsPlayerEnabled(PLAYER_2);
      if GetP2 == true and GAMESTATE:GetMasterPlayerNumber() == PLAYER_2 then
        self:visible(true)
        self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/P2here"));
      elseif GetP2 == false and GAMESTATE:PlayersCanJoin() and GAMESTATE:GetMasterPlayerNumber() == PLAYER_1 then
        self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/P2CanJoin"));
        self:visible(true)
      elseif GAMESTATE:GetNumPlayersEnabled() == 2 then
        self:visible(false)
      end;
    end;
    OffCommand=cmd(smooth,0.2;diffusealpha,0);
    PlayerJoinedMessageCommand=function(self)
      self:queuecommand("Off")
    end;
  };
};

t[#t+1] = Def.ActorFrame{
	--------------------- ARROW SELECTION -----------------------------
  LoadActor(THEME:GetPathG("","_sharedX2/_selectarrowg")) .. {
    InitCommand=cmd(draworder,200;horizalign,center;x,SCREEN_CENTER_X-360;y,SCREEN_CENTER_Y+174;zoomx,0.5;zoomy,0.5;diffusealpha,0);
    OnCommand=cmd(smooth,0.3;zoom,1;diffusealpha,1;);
    OffCommand=cmd(smooth,0.2;addx,-50;diffusealpha,0;);
    MenuLeftP1MessageCommand=cmd(smooth,0.1;addx,-20;smooth,0.1;addx,20;);
    MenuLeftP2MessageCommand=cmd(smooth,0.1;addx,-20;smooth,0.1;addx,20;);
  };
  LoadActor(THEME:GetPathG("","_sharedX2/_selectarrowg")) .. {
    InitCommand=cmd(draworder,200;horizalign,center;x,SCREEN_CENTER_X+182;y,SCREEN_CENTER_Y+174;zoomx,-0.5;zoomy,0.5;diffusealpha,0);
    OnCommand=cmd(smooth,0.3;zoomx,-1;zoomy,1;diffusealpha,1;);
    OffCommand=cmd(smooth,0.2;addx,50;diffusealpha,0;);
    MenuRightP1MessageCommand=cmd(smooth,0.1;addx,20;smooth,0.1;addx,-20;);
    MenuRightP2MessageCommand=cmd(smooth,0.1;addx,20;smooth,0.1;addx,-20;);
  };
  LoadActor(THEME:GetPathG("","_sharedX2/_selectarrowr")) .. {
    InitCommand=cmd(draworder,200;horizalign,center;x,SCREEN_CENTER_X-360;y,SCREEN_CENTER_Y+174;zoomx,0.5;zoomy,0.5;diffusealpha,0);
    OnCommand=cmd(smooth,0.3;zoom,1;diffusealpha,0;);
    OffCommand=cmd(smooth,0.2;addx,-50;diffusealpha,0;);
    MenuLeftP1MessageCommand=cmd(diffusealpha,1;smooth,0.1;addx,-20;smooth,0.1;addx,20;diffusealpha,0);
    MenuLeftP2MessageCommand=cmd(diffusealpha,1;smooth,0.1;addx,-20;smooth,0.1;addx,20;diffusealpha,0);
  };
  LoadActor(THEME:GetPathG("","_sharedX2/_selectarrowr")) .. {
    InitCommand=cmd(draworder,200;horizalign,center;x,SCREEN_CENTER_X+182;y,SCREEN_CENTER_Y+174;zoomx,-0.5;zoomy,0.5;diffusealpha,0);
    OnCommand=cmd(smooth,0.3;zoomx,-1;zoomy,1;diffusealpha,0;);
    OffCommand=cmd(smooth,0.2;addx,50;diffusealpha,0;);
    MenuRightP1MessageCommand=cmd(diffusealpha,1;smooth,0.1;addx,20;smooth,0.1;addx,-20;diffusealpha,0);
    MenuRightP2MessageCommand=cmd(diffusealpha,1;smooth,0.1;addx,20;smooth,0.1;addx,-20;diffusealpha,0);
  };
};

t[#t+1] = Def.Actor{
  PlayerJoinedMessageCommand=function(self)
    self:queuecommand("Delay1")
  end;
  Delay1Command=function(self)
    self:sleep(2)
    self:queuecommand("SetScreen")
  end;
  SetScreenCommand=function(self)
    SCREENMAN:GetTopScreen():SetNextScreenName("ScreenSelectPlayMode"):StartTransitioningScreen("SM_GoToNextScreen")
  end;
};



return t
