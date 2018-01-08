local t = Def.ActorFrame{
		-- Def.Quad{
		-- InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0"));
		-- OnCommand=cmd(linear,5;diffusealpha,1);
	-- };

	-- Cleared song --
    LoadActor("../ClearedSong.mp3") .. {
		StartTransitioningCommand=cmd(sleep,0.2;queuecommand,"Play");
    PlayCommand=cmd(play);
	};
};

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(CenterY);
  LoadActor("../DoorStage01")..{
    InitCommand=cmd(halign,0;x,SCREEN_LEFT);
	  OnCommand=cmd(x,SCREEN_LEFT-658;sleep,2;linear,1;x,SCREEN_LEFT);
	};
  LoadActor("../DoorStage02")..{
    InitCommand=cmd(halign,1;x,SCREEN_RIGHT);
    OnCommand=cmd(x,SCREEN_RIGHT+658;sleep,2;linear,1;x,SCREEN_RIGHT);
  };
};
	--------CLEARED-----------
t[#t+1] = Def.ActorFrame{
--Cleared--
	LoadActor("Cleared") .. {
	InitCommand=function(self)
		local Song;
		if GAMESTATE:IsCourseMode() then
			song = GAMESTATE:GetCurrentCourse();
		else
			song = GAMESTATE:GetCurrentSong();
		end;
		self:x(SCREEN_CENTER_X);
		self:y(SCREEN_CENTER_Y);
			if song:GetDisplayFullTitle() == "Tohoku EVOLVED" then
				self:visible(false);
			else
				self:visible(true);
		end;
	end;
	};
--tohoku--
	LoadActor("Tohoku") .. {
	InitCommand=function(self)
	if not GAMESTATE:IsCourseMode() then
		local song = GAMESTATE:GetCurrentSong();
		self:x(SCREEN_CENTER_X);
		self:y(SCREEN_CENTER_Y);
			if song:GetDisplayFullTitle() == "Tohoku EVOLVED" then
				self:visible(true);
			else
				self:visible(false);
		end;
	else
		self:diffusealpha(0);
	end;
	end;
	};

};

return t;
