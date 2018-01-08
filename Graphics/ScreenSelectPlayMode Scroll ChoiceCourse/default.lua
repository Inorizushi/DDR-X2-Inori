local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(addx,-SCREEN_WIDTH*2.5;sleep,0.5;smooth,0.3;addx,SCREEN_WIDTH*2.5);
	OffCommand=cmd(sleep,0.116;linear,0.066;zoomy,0;zoomx,5;diffusealpha,0);
	GainFocusCommand=cmd(finishtweening;linear,0.2;y,0;zoom,1);
	LoseFocusCommand=cmd(finishtweening;linear,0.2;y,72;zoom,0.92);
	-- Information panel
	LoadActor("base.png")..{
		InitCommand=cmd(addy,-40;);
		GainFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceCourse/base.png")) end;
		LoseFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceCourse/base dark.png")) end;
	};
	LoadActor("char.png")..{
		InitCommand=cmd(addy,-88;addx,14);
		GainFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceCourse/char.png")) end;
		LoseFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceCourse/char dark.png")) end;
	};
	Def.ActorFrame{
		InitCommand=cmd(addy,186;);
		LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/infomid.png"))..{
			InitCommand=cmd(zoom,0.95;diffusealpha,0.5);
		};
		Def.Sprite{
			InitCommand=cmd(diffusealpha,1;xy,-36,14);
			GainFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceCourse/text.png")) end;
			LoseFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceCourse/text dark.png")) end;
		};
		LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/infotop.png"))..{
			InitCommand=cmd(y,-56;diffusealpha,1);
		};
		LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/infobottom.png"))..{
			InitCommand=cmd(y,66);
		};
		Def.Sprite{
			InitCommand=cmd(x,20;y,-54;diffusealpha,1);
			GainFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceCourse/title.png")) end;
			LoseFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceCourse/title dark.png")) end;
		};
		Def.Sprite{
			Texture="course 1x7.png";
      InitCommand=cmd(pause;SetAllStateDelays,0.2;x,-184;y,-54;diffusealpha,0);
      GainFocusCommand=cmd(play;diffusealpha,1);
      LoseFocusCommand=cmd(pause;setstate,0;diffusealpha,0);
    };
    LoadActor("course icon off.png")..{
      InitCommand=cmd(x,-184;y,-54;diffusealpha,1);
      OnCommand=cmd(diffusealpha,0;sleep,0.2;smooth,0.2;diffusealpha,1);
      GainFocusCommand=cmd(diffusealpha,0);
      LoseFocusCommand=cmd(diffusealpha,1);
    };
	};
};

return t;
