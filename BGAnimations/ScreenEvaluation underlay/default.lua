return Def.ActorFrame{
  LoadActor("base")..{
    InitCommand=cmd(FullScreen;diffusealpha,0)
  };
};
