local t=Def.ActorFrame{};



t[#t+1] = Def.ActorFrame{
	OnCommand=function(self)
		self:spin()
		self:effectmagnitude(0,0,240)
	end;
	LoadActor( "normal grad" )..{
		OnCommand=function(self)
			self:diffusealpha(1)
			self:queuecommand("Tick")
		end;
		TickCommand=cmd(linear,0.05;zoom,1.1;linear,0.2;zoom,1;sleep,0.75;queuecommand,"Tick");
		OffCommand=cmd(stoptweening;);
	};
};

t[#t+1] = Def.ActorFrame{
	OnCommand=function(self)
		self:diffusealpha(1)
		self:queuecommand("Tick")
	end;
	TickCommand=cmd(linear,0.05;zoom,1.1;linear,0.2;zoom,1;sleep,0.75;queuecommand,"Tick");
	LoadActor("base");
	LoadActor("mid ring");
};

t[#t+1] = Def.ActorFrame{
	OnCommand=function(self)
		self:spin()
		self:effectmagnitude(0,0,-180)
	end;
	LoadActor( "numbers" )..{
		OnCommand=function(self)
			self:diffusealpha(1)
			self:queuecommand("Tick")
		end;
		TickCommand=cmd(linear,0.05;zoom,1.1;linear,0.2;zoom,1;sleep,0.75;queuecommand,"Tick");
		OffCommand=cmd(stoptweening;);
	};
};

t[#t+1] = Def.ActorFrame{
	OnCommand=function(self)
		self:diffusealpha(1)
		self:queuecommand("Tick")
	end;
	TickCommand=cmd(linear,0.05;zoom,1.1;linear,0.2;zoom,1;sleep,0.75;queuecommand,"Tick");
	LoadActor("shine");
};

t[#t+1] = Def.ActorFrame{
	OnCommand=function(self)
		self:queuecommand("Tick")
	end;
	TickCommand=cmd(diffusealpha,1;zoom,1;linear,0.4;zoom,1.2;linear,0.1;diffusealpha,0;sleep,0.5;queuecommand,"Tick");
	LoadActor("normal fade.png");
};

t[#t+1] = Def.ActorFrame{
	OnCommand=function(self)
		self:diffusealpha(1)
		self:queuecommand("Tick")
	end;
	TickCommand=cmd(diffusealpha,0.5;zoom,1;linear,0.4;zoom,1.3;linear,0.1;diffusealpha,0;sleep,0.5;queuecommand,"Tick");
	LoadActor("normal fade circle.png");
};

return t;
