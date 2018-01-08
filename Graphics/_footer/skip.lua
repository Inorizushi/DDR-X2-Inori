local t = Def.ActorFrame{
  InitCommand=cmd(y,-10);
  LoadActor("skip.png")..{
    InitCommand=cmd(x,SCREEN_CENTER_X);
  };
};

return t;
