local t = LoadFallbackB()

t[#t+1] = Def.ActorFrame{
	LoadActor(THEME:GetPathS("","_swoosh out.ogg"))..{
		OffCommand=cmd(play)
	};
}

return t
