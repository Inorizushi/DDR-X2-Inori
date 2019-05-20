local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(xy,SCREEN_CENTER_X+244,SCREEN_CENTER_Y-8);
  Def.ActorFrame{
    LoadActor(THEME:GetPathG("","_sharedX2/SelectStyle/infomiddle"))..{
      OffCommand=cmd(smooth,0.2;zoomy,0;diffusealpha,0);
      GainFocusCommand=function(self)
        setenv("SelDoub",1)
        self:finishtweening():diffusealpha(0):zoomy(0):sleep(0.2):smooth(0.1):zoomy(1.5):diffusealpha(1):smooth(0.05):zoomy(1)
      end;
      LoseFocusCommand=function(self)
        setenv("SelDoub",0)
        self:finishtweening():queuecommand("Off")
      end;
    };
    LoadActor("text")..{
      InitCommand=cmd(x,-42;y,-25);
      OffCommand=cmd(smooth,0.1;diffusealpha,0);
      GainFocusCommand=cmd(finishtweening;diffusealpha,0;sleep,0.1;smooth,0.2;diffusealpha,1);
      LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
    };
    LoadActor("pad")..{
      InitCommand=cmd(xy,166,34);
      OffCommand=cmd(smooth,0.1;diffusealpha,0);
      GainFocusCommand=cmd(finishtweening;diffusealpha,0;sleep,0.1;smooth,0.2;diffusealpha,1);
      LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
    };
  };
  Def.ActorFrame{
    InitCommand=cmd(y,-94);
    OffCommand=cmd(smooth,0.2;y,0;diffusealpha,0);
    GainFocusCommand=cmd(finishtweening;diffusealpha,0;y,0;sleep,0.1;smooth,0.2;y,-100;diffusealpha,1;smooth,0.05;y,-94);
    LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
    LoadActor(THEME:GetPathG("","_sharedX2/SelectStyle/infotop"));
    LoadActor("title")..{
      InitCommand=cmd(x,1;y,3);
    };
  };
  LoadActor(THEME:GetPathG("","_sharedX2/SelectStyle/infobottom"))..{
    InitCommand=cmd(y,86);
    OffCommand=cmd(smooth,0.2;y,0;diffusealpha,0);
    GainFocusCommand=cmd(finishtweening;diffusealpha,0;y,0;sleep,0.1;smooth,0.2;y,100;diffusealpha,1;smooth,0.05;y,86);
    LoseFocusCommand=cmd(finishtweening;queuecommand,"Off");
  };
};

return t;
