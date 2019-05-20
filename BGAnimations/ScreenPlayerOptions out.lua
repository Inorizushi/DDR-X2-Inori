local t = Def.ActorFrame{
  Def.Actor{
    OnCommand=cmd(sleep,1)
  };
};

return t;
