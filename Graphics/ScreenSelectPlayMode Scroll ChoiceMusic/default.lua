local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(diffusealpha,0;sleep,0.2;linear,0.2;diffusealpha,1);
	GainFocusCommand=function(s) setenv("PlayMusic",1) end;
	LoseFocusCommand=function(s) setenv("PlayMusic",0) end;
	OffCommand=function(self)
		if getenv("PlayMusic") == 1 then
			self:sleep(0.2):linear(0.1):zoomy(0)
		elseif getenv("PlayCourse") == 1 then
			self:sleep(0.2):linear(0.1):addx(-SCREEN_WIDTH)
		else
			self:sleep(0.2):linear(0.1):addx(SCREEN_WIDTH)
		end;
	end;
	Def.ActorFrame{
		OnCommand=cmd(zoomy,0.5;sleep,0.2;linear,0.1;zoomy,1;linear,0.05;zoomx,1.1;linear,0.1;zoomx,1);
		Def.ActorFrame{
			OnCommand=cmd(sleep,1;queuecommand,"GainFocus");
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
			OnCommand=cmd(sleep,1;queuecommand,"GainFocus");
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
			OnCommand=cmd(sleep,1;queuecommand,"GainFocus");
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
			GainFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/base.png")) end;
			LoseFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/base dark.png")) end;
		};
		Def.ActorFrame{
			OnCommand=cmd(sleep,1;queuecommand,"GainFocus");
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
			InitCommand=cmd(addy,-80;addx,-21);
			GainFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/char.png")) end;
		LoseFocusCommand=function(s) s:stoptweening():Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/char dark.png")) end;
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
			InitCommand=cmd(diffusealpha,1;xy,-14,14);
			OnCommand=cmd(diffusealpha,0;sleep,0.3;linear,0.2;diffusealpha,1);
			GainFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/text.png")) end;
			LoseFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/text dark.png")) end;
		};
		Def.ActorFrame{
			InitCommand=cmd(valign,1;y,-56;diffusealpha,1);
			OnCommand=cmd(y,0;sleep,0.3;linear,0.2;y,-56);
			LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/infotop.png"));
			Def.Sprite{
				InitCommand=cmd(x,20;y,2;diffusealpha,1);
				GainFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/title.png")) end;
				LoseFocusCommand=function(self) self:Load(THEME:GetPathG("ScreenSelectPlayMode","Scroll ChoiceMusic/title dark.png")) end;
				OnCommand=cmd(y,0;sleep,0.2;linear,0.1;y,2);
			};
			LoadActor( "disc" )..{
		  	InitCommand=cmd(;x,-190;y,6);
				OnCommand=cmd(diffusealpha,0;sleep,0.2;smooth,0.2;diffusealpha,1;queuecommand,"Animate");
				AnimateCommand=cmd(linear,0.2;addy,2;linear,0.2;addx,-2;linear,0.2;addy,-2;linear,0.2;addx,2;queuecommand,"Animate");
				GainFocusCommand=cmd(diffusealpha,1;queuecommand,"Animate");
				LoseFocusCommand=cmd(diffusealpha,0;finishtweening;);
			};
			LoadActor( "music icon off" )..{
			  InitCommand=cmd(;x,-188;y,-2);
				OnCommand=cmd(diffusealpha,0;sleep,0.2;smooth,0.2;diffusealpha,0);
				GainFocusCommand=cmd(diffusealpha,0);
				LoseFocusCommand=cmd(diffusealpha,1;);
			};
			LoadActor("note")..{
				InitCommand=cmd(;x,-184;y,-8;shadowlength,2;shadowcolor,color("#01215c"));
				OnCommand=cmd(diffusealpha,0;sleep,0.2;smooth,0.2;diffusealpha,1;queuecommand,"Animate");
				AnimateCommand=cmd(linear,0.5;addy,-2;linear,0.5;addy,2;queuecommand,"Animate");
				GainFocusCommand=cmd(diffusealpha,1;queuecommand,"Animate");
				LoseFocusCommand=cmd(diffusealpha,0;finishtweening;);
			};
		};
		LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/infobottom.png"))..{
			InitCommand=cmd(valign,1;y,66);
			OnCommand=cmd(y,0;sleep,0.3;linear,0.2;y,66);
		};
	};
};

return t;
