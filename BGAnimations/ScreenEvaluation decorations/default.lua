local t = LoadFallbackB();
t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay");
t[#t+1] = StandardDecorationFromFileOptional("SongInformation","SongInformation") .. {
	BeginCommand=function(self)
		local SongOrCourse;
		if GAMESTATE:GetCurrentSong() then
			SongOrCourse = GAMESTATE:GetCurrentSong();
		elseif GAMESTATE:GetCurrentCourse() then
			SongOrCourse = GAMESTATE:GetCurrentCourse();
		else
			return
		end

	end;
	SetCommand=function(self)
		local c = self:GetChildren();
		local SongOrCourse;
		if GAMESTATE:GetCurrentSong() then
			SongOrCourse = GAMESTATE:GetCurrentSong();

			c.TextTitle:settext( SongOrCourse:GetDisplayMainTitle() or nil );
			c.TextSubtitle:settext( SongOrCourse:GetDisplaySubTitle() or nil );
			c.TextArtist:settext( SongOrCourse:GetDisplayArtist() or nil );

			if SongOrCourse:GetDisplaySubTitle() == "" then
				c.TextTitle:visible(true);
				c.TextTitle:y(-16.5/2);
				c.TextTitle:strokecolor(color("1,1,1,1"));
				c.TextTitle:diffuse(color("0,0,0,1"));
				c.TextSubtitle:visible(false);
				c.TextSubtitle:y(0);
				c.TextArtist:visible(true);
				c.TextArtist:y(40/2);
				c.TextArtist:strokecolor(color("1,1,1,1"));
				c.TextArtist:diffuse(color("0,0,0,1"));
			else
				c.TextTitle:visible(true);
				c.TextTitle:y(-16.5);
				c.TextTitle:strokecolor(color("1,1,1,1"));
				c.TextTitle:diffuse(color("0,0,0,1"));
				c.TextSubtitle:visible(true);
				c.TextSubtitle:y(0);
				c.TextArtist:visible(true);
				c.TextArtist:y(20);
				c.TextArtist:strokecolor(color("1,1,1,1"));
				c.TextArtist:diffuse(color("0,0,0,1"));
			end
-- 			self:playcommand("Tick");
		elseif GAMESTATE:GetCurrentCourse() then
			SongOrCourse = GAMESTATE:GetCurrentCourse();

			c.TextTitle:settext( SongOrCourse:GetDisplayMainTitle() or nil );
			c.TextSubtitle:settext( SongOrCourse:GetDisplaySubTitle() or nil );
			c.TextArtist:settext( SongOrCourse:GetDisplayArtist() or nil );

-- 			self:playcommand("Tick");
		else
			SongOrCourse = nil;

			c.TextTitle:settext("");
			c.TextSubtitle:settext("");
			c.TextArtist:settext("");

			self:playcommand("Hide")
		end
	end;
-- 	OnCommand=cmd(playcommand,"Set");
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	DisplayLanguageChangedMessageCommand=cmd(playcommand,"Set");

};

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = LoadActor("grade", pn)
end

t[#t+1] = LoadActor("jacket frame")..{
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-180;zoomy,0;diffusealpha,0.8;sleep,0.000;);
	OnCommand=cmd(sleep,0.333;decelerate,0.133;diffusealpha,0.8;accelerate,0.033;zoomy,1.07;zoomx,1.07;decelerate,0.033;zoomx,1;zoomy,1);
	OffCommand=cmd(sleep,0.0000;sleep,0.333;decelerate,0.066;zoom,1.05;diffusealpha,0);
};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-64);
	OnCommand=cmd(zoomy,0;sleep,0.333;linear,0.2;zoomy,1);
	OffCommand=cmd(sleep,0.2;linear,0.2;zoomy,0);
	LoadActor("judgement frame")..{
		InitCommand=cmd(valign,0);
	};
	LoadActor("judgement lines")..{
		InitCommand=cmd(valign,0;addy,30);
	};
};

local xPosPlayer = {
    P1 = (SCREEN_CENTER_X-348),
    P2 = (SCREEN_CENTER_X+348)
};

local DiffToInd = {
	['Difficulty_Beginner'] = 0;
	['Difficulty_Easy'] = 1;
	['Difficulty_Medium'] = 2;
	['Difficulty_Hard'] = 3;
	['Difficulty_Challenge'] = 4;
};

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
	t[#t+1] = Def.ActorFrame{
		LoadActor("player indent")..{
			InitCommand=function(self)
				local short = ToEnumShortString(pn)
				self:x(xPosPlayer[short]):y(SCREEN_CENTER_Y-30)
			end,
			OnCommand=cmd(zoomy,0;sleep,0.7;linear,0.2;zoomy,1);
			OffCommand=cmd(linear,0.2;zoomy,0);
		};
		Def.Sprite{
			InitCommand=function(self)
				self:Load(THEME:GetPathB("","ScreenEvaluationSummary decorations/Player 1x2"));
				self:pause():setstate(pn=="PlayerNumber_P2" and 1 or 0)
				self:x(pn=="PlayerNumber_P2" and _screen.cx+374 or _screen.cx-326):y(_screen.cy-42)
			end;
			OnCommand=cmd(zoomy,0;sleep,1;linear,0.2;zoomy,1);
			OffCommand=cmd(linear,0.2;zoomy,0);
		};
		Def.Sprite{
			InitCommand=function(self)
				if pn==PLAYER_1 then
					self:Load(THEME:GetPathG("","_sharedX2/P1 BADGE"))
				else
					self:Load(THEME:GetPathG("","_sharedX2/P2 BADGE"))
				end;
				self:x(pn=="PlayerNumber_P2" and _screen.cx+276 or _screen.cx-420):y(_screen.cy-32)
			end;
			OnCommand=cmd(diffusealpha,0;rotationz,90;sleep,1;linear,0.2;rotationz,0;diffusealpha,1);
			OffCommand=cmd(linear,0.2;rotationz,90;diffusealpha,0);
		};
		Def.Sprite{
			Texture="Diff 1x5";
			InitCommand=function(self)
				self:pause()
				self:x(pn=="PlayerNumber_P2" and _screen.cx+388 or _screen.cx-309):y(_screen.cy-20)
				local song = GAMESTATE:GetCurrentSong()
				local steps = GAMESTATE:GetCurrentSteps(pn):GetDifficulty()
				if song then
					self:setstate(DiffToInd[steps])
				end
			end;
			OnCommand=cmd(diffusealpha,0;zoomy,0;sleep,1.05;linear,0.2;zoomy,1;diffusealpha,1);
			OffCommand=cmd(linear,0.2;zoomy,0);
		};
	};
end

t[#t+1] = LoadActor("../grade")..{
	OnCommand=cmd(play);
};

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(xy,SCREEN_CENTER_X-180,SCREEN_CENTER_Y-180);
	Def.Sprite {
		OnCommand=function(self)
			if not GAMESTATE:IsCourseMode() then
				local song = GAMESTATE:GetCurrentSong();
				if song:HasJacket() then
					self:LoadBackground(song:GetJacketPath());
				elseif song:HasBackground() then
					self:LoadFromSongBackground(GAMESTATE:GetCurrentSong());
				else
					self:Load(THEME:GetPathG("","Common fallback jacket"));
				end;
				self:scaletoclipped( 102,102 );
				(cmd(zoomy,0;diffusealpha,0.8;sleep,0.333;decelerate,0.133;zoomy,1;diffusealpha,1;accelerate,0.033;zoomx,1.06;decelerate,0.033;zoomx,1))(self);
			else
				local course = GAMESTATE:GetCurrentCourse();
				if course:HasBanner() then
					self:LoadBackground(course:GetBannerPath());
				end;
				self:scaletoclipped( 102,102 );
				(cmd(zoomy,0;diffusealpha,0.8;sleep,0.333;decelerate,0.133;zoomy,1;diffusealpha,1;accelerate,0.033;zoomx,1.06;decelerate,0.033;zoomx,1))(self);
			end
		end;
		OffCommand=cmd(sleep,0.333;decelerate,0.066;zoom,1.05;diffusealpha,0);
	};
};

t[#t+1] = Def.ActorFrame {
	Condition=GAMESTATE:HasEarnedExtraStage() and GAMESTATE:IsExtraStage() and not GAMESTATE:IsExtraStage2();
	InitCommand=cmd(draworder,105);
	LoadActor( THEME:GetPathS("ScreenEvaluation","try Extra1" ) ) .. {
		Condition=THEME:GetMetric( Var "LoadingScreen","Summary" ) == false;
		OnCommand=cmd(play);
	};
};
--StatsP1--
t[#t+1] = LoadActor("statsP1")..{
	InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_1);addy,0;zoom,1;x,SCREEN_CENTER_X-100;diffusealpha,0);
	OffCommand=cmd(sleep,0.0;linear,0.2;diffusealpha,0);
	OnCommand=function(self)
		self:sleep(0.7)
			self:diffusealpha(1);
	end;
	};
--StatsP2--
t[#t+1] = LoadActor("statsP2")..{
	InitCommand=cmd(visible,GAMESTATE:IsHumanPlayer(PLAYER_2);addy,0;zoom,1;x,SCREEN_CENTER_X+175;diffusealpha,0);
	OffCommand=cmd(sleep,0.0;linear,0.2;diffusealpha,0);
	OnCommand=function(self)
		self:sleep(0.7)
			self:diffusealpha(1);
	end;
	};

	t[#t+1] = Def.ActorFrame{
		LoadActor("score")..{
			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+228);
			OnCommand=cmd(zoomy,0;sleep,0.8;linear,0.2;zoomy,1);
			OffCommand=cmd(linear,0.2;zoomy,0);
		};
		Def.RollingNumbers {
			File = THEME:GetPathF("_sveningsson Bold", "60px");
			InitCommand=cmd(diffuse,Color("Yellow");strokecolor,color("#463e00");x,SCREEN_CENTER_X-340;y,SCREEN_CENTER_Y+228;zoomx,0.55;zoomy,0.4;player,PLAYER_1;playcommand,"Set");
			SetCommand = function(self)
				local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetScore();
				self:Load("RollingNumbersSumm");
				self:targetnumber(score);
			end;
			OnCommand=cmd(diffusealpha,0;sleep,1;diffusealpha,1);
			OffCommand=cmd(sleep,0.067;zoom,0);
		};
		Def.RollingNumbers {
			File = THEME:GetPathF("_sveningsson Bold", "60px");
			InitCommand=cmd(diffuse,Color("Yellow");strokecolor,color("#463e00");x,SCREEN_CENTER_X+340;y,SCREEN_CENTER_Y+228;zoomx,0.55;zoomy,0.4;player,PLAYER_2;playcommand,"Set");
			SetCommand = function(self)
				local score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_2):GetScore();
				self:Load("RollingNumbersSumm");
				self:targetnumber(score);
			end;
			OnCommand=cmd(diffusealpha,0;sleep,1;diffusealpha,1);
			OffCommand=cmd(sleep,0.067;zoom,0);
		};
	};

return t
