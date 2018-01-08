local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  GainFocusCommand=cmd(stoptweening;smooth,0.3;y,0;zoom,1);
  LoseFocusCommand=cmd(stoptweening;smooth,0.3;y,70;zoom,1);
  Def.ActorFrame{
    InitCommand=cmd(x,-2;y,127);
    OnCommand=cmd(zoom,0;sleep,0.5;linear,0.1;diffusealpha,1.0;zoom,1;smooth,0.1;zoom,0.9;smooth,0.1;zoom,1);
    LoadActor("offPad.png")..{
      OffCommand=cmd(smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
    };
    LoadActor("Pad.png")..{
      OffCommand=cmd(smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
      GainFocusCommand=cmd(smooth,0.3;diffusealpha,1;diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0");effectperiod,2);
      LoseFocusCommand=cmd(diffusealpha,0;stopeffect);
    };
  };
  LoadActor("Character") .. {
    InitCommand=cmd(diffusealpha,0;zoomx,1;x,-10;y,6);
    OffCommand=cmd(smooth,0.2;zoom,0;diffuse,color("0,0,0,0");diffusealpha,0);
    OnCommand=cmd(sleep,0.6;linear,0.1;diffusealpha,1;zoomy,0.8;linear,0.1;zoomy,1;zoomx,1.2;linear,0.1;zoomx,1);
  };
};



t[#t+1] = Def.ActorFrame{
  LoadActor("title small")..{
    InitCommand=cmd(diffusealpha,0;x,175;y,-190;zoom,1.75);
    MenuLeftP1MessageCommand=cmd(playcommand,"Change1");
    MenuLeftP2MessageCommand=cmd(playcommand,"Change1");
    MenuRightP1MessageCommand=cmd(playcommand,"Change1");
    MenuRightP2MessageCommand=cmd(playcommand,"Change1");
    MenuUpP1MessageCommand=cmd(playcommand,"Change1");
    MenuUpP2MessageCommand=cmd(playcommand,"Change1");
    MenuDownP1MessageCommand=cmd(playcommand,"Change1");
    MenuDownP2MessageCommand=cmd(playcommand,"Change1");
    OnCommand=function(self)
      if GAMESTATE:GetNumPlayersEnabled() == 1 then
        self:playcommand("Change1")
      else return end
    end;
    Change1Command=function(self)
      local env = GAMESTATE:Env()
      if env.VERSUSSELECT then
        self:queuecommand("GainFocus")
      else
        self:finishtweening():linear(0.1):cropright(1):sleep(0.3):queuecommand("Change2")
      end;
    end;
    Change2Command=cmd(zoomy,1.75;cropright,1;diffusealpha,1;linear,0.2;cropright,0;queuecommand,"Animate");
    GainFocusCommand=function(self)
      local env = GAMESTATE:Env()
      env.VERSUSSELECT = true
      self:stoptweening():linear(0.1):zoomy(0)
    end;
    LoseFocusCommand=function(self)
      local env = GAMESTATE:Env()
      env.VERSUSSELECT = false
    end;
    AnimateCommand=cmd(linear,0.1;rotationz,3;linear,0.1;rotationz,-3;linear,0.1;rotationz,3;linear,0.1;rotationz,-3;linear,0.1;rotationz,0;sleep,1;queuecommand,"Animate");
    OffCommand=cmd(stoptweening;smooth,0.2;zoom,0;diffusealpha,0;);
  };
};

return t;
