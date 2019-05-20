local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(diffusealpha,0;sleep,0.2;linear,0.2;diffusealpha,1);
	GainFocusCommand=function(s) setenv("PlayDrill",1) end;
	LoseFocusCommand=function(s) setenv("PlayDrill",0) end;
	OffCommand=function(self)
		if getenv("PlayDrill") == 1 then
			self:sleep(0.2):linear(0.1):zoomy(0)
		elseif getenv("PlayCourse") == 1 then
			self:sleep(0.2):linear(0.1):addx(SCREEN_WIDTH)
		else
			self:sleep(0.2):linear(0.1):addx(-SCREEN_WIDTH)
		end;
	end;
	Def.ActorFrame{
		OnCommand=cmd(zoomy,0.5;sleep,0.2;linear,0.1;zoomy,1;linear,0.05;zoomx,1.1;linear,0.1;zoomx,1);
		Def.ActorFrame{
			GainFocusCommand=cmd(finishtweening;queuecommand,"Anim");
			AnimCommand=cmd(sleep,2;queuecommand,"Anim");
			LoseFocusCommand=cmd(finishtweening;stopeffect);
			Def.ActorFrame{
				InitCommand=cmd(diffusealpha,0;);
				GainFocusCommand=cmd(queuecommand,"Anim");
				AnimCommand=cmd(finishtweening;diffusealpha,0;sleep,0.6;linear,0.2;diffusealpha,0.5;linear,0.7;diffusealpha,0);
				LoadActor("back")..{
					InitCommand=cmd(addy,-38);
					GainFocusCommand=cmd(queuecommand,"Anim");
					AnimCommand=cmd(finishtweening;zoom,0.75;sleep,0.6;linear,1;zoom,1.1);
				};
			};
		};
		Def.ActorFrame{
			GainFocusCommand=cmd(finishtweening;queuecommand,"Anim");
			AnimCommand=cmd(sleep,2;queuecommand,"Anim");
			LoseFocusCommand=cmd(finishtweening;stopeffect);
			Def.ActorFrame{
				InitCommand=cmd(diffusealpha,0;);
				GainFocusCommand=cmd(queuecommand,"Anim");
				AnimCommand=cmd(finishtweening;diffusealpha,0;sleep,0.6;linear,0.2;diffusealpha,0.5;linear,0.7;diffusealpha,0);
				LoadActor("back")..{
					InitCommand=cmd(addy,-38);
					GainFocusCommand=cmd(queuecommand,"Anim");
					AnimCommand=cmd(finishtweening;zoom,0.75;sleep,0.8;linear,0.9;zoom,0.95);
				};
			};
		};
		Def.ActorFrame{
			GainFocusCommand=cmd(finishtweening;queuecommand,"Anim");
			AnimCommand=cmd(sleep,2;queuecommand,"Anim");
			LoseFocusCommand=cmd(finishtweening;stopeffect);
			Def.ActorFrame{
				InitCommand=cmd(diffusealpha,0;);
				GainFocusCommand=cmd(queuecommand,"Anim");
				AnimCommand=cmd(finishtweening;diffusealpha,0;sleep,0.6;linear,0.2;diffusealpha,0.25;linear,0.7;diffusealpha,0);
				LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/spinner.png"))..{
					InitCommand=cmd(addy,-38;zoom,1.2;blend,Blend.Add;diffusealpha,0.5;);
					GainFocusCommand=cmd(queuecommand,"Anim");
					AnimCommand=cmd(rotationz,0;sleep,0.6;linear,1;rotationz,360);
				};
			};
		};
		LoadActor("base.png")..{
			InitCommand=cmd(addy,-38;);
			GainFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/base.png")) end;
			LoseFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/base dark.png")) end;
		};
		Def.ActorFrame{
			GainFocusCommand=cmd(finishtweening;queuecommand,"Anim");
			AnimCommand=cmd(sleep,2;queuecommand,"Anim");
			LoseFocusCommand=cmd(finishtweening;stopeffect);
			Def.ActorFrame{
				InitCommand=cmd(diffusealpha,0;);
				GainFocusCommand=cmd(queuecommand,"Anim");
				AnimCommand=cmd(finishtweening;diffusealpha,0;sleep,0.8;linear,0.2;diffusealpha,1;linear,0.6;diffusealpha,0);
				LoadActor("highlight")..{
					InitCommand=cmd(addy,-38);
					GainFocusCommand=cmd(queuecommand,"Anim");
					AnimCommand=cmd(finishtweening;zoom,0.5;sleep,0.8;linear,0.9;zoom,1);
				};
			};
		};
		LoadActor("char.png")..{
			InitCommand=cmd(addy,-72;addx,12);
			GainFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/char.png")) end;
			LoseFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/char dark.png")) end;
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(addy,186;);
		OnCommand=cmd(diffusealpha,0;sleep,0.3;linear,0.2;diffusealpha,1);
		LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/infomid.png"))..{
			InitCommand=cmd(zoom,0.95;diffusealpha,0.5);
			OnCommand=cmd(zoomy,0;sleep,0.3;linear,0.2;zoomy,1);
		};
		Def.Sprite{
			InitCommand=cmd(diffusealpha,1;xy,-2,12);
			OnCommand=cmd(diffusealpha,0;sleep,0.3;linear,0.2;diffusealpha,1);
			GainFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/text.png")) end;
			LoseFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/text dark.png")) end;
		};
		Def.ActorFrame{
			InitCommand=cmd(valign,1;y,-56;diffusealpha,1);
			OnCommand=cmd(y,0;sleep,0.3;linear,0.2;y,-56);
			LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/infotop.png"));
			Def.Sprite{
				InitCommand=cmd(x,20;y,-54;diffusealpha,1);
				GainFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/title.png")) end;
				LoseFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceDrill/title dark.png")) end;
				OnCommand=cmd(y,0;sleep,0.2;linear,0.1;y,2);
			};
			Def.ActorFrame{
				LoadActor("icon off.png")..{
					InitCommand=cmd(x,-186;y,-4;diffusealpha,1);
					OnCommand=cmd(diffusealpha,0;sleep,0.2;smooth,0.2;diffusealpha,1);
					GainFocusCommand=cmd(diffusealpha,0);
					LoseFocusCommand=cmd(diffusealpha,1);
				};
				LoadActor( "disc" )..{
				  InitCommand=cmd(;x,-186;y,6);
					OnCommand=cmd(diffusealpha,0;sleep,0.2;smooth,0.2;diffusealpha,1);
					GainFocusCommand=cmd(diffusealpha,1);
					LoseFocusCommand=cmd(diffusealpha,0;finishtweening;);
				};
				LoadActor("arrow blue")..{
					InitCommand=cmd(valign,1;x,-196;y,4);
					GainFocusCommand=cmd(queuecommand,"Anim");
					LoseFocusCommand=cmd(finishtweening;diffusealpha,0);
					AnimCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.2;linear,0.15;diffusealpha,1;zoomy,1;sleep,2;linear,0.1;diffusealpha,0;queuecommand,"Anim");
				};
				LoadActor("arrow yellow")..{
					InitCommand=cmd(valign,1;x,-184;y,6);
					GainFocusCommand=cmd(queuecommand,"Anim");
					LoseFocusCommand=cmd(finishtweening;diffusealpha,0);
					AnimCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.6;linear,0.2;diffusealpha,1;zoomy,1;sleep,1.55;linear,0.1;diffusealpha,0;queuecommand,"Anim");
				};
				LoadActor("arrow yellow")..{
					InitCommand=cmd(valign,1;x,-184;y,6);
					GainFocusCommand=cmd(queuecommand,"Anim");
					LoseFocusCommand=cmd(finishtweening;diffusealpha,0);
					AnimCommand=cmd(zoom,1;diffusealpha,0;sleep,0.8;diffusealpha,0.25;linear,0.2;zoom,1.4;linear,0.1;diffusealpha,0;sleep,1.35;queuecommand,"Anim");
				};
				LoadActor("arrow purple")..{
					InitCommand=cmd(valign,1;x,-174;y,4);
					GainFocusCommand=cmd(queuecommand,"Anim");
					LoseFocusCommand=cmd(finishtweening;diffusealpha,0);
					AnimCommand=cmd(diffusealpha,0;zoomy,0;sleep,0.4;linear,0.15;diffusealpha,1;zoomy,1;sleep,1.8;linear,0.1;diffusealpha,0;queuecommand,"Anim");
				};
			};
		};
		LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/infobottom.png"))..{
			InitCommand=cmd(valign,1;y,66);
			OnCommand=cmd(y,0;sleep,0.3;linear,0.2;y,66);
		};
	};
};

return t;
