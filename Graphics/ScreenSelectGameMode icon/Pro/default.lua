local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(addx,-SCREEN_WIDTH*2.5;sleep,0.5;smooth,0.3;addx,SCREEN_WIDTH*2.5);
	OffCommand=cmd(sleep,0.116;linear,0.066;zoomy,0;zoomx,5;diffusealpha,0);

	-- Information panel
	Def.Sprite{
		InitCommand=cmd(addy,-32;addx,32);
		OnCommand=cmd(addy,10);
		GainFocusCommand=function(s) s:stoptweening():linear(0.2):addy(-10):zoom(1):Load(THEME:GetPathG("ScreenSelectGameMode","icon/Pro/char.png")) end;
		LoseFocusCommand=function(s) s:stoptweening():linear(0.2):addy(10):zoom(0.75):Load(THEME:GetPathG("ScreenSelectGameMode","icon/Pro/char dark.png")) end;
	};
	Def.ActorFrame{
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,true);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,false);
		LoadActor(THEME:GetPathG("","_sharedX2/PlayMode/base"))..{
			InitCommand=cmd(addy,181;addx,19);
		};
		--LoadActor("text/default.lua");
	};
	Def.ActorFrame{
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,false);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,true);
		LoadActor("unfocused base")..{
			InitCommand=cmd(addy,186;addx,20;);
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(addx,-160;addy,150;visible,false);
		GainFocusCommand=cmd(visible,true);
		LoseFocusCommand=cmd(visible,false);
		Def.Sprite{
			Texture = "icon 1x2";
			InitCommand=cmd(setstate,1;pause;);
			GainFocusCommand=function(s) s:setstate(0); end;
			LoseFocusCommand=function(s) s:setstate(1); end;
		};
		Def.Sprite{
			Texture = "icon 1x2";
			InitCommand=cmd(setstate,0;pause;blend,Blend.Add);
			OnCommand=cmd(queuecommand,"Anim");
			GainFocusCommand=cmd(finishtweening;queuecommand,"Anim");
			AnimCommand=cmd(rotationz,0;zoom,1;sleep,0.8;diffusealpha,0.5;linear,0.2;rotationz,360;linear,0.2;zoom,1.5;linear,0.2;diffusealpha,0;sleep,1.4;queuecommand,"Anim");
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
	};
	Def.Sprite{
		Texture = "icon 1x2";
		InitCommand=cmd(setstate,1;pause;addx,-146;addy,90;visible,true);
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,false);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,true);
	};
	Def.ActorFrame{
		InitCommand=cmd(x,-164;y,60);
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,true);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,false);
		LoadActor("P.png")..{
			InitCommand=cmd(x,-54;y,20);
			GainFocusCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,0.5;linear,0.2;addy,-40;zoomx,1.3;zoomy,0.5;linear,0.2;addy,40;zoomy,1;zoomx,1;sleep,0.4;sleep,1.5;queuecommand,"Anim");
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
		LoadActor("R.png")..{
			InitCommand=cmd(x,3;y,2);
			GainFocusCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,0.55;linear,0.2;addy,-40;zoomx,1.3;zoomy,0.5;linear,0.2;addy,40;zoomy,1;zoomx,1;sleep,0.4;sleep,1.45;queuecommand,"Anim");
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
		LoadActor("O.png")..{
			InitCommand=cmd(x,60;y,14);
			GainFocusCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,0.6;linear,0.2;addy,-40;zoomx,1.3;zoomy,0.5;linear,0.2;addy,40;zoomy,1;zoomx,1;sleep,0.4;sleep,1.4;queuecommand,"Anim");
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(x,-146;y,48);
		GainFocusCommand=cmd(stoptweening;linear,0.2;zoom,1;visible,false);
		LoseFocusCommand=cmd(stoptweening;linear,0.2;zoom,0.75;visible,true);
		LoadActor("letters unfocused");
	};
	Def.ActorFrame{
		InitCommand=cmd(;x,-310;y,190);
		OnCommand=cmd(zoomy,0;sleep,0.2;linear,0.2;zoomy,1;queuecommand,"Animate");
		AnimateCommand=cmd(bob;effectmagnitude,10,0,0;effectperiod,0.7);
		GainFocusCommand=cmd(finishtweening;linear,0.2;zoomx,1;zoomy,1;queuecommand,"Animate");
		LoseFocusCommand=cmd(stoptweening;linear,0.1;zoom,0);
		OffCommand=cmd(diffusealpha,0);
		LoadActor( THEME:GetPathG("","_sharedX2/_selectarrowg") );
		LoadActor( THEME:GetPathG("","_sharedX2/_selectarrowr") )..{
			InitCommand=cmd(diffusealpha,0;draworder,100);
			GainFocusCommand=cmd(diffusealpha,0);
			LoseFocusCommand=cmd(diffusealpha,1;sleep,0.4;diffusealpha,0);
		};
	};
};
return t;
