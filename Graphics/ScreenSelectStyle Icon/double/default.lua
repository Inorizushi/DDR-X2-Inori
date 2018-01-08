local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(xy,SCREEN_CENTER_X+244,SCREEN_CENTER_Y-8);
  Def.ActorFrame{
    LoadActor(THEME:GetPathG("","_sharedX2/SelectStyle/infomiddle"))..{
      OnCommand=function(self)
        if GAMESTATE:GetNumPlayersEnabled() == 2 then
          self:queuecommand("On2");
        else
          self:diffusealpha(0);
        end;
      end;
      On2Command=cmd(diffusealpha,0;zoomy,0;sleep,0.5;smooth,0.2;zoomy,1;diffusealpha,1);
      OffCommand=cmd(smooth,0.2;zoomy,0;diffusealpha,0);
      GainFocusCommand=cmd(finishtweening;diffusealpha,0;zoomy,0;smooth,0.2;zoomy,1;diffusealpha,1);
      LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
    };
    LoadActor("text")..{
      InitCommand=cmd(x,-42;y,-25);
      OnCommand=function(self)
        if GAMESTATE:GetNumPlayersEnabled() == 2 then
          self:queuecommand("On2");
        else
          self:diffusealpha(0);
        end;
      end;
      On2Command=cmd(diffusealpha,0;sleep,0.55;smooth,0.2;diffusealpha,1);
      OffCommand=cmd(smooth,0.1;diffusealpha,0);
      GainFocusCommand=cmd(finishtweening;diffusealpha,0;sleep,0.1;smooth,0.2;diffusealpha,1);
      LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
    };
    LoadActor("pad")..{
      InitCommand=cmd(xy,166,34);
      OnCommand=function(self)
        if GAMESTATE:GetNumPlayersEnabled() == 2 then
          self:queuecommand("On2");
        else
          self:diffusealpha(0);
        end;
      end;
      On2Command=cmd(diffusealpha,0;sleep,0.55;smooth,0.2;diffusealpha,1);
      OffCommand=cmd(smooth,0.1;diffusealpha,0);
      GainFocusCommand=cmd(finishtweening;diffusealpha,0;sleep,0.1;smooth,0.2;diffusealpha,1);
      LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
    };
  };
  Def.ActorFrame{
    InitCommand=cmd(y,-94);
    OnCommand=function(self)
      if GAMESTATE:GetNumPlayersEnabled() == 2 then
        self:queuecommand("On2");
      else
        self:diffusealpha(0);
      end;
    end;
    On2Command=cmd(diffusealpha,0;y,0;sleep,0.5;smooth,0.2;y,-94;diffusealpha,1);
    OffCommand=cmd(smooth,0.2;y,0;diffusealpha,0);
    GainFocusCommand=cmd(finishtweening;diffusealpha,0;y,0;smooth,0.2;y,-94;diffusealpha,1);
    LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
    LoadActor(THEME:GetPathG("","_sharedX2/SelectStyle/infotop"));
    LoadActor("title")..{
      InitCommand=cmd(x,1;y,3);
    };
  };
  LoadActor(THEME:GetPathG("","_sharedX2/SelectStyle/infobottom"))..{
    InitCommand=cmd(y,86);
    OnCommand=function(self)
      if GAMESTATE:GetNumPlayersEnabled() == 2 then
        self:queuecommand("On2");
      else
        self:diffusealpha(0);
      end;
    end;
    On2Command=cmd(diffusealpha,0;y,0;sleep,0.5;smooth,0.2;y,86;diffusealpha,1);
    OffCommand=cmd(smooth,0.2;y,0;diffusealpha,0);
    GainFocusCommand=cmd(finishtweening;diffusealpha,0;y,0;smooth,0.2;y,86;diffusealpha,1);
    LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
  };
};

return t;
