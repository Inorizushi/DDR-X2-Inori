local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(addx,-SCREEN_WIDTH*2.5;sleep,0.5;smooth,0.3;addx,SCREEN_WIDTH*2.5);
	OffCommand=cmd(sleep,0.116;linear,0.066;zoomy,0;zoomx,5;diffusealpha,0);
	GainFocusCommand=cmd(finishtweening;linear,0.2;y,0;zoom,1);
	LoseFocusCommand=cmd(finishtweening;linear,0.2;y,72;zoom,0.92);
	-- Information panel
	LoadActor("base.png")..{
		InitCommand=cmd(addy,-38;);
		GainFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/base.png")) end;
		LoseFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/base dark.png")) end;
	};
	LoadActor("char.png")..{
		InitCommand=cmd(addy,-80;addx,-21);
		GainFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/char.png")) end;
		LoseFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/char dark.png")) end;
	};
	Def.ActorFrame{
		InitCommand=cmd(addy,186;);
		LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/infomid.png"))..{
			InitCommand=cmd(zoom,0.95;diffusealpha,0.5);
		};
		Def.Sprite{
			InitCommand=cmd(diffusealpha,1;xy,-14,14);
			GainFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/text.png")) end;
			LoseFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/text dark.png")) end;
		};
		LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/infotop.png"))..{
			InitCommand=cmd(y,-56;diffusealpha,1);
		};
		LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/infobottom.png"))..{
			InitCommand=cmd(y,66);
		};
		Def.Sprite{
			InitCommand=cmd(x,20;y,-54;diffusealpha,1);
			GainFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/title.png")) end;
			LoseFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/title dark.png")) end;
		};
		LoadActor( "disc" )..{
		  InitCommand=cmd(;x,-190;y,-50);
			OnCommand=cmd(diffusealpha,0;sleep,0.2;smooth,0.2;diffusealpha,1;queuecommand,"Animate");
			AnimateCommand=cmd(linear,0.2;addy,2;linear,0.2;addx,-2;linear,0.2;addy,-2;linear,0.2;addx,2;queuecommand,"Animate");
			GainFocusCommand=cmd(diffusealpha,1;queuecommand,"Animate");
			LoseFocusCommand=cmd(diffusealpha,0;finishtweening;);
		};
		LoadActor( "music icon off" )..{
		  InitCommand=cmd(;x,-188;y,-54);
			OnCommand=cmd(diffusealpha,0;sleep,0.2;smooth,0.2;diffusealpha,0);
			GainFocusCommand=cmd(diffusealpha,0);
			LoseFocusCommand=cmd(diffusealpha,1;);
		};
		LoadActor("note")..{
			InitCommand=cmd(;x,-184;y,-64;shadowlength,2;shadowcolor,color("#01215c"));
			OnCommand=cmd(diffusealpha,0;sleep,0.2;smooth,0.2;diffusealpha,1;queuecommand,"Animate");
			AnimateCommand=cmd(linear,0.5;addy,-2;linear,0.5;addy,2;queuecommand,"Animate");
			GainFocusCommand=cmd(diffusealpha,1;queuecommand,"Animate");
			LoseFocusCommand=cmd(diffusealpha,0;finishtweening;);
		};
	};
};

return t;
