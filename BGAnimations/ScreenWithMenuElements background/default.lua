local t = Def.ActorFrame{};

t[#t+1] = Def.ActorFrame{
	 LoadActor( "bg.png" )..{
		InitCommand=cmd(valign,1;CenterX;y,SCREEN_BOTTOM;setsize,SCREEN_WIDTH,496);
	};
	 LoadActor( "bg top.png" )..{
		InitCommand=cmd(CenterX;valign,0;y,SCREEN_TOP);
	};
	 LoadActor( THEME:GetPathB("","ScreenLogo background/hills2 (stretch)") )..{
	   InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-205);
	   OnCommand=cmd(customtexturerect,0,0,1,1;texcoordvelocity,0.2,0);
	 };
	 LoadActor( THEME:GetPathB("","ScreenLogo background/hill2 hl (stretch)") )..{
	   InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-225);
	   OnCommand=cmd(customtexturerect,0,0,1,1;texcoordvelocity,0.2,0);
	 };
	 LoadActor( THEME:GetPathB("","ScreenLogo background/hills1 (stretch)") )..{
	   InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-205;diffusealpha,0.5);
	   OnCommand=cmd(customtexturerect,0,0,1.5,1;texcoordvelocity,0.2,0);
	 };
};

t[#t+1] = Def.ActorFrame{
	--ripples-------------------
	LoadActor( "bgrp01" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+00;y,SCREEN_CENTER_Y+180);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,0.65;zoom,1.3;diffusealpha,0.5;decelerate,1.5;zoom,1.6;diffusealpha,0;sleep,6;queuecommand,"Animate");
	};
	LoadActor( "rp00A1" )..{
		InitCommand=cmd(zoom,0.6;x,SCREEN_CENTER_X+0;y,SCREEN_CENTER_Y+180);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,0.6;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,0.9;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,1.2;diffusealpha,0;sleep,6;queuecommand,"Animate");
	};

	LoadActor( "bgrp02" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+280;y,SCREEN_CENTER_Y-180);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,2.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,0.65;zoom,1.2;diffusealpha,1;decelerate,1.5;zoom,1.4;diffusealpha,0;sleep,12;queuecommand,"Animate");
	};
	LoadActor( "bgrp03" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-150;y,SCREEN_CENTER_Y-20);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,3.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,0.65;zoom,1.4;diffusealpha,0.5;decelerate,1.5;zoom,1.8;diffusealpha,0;sleep,12;queuecommand,"Animate");
	};
	LoadActor("bgrp03")..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-280;y,SCREEN_CENTER_Y-50);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,1.2;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,0.65;zoom,1.4;diffusealpha,1;decelerate,1.5;zoom,1.8;diffusealpha,0;sleep,12;queuecommand,"Animate");
	};

	LoadActor( "ripple00A" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+500;y,SCREEN_CENTER_Y+0);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,3.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,0.65;zoom,1.2;diffusealpha,0.3;decelerate,1.5;zoom,1.5;diffusealpha,0;sleep,6;queuecommand,"Animate");
	};
	LoadActor( "rp00A1" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+500;y,SCREEN_CENTER_Y+0);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,3.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,1.35;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,1.7;diffusealpha,0;sleep,6;queuecommand,"Animate");
	};

	LoadActor( "ripple00B" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-100;y,SCREEN_CENTER_Y+90);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,7.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,0.65;zoom,1.15;diffusealpha,0.5;decelerate,1.5;zoom,1.3;diffusealpha,0;sleep,12;queuecommand,"Animate");
	};
	LoadActor( "rp00A1" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-100;y,SCREEN_CENTER_Y+90);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,7.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,1.35;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,1.5;diffusealpha,0;sleep,12;queuecommand,"Animate");
	};

	LoadActor( "ripple00B" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-470;y,SCREEN_CENTER_Y-250;diffuse,Color("Green"));
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,0.65;zoom,1.4;diffusealpha,0.5;decelerate,1.5;zoom,1.8;diffusealpha,0;sleep,6;queuecommand,"Animate");
	};
	LoadActor( "rp00A1" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-470;y,SCREEN_CENTER_Y-250);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,1.4;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,1.8;diffusealpha,0;sleep,6;queuecommand,"Animate");
	};

	LoadActor( "ripple00B" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+470;y,SCREEN_CENTER_Y+250;diffuse,Color("Green"));
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,4.2;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,0.65;zoom,1.4;diffusealpha,0.5;decelerate,1.5;zoom,1.8;diffusealpha,0;sleep,6;queuecommand,"Animate");
	};
	LoadActor( "rp00A1" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+470;y,SCREEN_CENTER_Y+250);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,4.2;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,1.4;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,1.8;diffusealpha,0;sleep,6;queuecommand,"Animate");
	};


	LoadActor( "ripple00C" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+560;y,SCREEN_CENTER_Y+250);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,6.8;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,0.65;zoom,1.15;diffusealpha,0.5;decelerate,1.5;zoom,1.3;diffusealpha,0;sleep,12;queuecommand,"Animate");
	};
	LoadActor( "rp00A1" )..{
		InitCommand=cmd(zoom,0.6;x,SCREEN_CENTER_X+560;y,SCREEN_CENTER_Y+250);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,6.8;playcommand,"Animate");
		AnimateCommand=cmd(zoom,0.6;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,0.7;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,0.9;diffusealpha,0;sleep,12;queuecommand,"Animate");
	};

	LoadActor( "ripple00C" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-450;y,SCREEN_CENTER_Y+150);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,1.8;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,0.65;zoom,1.15;diffusealpha,0.5;decelerate,1.5;zoom,1.3;diffusealpha,0;sleep,6;queuecommand,"Animate");
	};
	LoadActor( "rp00A1" )..{
		InitCommand=cmd(zoom,0.6;x,SCREEN_CENTER_X-450;y,SCREEN_CENTER_Y+150);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,1.8;playcommand,"Animate");
		AnimateCommand=cmd(zoom,0.6;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,0.7;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,0.9;diffusealpha,0;sleep,6;queuecommand,"Animate");
	};

	LoadActor( "ripple00C" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-180;y,SCREEN_CENTER_Y-190);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.8;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,0.65;zoom,1.15;diffusealpha,0.5;decelerate,1.5;zoom,1.3;diffusealpha,0;sleep,5;queuecommand,"Animate");
	};
	LoadActor( "rp00A1" )..{
		InitCommand=cmd(zoom,0.6;x,SCREEN_CENTER_X-180;y,SCREEN_CENTER_Y-190);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.8;playcommand,"Animate");
		AnimateCommand=cmd(zoom,0.6;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,0.7;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,0.9;diffusealpha,0;sleep,5;queuecommand,"Animate");
	};

	LoadActor( "rp001" )..{
		InitCommand=cmd(zoom,1.5;x,SCREEN_CENTER_X+200;y,SCREEN_CENTER_Y+200);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,11.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1.5;diffusealpha,0;linear,0.65;zoom,1.65;diffusealpha,0.5;decelerate,1.5;zoom,1.8;diffusealpha,0;sleep,12;queuecommand,"Animate");
	};
	LoadActor( "rp00A1" )..{
		InitCommand=cmd(zoom,1.5;x,SCREEN_CENTER_X+200;y,SCREEN_CENTER_Y+200);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,11.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1.5;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,2.05;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,2.8;diffusealpha,0;sleep,12;queuecommand,"Animate");
	};


	LoadActor( "rp001" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+410;y,SCREEN_CENTER_Y-200);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,2.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,0.65;zoom,1.15;diffusealpha,0.5;decelerate,1.5;zoom,1.3;diffusealpha,0;sleep,12;queuecommand,"Animate");
	};
	LoadActor( "rp00A1" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+410;y,SCREEN_CENTER_Y-200);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,2.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,1.15;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,1.3;diffusealpha,0;sleep,12;queuecommand,"Animate");
	};

	LoadActor( "rp001" )..{
		InitCommand=cmd(zoom,1.6;x,SCREEN_CENTER_X-450;y,SCREEN_CENTER_Y+170);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,4.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1.6;diffusealpha,0;linear,0.65;zoom,1.85;diffusealpha,0.5;decelerate,1.5;zoom,2.0;diffusealpha,0;sleep,12;queuecommand,"Animate");
	};
	LoadActor( "rp00A1" )..{
		InitCommand=cmd(zoom,1.6;x,SCREEN_CENTER_X-450;y,SCREEN_CENTER_Y+170);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,4.5;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1.6;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,1.85;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,2.0;diffusealpha,0;sleep,12;queuecommand,"Animate");
	};

	LoadActor( "rpshadle001" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+370;y,SCREEN_CENTER_Y+220);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.8;playcommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,0.33;zoom,1.15;diffusealpha,1;decelerate,0.55;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rpshadle001" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-400;y,SCREEN_CENTER_Y+260);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,2.8;playcommand,"Animate");
		AnimateCommand=cmd(zoom,0.55;diffusealpha,0;linear,0.33;zoom,0.75;diffusealpha,1;decelerate,0.55;zoom,0.95;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};



	--bubbles-----------------

	LoadActor( "BubbleTileA" )..{
		InitCommand=cmd(zoom,0.5;x,SCREEN_CENTER_X-270;y,SCREEN_BOTTOM+20);
		OnCommand=cmd(blend,'BlendMode_Add';sleep,2.8;playcommand,"Animate");
		AnimateCommand=cmd(y,SCREEN_BOTTOM+20;accelerate,2.5;y,SCREEN_TOP-20;sleep,5;queuecommand,"Animate");
	};
	LoadActor( "BubbleTileB" )..{
		InitCommand=cmd(zoom,0.5;x,SCREEN_CENTER_X+210;y,SCREEN_BOTTOM+20);
		OnCommand=cmd(blend,'BlendMode_Add';sleep,1.8;playcommand,"Animate");
		AnimateCommand=cmd(y,SCREEN_BOTTOM+20;accelerate,3.5;y,SCREEN_TOP-20;sleep,8;queuecommand,"Animate");
	};
	LoadActor( "BubbleTileB" )..{
		InitCommand=cmd(zoom,0.3;x,SCREEN_CENTER_X+140;y,SCREEN_BOTTOM+20);
		OnCommand=cmd(blend,'BlendMode_Add';sleep,6.8;playcommand,"Animate");
		AnimateCommand=cmd(y,SCREEN_BOTTOM+20;accelerate,3.5;y,SCREEN_TOP-20;sleep,9;queuecommand,"Animate");
	};


	--lines--------------------------

	LoadActor( "WaveRepeatA2" )..{
		InitCommand=cmd(zoom,1);
		OnCommand=cmd(diffusealpha,0;sleep,3.2;playcommand,"Animate");
		AnimateCommand=cmd(x,SCREEN_CENTER_X-160;y,SCREEN_CENTER_Y-290;zoomx,1.5;diffusealpha,0;
		linear,0.99;diffusealpha,0.33;x,SCREEN_CENTER_X-140;
		decelerate,1.65;diffusealpha,0;x,SCREEN_CENTER_X-120;
		sleep,15;queuecommand,"Animate");
	};
	LoadActor( "WaveRepeatA3" )..{
		InitCommand=cmd(zoom,1);
		OnCommand=cmd(diffusealpha,0;sleep,7.2;playcommand,"Animate");
		AnimateCommand=cmd(x,SCREEN_CENTER_X+200;y,SCREEN_CENTER_Y-310;zoom,0.75;diffusealpha,0;
		linear,0.99;diffusealpha,0.33;x,SCREEN_CENTER_X+250;zoomx,0.95;
		decelerate,1.65;diffusealpha,0;x,SCREEN_CENTER_X+300;zoomx,1.15;
		sleep,15;queuecommand,"Animate");
	};
};

return t
