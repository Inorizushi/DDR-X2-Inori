local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  Name="Frames";
  LoadActor("Frame")..{
    Name="P1 Frame";
    InitCommand=cmd(x,SCREEN_LEFT;y,SCREEN_BOTTOM-80;halign,1;zoomx,-1);
    AnimCommand=function(self)
      self:finishtweening():linear(0.2):diffusealpha(0):zoomy(0):linear(0.2):diffusealpha(1):zoomy(1)
    end;
    OnCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
        self:diffusealpha(0):zoomy(0):linear(0.2):diffusealpha(1):zoomy(1)
      else
        self:diffusealpha(0)
      end;
    end;
    SetCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_1) ~= true then
        if getenv("SelVers") == 1 then
          self:queuecommand("Anim")
        else
          self:finishtweening():linear(0.2):diffusealpha(0):zoomy(0)
        end;
      else
        self:queuecommand("Anim")
      end;
    end;
    OffCommand=cmd(smooth,0.2;diffusealpha,0;);
    MenuLeftP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuRightP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuUpP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuDownP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuLeftP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuRightP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuUpP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuDownP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
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
    AnimCommand=function(self)
      self:finishtweening():linear(0.2):diffusealpha(0):zoomy(0):linear(0.2):diffusealpha(1):zoomy(1)
    end;
    OnCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
        self:diffusealpha(0):zoomy(0):linear(0.2):diffusealpha(1):zoomy(1)
      else
        self:diffusealpha(0)
      end;
    end;
    SetCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_2) ~= true then
        if getenv("SelVers") == 1 then
          self:queuecommand("Anim")
        else
          self:finishtweening():linear(0.2):diffusealpha(0):zoomy(0)
        end;
      else
        self:queuecommand("Anim")
      end;
    end;
    OffCommand=cmd(smooth,0.2;diffusealpha,0;);
    MenuLeftP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuRightP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuUpP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuDownP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuLeftP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuRightP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuUpP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuDownP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
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
    InitCommand=cmd(diffusealpha,0;x,SCREEN_LEFT+106;y,SCREEN_BOTTOM-116;rotationz,90);
    OnCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
        self:linear(0.2)
        self:diffusealpha(1)
        self:rotationz(0)
      else
        self:diffusealpha(0)
      end;
    end;
    SetCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_1) ~= true then
        if getenv("SelVers") == 1 then
          self:linear(0.2):diffuse(color("1,1,1,1")):rotationz(0)
        else
          self:finishtweening():linear(0.2):diffusealpha(0):rotationz(90)
        end;
      end;
    end;
    OffCommand=cmd(smooth,0.2;diffusealpha,0;);
    MenuLeftP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuRightP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuUpP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuDownP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuLeftP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuRightP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuUpP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuDownP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    PlayerJoinedMessageCommand=function(self)
      self:queuecommand("Off")
    end;
  };
  LoadActor(THEME:GetPathG("","_sharedX2/P2 BADGE"))..{
    Name="P2 Badge";
    InitCommand=cmd(diffusealpha,0;x,SCREEN_RIGHT-106;y,SCREEN_BOTTOM-116;rotationz,-90);
    OnCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
        self:linear(0.2)
        self:diffusealpha(1)
        self:rotationz(0)
      else
        self:diffusealpha(0)
      end;
    end;
    SetCommand=function(self)
      if GAMESTATE:IsPlayerEnabled(PLAYER_2) ~= true then
        if getenv("SelVers") == 1 then
          self:linear(0.2):diffuse(color("1,1,1,1")):rotationz(0)
        else
          self:finishtweening():linear(0.2):diffusealpha(0):rotationz(-90)
        end;
      end;
    end;
    OffCommand=cmd(smooth,0.2;diffusealpha,0;);
    MenuLeftP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuRightP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuUpP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuDownP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuLeftP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuRightP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuUpP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuDownP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    PlayerJoinedMessageCommand=function(self)
      self:queuecommand("Off")
    end;
  };
};

t[#t+1] = Def.ActorFrame{
  Def.Sprite{
    Name="P1 Messages";
    InitCommand=cmd(visible,false;x,SCREEN_LEFT+280;y,SCREEN_BOTTOM-80);
    Anim1Command=function(self)
      self:finishtweening():linear(0.2):diffusealpha(0):zoomy(0)
    end;
    Anim2Command=function(self)
      self:linear(0.2):diffusealpha(1):zoomy(1)
    end;
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
      local GetP2 = GAMESTATE:IsPlayerEnabled(PLAYER_2);
      local mp = GAMESTATE:GetMasterPlayerNumber()
      if GetP1 == true and mp == PLAYER_1 then
        self:visible(true)
        if getenv("SelSing") == 1 then
          self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/text/P1here"));
        elseif getenv("SelVers") == 1 then
          if GAMESTATE:GetNumPlayersEnabled() ~= 2 then
            self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/text/P1 2P only.png"));
          else
            self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/text/P1here.png"));
          end;
        elseif getenv("SelDoub") == 1 then
            self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/text/P1here.png"));
        end;
      elseif GetP2 == true and GetP1 == false and mp == PLAYER_2 then
        if getenv("SelVers") == 1 then
          if GAMESTATE:GetCoins() ~= GAMESTATE:GetCoinsNeededToJoin() then
            self:visible(true)
            self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/text/credit.png"));
          else
            self:visible(true)
            self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/text/P1CanJoin.png"));
          end;
        else
          self:visible(false)
        end;
      elseif GAMESTATE:GetNumPlayersEnabled() == 2 then
        self:visible(false)
      end;
    end;
    MenuLeftP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuRightP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuLeftP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuRightP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    OffCommand=cmd(smooth,0.2;diffusealpha,0);
    CoinsChangedMessageCommand=function(self)
      self:queuecommand("Set");
    end;
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
      local GetP1 = GAMESTATE:IsPlayerEnabled(PLAYER_1);
      local GetP2 = GAMESTATE:IsPlayerEnabled(PLAYER_2);
      local mp = GAMESTATE:GetMasterPlayerNumber()
      if GetP2 == true then
        self:visible(true)
        if getenv("SelSing") == 1 then
          self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/text/P2here"));
        elseif getenv("SelVers") == 1 then
          if GAMESTATE:GetNumPlayersEnabled() ~= 2 then
            self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/text/P2 2P only.png"));
          else
            self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/text/P2here.png"));
          end;
        elseif getenv("SelDoub") == 1 then
            self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/text/P2here.png"));
        end;
      elseif GetP1 == true and GetP2 == false then
        if getenv("SelVers") == 1 then
          if GAMESTATE:GetCoins() ~= GAMESTATE:GetCoinsNeededToJoin() then
            self:visible(true)
            self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/text/credit.png"));
          else
            self:visible(true)
            self:Load(THEME:GetPathB("","ScreenSelectStyle overlay/text/P2CanJoin.png"));
          end;
        else
          self:visible(false)
        end;
      elseif GAMESTATE:GetNumPlayersEnabled() == 2 then
        self:visible(false)
      end;
    end;
    MenuLeftP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuRightP1MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuLeftP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    MenuRightP2MessageCommand=function(self)
      self:queuecommand("Set")
    end;
    OffCommand=cmd(smooth,0.2;diffusealpha,0);
    CoinsChangedMessageCommand=function(self)
      self:queuecommand("Set");
    end;
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
