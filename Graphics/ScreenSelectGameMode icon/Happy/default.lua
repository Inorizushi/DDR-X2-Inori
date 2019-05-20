local t = Def.ActorFrame{};

t[#t+1] = LoadActor("reflec")..{
	InitCommand=cmd(xy,-16,214;valign,0;diffusealpha,0.75);
	OnCommand=cmd(finishtweening;addx,SCREEN_WIDTH*2.5;sleep,0.5;smooth,0.3;addx,-SCREEN_WIDTH*2.5);
	OffCommand=cmd(sleep,0.116;diffusealpha,0);
};

t[#t+1] = Def.ActorFrame{
	OnCommand=cmd(finishtweening;addx,SCREEN_WIDTH*2.5;sleep,0.5;smooth,0.3;addx,-SCREEN_WIDTH*2.5);
	OffCommand=cmd(sleep,0.116;linear,0.066;zoomy,0;zoomx,2;diffusealpha,0);

	-- Information panel
	Def.Sprite{
		InitCommand=cmd(addy,-14;addx,22);
		GainFocusCommand=function(s) s:Load(THEME:GetPathG("ScreenSelectGameMode","icon/Happy/char.png")) end;
		LoseFocusCommand=function(s) s:Load(THEME:GetPathG("ScreenSelectGameMode","icon/Happy/char dark.png")) end;
	};
	Def.ActorFrame{
		Def.Sprite{
			InitCommand=cmd(addy,180;addx,-14;diffusealpha,1);
			GainFocusCommand=function(s) s:Load(THEME:GetPathG("","_sharedX2/PlayMode/base")) end;
			LoseFocusCommand=function(s) s:Load(THEME:GetPathG("ScreenSelectGameMode","icon/Happy/unfocused base.png")) end;
		};
		LoadActor("text/default.lua")..{
			GainFocusCommand=cmd(visible,true);
			LoseFocusCommand=cmd(visible,false);
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(addx,-196;addy,150);
		Def.Sprite{
			Texture = "icon 1x2";
			InitCommand=cmd(setstate,1;pause;);
			GainFocusCommand=function(s) s:setstate(0); end;
			LoseFocusCommand=function(s) s:setstate(1); end;
		};
		Def.Sprite{
			Texture = "icon 1x2";
			InitCommand=cmd(setstate,0;pause;blend,Blend.Add;diffusealpha,0);
			OnCommand=cmd(queuecommand,"Anim");
			GainFocusCommand=cmd(finishtweening;queuecommand,"Anim");
			AnimCommand=cmd(rotationz,0;zoom,1;sleep,0.8;diffusealpha,0.5;linear,0.2;rotationz,360;linear,0.2;zoom,1.5;linear,0.2;diffusealpha,0;sleep,1.4;queuecommand,"Anim");
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(x,-200;y,82);
		GainFocusCommand=cmd(visible,false);
		LoseFocusCommand=cmd(visible,true);
		LoadActor("letters unfocused");
	};
	Def.ActorFrame{
		InitCommand=cmd(x,-198;y,60);
		OnCommand=cmd(queuecommand,"Anim");
		GainFocusCommand=cmd(finishtweening;queuecommand,"Anim";visible,true);
		LoseFocusCommand=cmd(visible,false);
		AnimCommand=cmd(sleep,2.8;queuecommand,"Anim");
		LoadActor("H.png")..{
			InitCommand=cmd(x,-80;y,34);
			AnimCommand=cmd(sleep,0.5;linear,0.1;addy,-40;zoomy,0.75;sleep,0.05;linear,0.1;addy,40;linear,0.05;zoomy,1;zoomx,1);
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
		LoadActor("A.png")..{
			InitCommand=cmd(x,-36;y,16);
			AnimCommand=cmd(sleep,0.55;linear,0.1;addy,-40;zoomy,0.75;sleep,0.05;linear,0.1;addy,40;linear,0.05;zoomy,1);
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
		LoadActor("P1.png")..{
			InitCommand=cmd(x,0;y,6);
			AnimCommand=cmd(sleep,0.6;linear,0.1;addy,-40;zoomy,0.75;sleep,0.05;linear,0.1;addy,40;linear,0.05;zoomy,1);
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
		LoadActor("P2.png")..{
			InitCommand=cmd(x,36;y,8);
			AnimCommand=cmd(sleep,0.65;linear,0.1;addy,-40;zoomy,0.75;sleep,0.05;linear,0.1;addy,40;linear,0.05;zoomy,1);
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
		LoadActor("Y.png")..{
			InitCommand=cmd(x,76;y,26);
			AnimCommand=cmd(sleep,0.7;linear,0.1;addy,-40;zoomy,0.75;sleep,0.05;linear,0.1;addy,40;linear,0.05;zoomy,1);
			LoseFocusCommand=cmd(stopeffect;finishtweening);
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(;x,310;y,190;zoomx,-1);
		OnCommand=cmd(zoomy,0;sleep,0.2;linear,0.2;zoomy,1;queuecommand,"Animate");
		AnimateCommand=cmd(bob;effectmagnitude,10,0,0;effectperiod,0.7);
		GainFocusCommand=cmd(finishtweening;linear,0.2;zoomx,-1;zoomy,1;queuecommand,"Animate");
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
