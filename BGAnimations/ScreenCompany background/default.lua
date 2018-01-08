local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("1,1,1,1"));
	};
};
t[#t+1] = Def.ActorFrame{
	LoadActor("sound")..{
		OnCommand=cmd(queuecommand,"Play");
		PlayCommand=cmd(play);
	};
	LoadActor("Konami")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(diffusealpha,0;linear,0.5;diffusealpha,1;sleep,5;linear,0.5;diffusealpha,0);
	};
	LoadActor("Bemani")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(diffusealpha,0;sleep,6.6;linear,0.5;diffusealpha,1;sleep,5;linear,0.5;diffusealpha,0);
	};
	LoadActor("EAmuse")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(diffusealpha,0;sleep,12.6;linear,0.5;diffusealpha,1;sleep,5;linear,0.5;diffusealpha,0);
	};
	LoadActor("RSA")..{
		InitCommand=cmd(Center);
		OnCommand=cmd(diffusealpha,0;sleep,18.6;linear,0.5;diffusealpha,1;sleep,5;linear,0.5;diffusealpha,0);
	};
};
return t;
