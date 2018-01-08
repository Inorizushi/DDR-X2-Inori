local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(CenterY);
  LoadActor("DoorStage01")..{
    InitCommand=cmd(halign,0;x,SCREEN_LEFT);
	  OnCommand=cmd(x,SCREEN_LEFT;linear,0.25;x,SCREEN_LEFT-658);
	};
  LoadActor("DoorStage02")..{
    InitCommand=cmd(halign,1;x,SCREEN_RIGHT);
    OnCommand=cmd(x,SCREEN_RIGHT;linear,0.25;x,SCREEN_RIGHT+658);
  };
};

return t
