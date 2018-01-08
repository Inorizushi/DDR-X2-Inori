local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(addx,-SCREEN_WIDTH*2.5;sleep,0.5;smooth,0.3;addx,SCREEN_WIDTH*2.5);
	OffCommand=cmd(sleep,0.116;linear,0.066;zoomy,0;zoomx,5;diffusealpha,0);
	GainFocusCommand=cmd(finishtweening;linear,0.2;y,0;zoom,1);
	LoseFocusCommand=cmd(finishtweening;linear,0.2;y,72;zoom,0.92);
	-- Information panel
	LoadActor("base.png")..{
		InitCommand=cmd(addy,-38;);
		GainFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/base.png")) end;
		LoseFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/base dark.png")) end;
	};
	LoadActor("char.png")..{
		InitCommand=cmd(addy,-72;addx,12);
		GainFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/char.png")) end;
		LoseFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/char dark.png")) end;
	};
	Def.ActorFrame{
		InitCommand=cmd(addy,186;);
		LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/infomid.png"))..{
			InitCommand=cmd(zoom,0.95;diffusealpha,0.5);
		};
		Def.Sprite{
			InitCommand=cmd(diffusealpha,1;xy,-2,12);
			GainFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/text.png")) end;
			LoseFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/text dark.png")) end;
		};
		LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/infotop.png"))..{
			InitCommand=cmd(y,-56);
		};
		LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/infobottom.png"))..{
			InitCommand=cmd(y,66);
		};
		Def.Sprite{
			InitCommand=cmd(x,20;y,-54;diffusealpha,1);
			GainFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/title.png")) end;
			LoseFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/title dark.png")) end;
		};
		Def.ActorFrame{
			LoadActor( "disc" )..{
			  InitCommand=cmd(;x,-186;y,-44);
				OnCommand=cmd(diffusealpha,0;sleep,0.2;smooth,0.2;diffusealpha,1);
				GainFocusCommand=cmd(diffusealpha,1);
				LoseFocusCommand=cmd(diffusealpha,0;finishtweening;);
			};
			LoadActor("arrow blue")..{
				InitCommand=cmd(valign,1;x,-196;y,-46);
				GainFocusCommand=cmd(queuecommand,"Anim");
				LoseFocusCommand=cmd(finishtweening;diffusealpha,0);
				AnimCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.2;linear,0.15;diffusealpha,1;zoomy,1;sleep,2;linear,0.1;diffusealpha,0;queuecommand,"Anim");
			};
			LoadActor("arrow yellow")..{
				InitCommand=cmd(valign,1;x,-184;y,-42);
				GainFocusCommand=cmd(queuecommand,"Anim");
				LoseFocusCommand=cmd(finishtweening;diffusealpha,0);
				AnimCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.6;linear,0.2;diffusealpha,1;zoomy,1;sleep,1.55;linear,0.1;diffusealpha,0;queuecommand,"Anim");
			};
			LoadActor("arrow yellow")..{
				InitCommand=cmd(x,-184;y,-60);
				GainFocusCommand=cmd(queuecommand,"Anim");
				LoseFocusCommand=cmd(finishtweening;diffusealpha,0);
				AnimCommand=cmd(zoom,1;diffusealpha,0;sleep,0.8;diffusealpha,0.25;linear,0.2;zoom,1.4;linear,0.1;diffusealpha,0;sleep,1.35;queuecommand,"Anim");
			};
			LoadActor("arrow purple")..{
				InitCommand=cmd(valign,1;x,-174;y,-40);
				GainFocusCommand=cmd(queuecommand,"Anim");
				LoseFocusCommand=cmd(finishtweening;diffusealpha,0);
				AnimCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.4;linear,0.15;diffusealpha,1;zoomy,1;sleep,1.8;linear,0.1;diffusealpha,0;queuecommand,"Anim");
			};
		};
		LoadActor("icon off.png")..{
			InitCommand=cmd(x,-186;y,-54;diffusealpha,1);
			OnCommand=cmd(diffusealpha,0;sleep,0.2;smooth,0.2;diffusealpha,1);
			GainFocusCommand=cmd(diffusealpha,0);
			LoseFocusCommand=cmd(diffusealpha,1);
		};
	};
};

return t;
