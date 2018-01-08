return Def.ActorFrame{
  LoadActor("base")..{
    InitCommand=cmd(Center;visible,false);
  }
}
