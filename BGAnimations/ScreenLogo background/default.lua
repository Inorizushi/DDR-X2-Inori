InitUserPrefs();
local t = Def.ActorFrame{
  OnCommand=function(self)
    if not FILEMAN:DoesFileExist("Save/ThemePrefs.ini") then
      Trace("ThemePrefs doesn't exist; creating file")
      ThemePrefs.ForceSave()
    end
    if SN3Debug then
      SCREENMAN:SystemMessage("Saving ThemePrefs.")
    end
    ThemePrefs.Save()
  end;
};

t[#t+1] = Def.ActorFrame{
  OnCommand=function(self)
    if SN3Debug then
      print("setlife:"..tostring(Player.SetLife));
    end
  end
};

t[#t+1] = Def.ActorFrame{
  LoadActor( "base" )..{
		OnCommand=cmd(Center);
	};
}

t[#t+1] = Def.ActorFrame{
  LoadActor( "bg mid" )..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-12;setsize,SCREEN_WIDTH,312);
	};
  LoadActor( "bg top" )..{
		InitCommand=cmd(CenterX;valign,0;y,SCREEN_TOP);
	};
  LoadActor( "bg bottom" )..{
		InitCommand=cmd(CenterX;valign,1;y,SCREEN_BOTTOM);
	};
  LoadActor("hills2 (stretch)")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-240);
    OnCommand=cmd(customtexturerect,0,0,1,1;texcoordvelocity,0.2,0);
  };
  LoadActor("hill2 hl (stretch)")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-266);
    OnCommand=cmd(customtexturerect,0,0,1,1;texcoordvelocity,0.2,0);
  };
  LoadActor("hills1 (stretch)")..{
    InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-240;diffusealpha,0.5);
    OnCommand=cmd(customtexturerect,0,0,1.5,1;texcoordvelocity,0.2,0);
  };
  LoadActor( "BGfront02" )..{
    InitCommand=cmd(Center);
  };
}

t[#t+1] = Def.ActorFrame{
  --flowcrop--------------------------------------------
	LoadActor( "flowcrop01" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(queuecommand,"Animate");
		AnimateCommand=cmd(cropleft,0;cropright,1;linear,1.5;cropright,0;sleep,0.16;linear,1.5;cropleft,1;sleep,10;queuecommand,"Animate");
	};

	LoadActor( "flowcrop02" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(queuecommand,"Animate");
		AnimateCommand=cmd(cropleft,0;cropright,1;sleep,1.2;linear,1.6;cropright,0;sleep,0.16;linear,1.6;cropleft,1;sleep,10;queuecommand,"Animate");
	};

	LoadActor( "flowcrop03" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(queuecommand,"Animate");
		AnimateCommand=cmd(cropleft,0;cropright,1;sleep,3.2;linear,1.5;cropright,0;sleep,0.16;linear,1.5;cropleft,1;sleep,10;queuecommand,"Animate");
	};

	LoadActor( "flowcrop04" )..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
		OnCommand=cmd(queuecommand,"Animate");
		AnimateCommand=cmd(cropleft,0;cropright,1;sleep,0.8;linear,1.7;cropright,0;sleep,0.16;linear,1.7;cropleft,1;sleep,10;queuecommand,"Animate");
	};


		--landscape--------------------------------------------
	LoadActor( "rpshadle001" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+290;y,SCREEN_CENTER_Y+280);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,4.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,0.7;diffusealpha,0;linear,1;zoom,1.0;diffusealpha,1;
		decelerate,1;zoom,1.1;diffusealpha,0;sleep,8;queuecommand,"Animate");
	};
	LoadActor( "rpshadle001" )..{
		InitCommand=cmd(zoom,0.5;x,SCREEN_CENTER_X+500;y,SCREEN_CENTER_Y+231);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,0.3;diffusealpha,0;linear,1;zoom,0.5;diffusealpha,1;
		decelerate,1;zoom,0.6;diffusealpha,0;sleep,6;queuecommand,"Animate");
	};
	LoadActor( "rpshadle001" )..{
		InitCommand=cmd(zoom,1.7;x,SCREEN_CENTER_X+460;y,SCREEN_CENTER_Y+311);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,1.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1.3;diffusealpha,0;linear,2;zoom,1.45;diffusealpha,1;
		decelerate,2;zoom,1.6;diffusealpha,0;sleep,8;queuecommand,"Animate");
	};
	LoadActor( "rpshadle001" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-400;y,SCREEN_CENTER_Y+341);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,6.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,0.7;diffusealpha,0;linear,1;zoom,1.0;diffusealpha,1;
		decelerate,1;zoom,1.2;diffusealpha,0;sleep,8;queuecommand,"Animate");
	};
	LoadActor( "rpshadle001" )..{
		InitCommand=cmd(zoom,0.5;x,SCREEN_CENTER_X-300;y,SCREEN_CENTER_Y+251);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,2.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,0.5;diffusealpha,0;linear,1;zoom,0.7;diffusealpha,1;
		decelerate,1;zoom,0.9;diffusealpha,0;sleep,8;queuecommand,"Animate");
	};
	LoadActor( "rpshadle001" )..{
		InitCommand=cmd(zoom,0.5;x,SCREEN_CENTER_X-500;y,SCREEN_CENTER_Y+231);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,0.3;diffusealpha,0;linear,1;zoom,0.5;diffusealpha,1;
		decelerate,1;zoom,0.6;diffusealpha,0;sleep,6;queuecommand,"Animate");
	};

	--RIPPLES-----------------------------------------------

	LoadActor( "bgrp01" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+520;y,SCREEN_CENTER_Y-220);
		OnCommand=cmd(blend,'BlendMode_Add';queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,0.65;zoom,1.1;diffusealpha,0.5;decelerate,1.5;zoom,1.2;diffusealpha,0;sleep,5;queuecommand,"Animate");
	};


	LoadActor( "bgrp02" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+580;y,SCREEN_CENTER_Y-480);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,2.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.2;diffusealpha,1;decelerate,1;zoom,1.4;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "bgrp03" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-520;y,SCREEN_CENTER_Y+20);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.2;diffusealpha,1;decelerate,1;zoom,1.4;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "bgrp03" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-20;y,SCREEN_CENTER_Y+120);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,5.1;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.2;diffusealpha,1;decelerate,1;zoom,1.4;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "bgrp02" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-80;y,SCREEN_CENTER_Y-20);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.2;diffusealpha,1;decelerate,1;zoom,1.4;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "bgrp03" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-570;y,SCREEN_CENTER_Y+420);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,8;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.2;diffusealpha,1;decelerate,1;zoom,1.4;diffusealpha,0;sleep,8;queuecommand,"Animate");
	};
	LoadActor( "bgrp03" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-20;y,SCREEN_CENTER_Y-80);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,10;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.2;diffusealpha,1;decelerate,1;zoom,1.4;diffusealpha,0;sleep,10;queuecommand,"Animate");
	};
	LoadActor( "bgrp02" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+50;y,SCREEN_CENTER_Y+100);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,14;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.2;diffusealpha,1;decelerate,1;zoom,1.4;diffusealpha,0;sleep,14;queuecommand,"Animate");
	};
	LoadActor( "bgrp03" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-410;y,SCREEN_CENTER_Y+480);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,3;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.2;diffusealpha,1;decelerate,1;zoom,1.4;diffusealpha,0;sleep,8;queuecommand,"Animate");
	};
	LoadActor( "bgrp03" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+40;y,SCREEN_CENTER_Y+180);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,3.4;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.2;diffusealpha,1;decelerate,1;zoom,1.4;diffusealpha,0;sleep,6;queuecommand,"Animate");
	};
	LoadActor( "bgrp01" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-270;y,SCREEN_CENTER_Y+420);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,1;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.2;diffusealpha,1;decelerate,1;zoom,1.4;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "bgrp03" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+260;y,SCREEN_CENTER_Y+500);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,3.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.2;diffusealpha,1;decelerate,1;zoom,1.4;diffusealpha,0;sleep,8;queuecommand,"Animate");
	};
	LoadActor( "bgrp01" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+320;y,SCREEN_CENTER_Y-220);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.2;diffusealpha,1;decelerate,1;zoom,1.4;diffusealpha,0;sleep,18;queuecommand,"Animate");
	};
	LoadActor( "bgrp02" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+280;y,SCREEN_CENTER_Y-180);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,2;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.2;diffusealpha,1;decelerate,1;zoom,1.4;diffusealpha,0;sleep,19;queuecommand,"Animate");
	};
	LoadActor( "bgrp03" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-220;y,SCREEN_CENTER_Y+20);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.2;diffusealpha,1;
		decelerate,1;zoom,1.4;diffusealpha,0;sleep,19;queuecommand,"Animate");
	};
	LoadActor( "bgrp03" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-20;y,SCREEN_CENTER_Y+120);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,6;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.2;diffusealpha,1;
		decelerate,1;zoom,1.4;diffusealpha,0;sleep,20;queuecommand,"Animate");
	};
	LoadActor( "bgrp01" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-80;y,SCREEN_CENTER_Y-20);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.05;diffusealpha,1;
		decelerate,1;zoom,1.1;diffusealpha,0;sleep,20;queuecommand,"Animate");
	};
	LoadActor( "ripple00A" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-480;y,SCREEN_CENTER_Y-170);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1.0;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,1.25;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,1.5;diffusealpha,0;sleep,5;queuecommand,"Animate");
	};
	LoadActor( "rp00A1" )..{
		InitCommand=cmd(zoom,1.0;x,SCREEN_CENTER_X-480;y,SCREEN_CENTER_Y-170);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1.0;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,1.25;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,1.5;diffusealpha,0;sleep,5;queuecommand,"Animate");
	};

	LoadActor( "ripple00A" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+380;y,SCREEN_CENTER_Y-70);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,1.8;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1.0;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,1.2;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,1.5;diffusealpha,0;sleep,5;queuecommand,"Animate");
	};
	LoadActor( "rp00A1" )..{
		InitCommand=cmd(zoom,1.0;x,SCREEN_CENTER_X+380;y,SCREEN_CENTER_Y-70);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,1.8;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1.0;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,1.2;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,1.5;diffusealpha,0;sleep,5;queuecommand,"Animate");
	};

	LoadActor( "ripple00C" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+420;y,SCREEN_CENTER_Y-490);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,4.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.3;diffusealpha,1;
		decelerate,1;zoom,1.5;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};

	LoadActor( "rp001" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+470;y,SCREEN_CENTER_Y-190);
		OnCommand=cmd(blend,'BlendMode_Add';spin;diffusealpha,0;sleep,6;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1.0;diffusealpha,0;rotationz,0;linear,0.65;rotationz,0;zoom,1.2;diffusealpha,0.2;decelerate,1.5;rotationz,0;zoom,1.5;diffusealpha,0;sleep,12;queuecommand,"Animate");
	};
	LoadActor( "rp00A1" )..{
		InitCommand=cmd(zoom,1.0;x,SCREEN_CENTER_X+470;y,SCREEN_CENTER_Y-190);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,6;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1.0;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,1.2;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,1.5;diffusealpha,0;sleep,12;queuecommand,"Animate");
	};

	LoadActor( "rp001" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-570;y,SCREEN_CENTER_Y+190);
		OnCommand=cmd(blend,'BlendMode_Add';spin;diffusealpha,0;sleep,3;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1.0;diffusealpha,0;rotationz,0;linear,0.65;rotationz,0;zoom,1.2;diffusealpha,0.2;decelerate,1.5;rotationz,0;zoom,1.5;diffusealpha,0;sleep,6;queuecommand,"Animate");
	};
	LoadActor( "rp00A1" )..{
		InitCommand=cmd(zoom,1.0;x,SCREEN_CENTER_X-570;y,SCREEN_CENTER_Y+190);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,3;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1.0;diffusealpha,0;rotationz,0;linear,0.65;rotationz,230;zoom,1.2;diffusealpha,0.2;decelerate,1.5;rotationz,490;zoom,1.5;diffusealpha,0;sleep,6;queuecommand,"Animate");
	};

	LoadActor( "rp002" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+270;y,SCREEN_CENTER_Y-190);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,2;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.05;diffusealpha,1;
		decelerate,1;zoom,1.1;diffusealpha,0;sleep,8;queuecommand,"Animate");
	};
	LoadActor( "rp003" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-383;y,SCREEN_CENTER_Y-96);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,3;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.05;diffusealpha,1;
		decelerate,1;zoom,1.1;diffusealpha,0;sleep,8;queuecommand,"Animate");
	};
	LoadActor( "Dot01" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-313;y,SCREEN_CENTER_Y-61);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,3.4;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.05;diffusealpha,1;
		decelerate,1;zoom,1.1;diffusealpha,0;sleep,8;queuecommand,"Animate");
	};
	LoadActor( "Dot01" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+403;y,SCREEN_CENTER_Y-119);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,3.8;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.05;diffusealpha,1;
		decelerate,1;zoom,1.1;diffusealpha,0;sleep,8;queuecommand,"Animate");
	};
	LoadActor( "Dot01" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-299;y,SCREEN_CENTER_Y+55);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,4.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.05;diffusealpha,1;
		decelerate,1;zoom,1.1;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};

	LoadActor( "Dot01" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+313;y,SCREEN_CENTER_Y-200);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,3.2;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.05;diffusealpha,1;
		decelerate,1;zoom,1.1;diffusealpha,0;sleep,8;queuecommand,"Animate");
	};
	LoadActor( "Dot01" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+303;y,SCREEN_CENTER_Y-190);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,3.4;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.1;diffusealpha,1;
		decelerate,1;zoom,1.2;diffusealpha,0;sleep,8;queuecommand,"Animate");
	};

	LoadActor( "rp004" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-304;y,SCREEN_CENTER_Y+109);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,4.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.05;diffusealpha,1;
		decelerate,1.5;zoom,1.1;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp004" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-307;y,SCREEN_CENTER_Y+427);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,4.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1.5;zoom,1.3;diffusealpha,0;sleep,8;queuecommand,"Animate");
	};


	LoadActor( "rp005" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-296;y,SCREEN_CENTER_Y-160);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,5.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp006" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-400;y,SCREEN_CENTER_Y+185);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,5.8;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp006" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+460;y,SCREEN_CENTER_Y+185);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,1.8;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp007" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-297;y,SCREEN_CENTER_Y+108);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,5.6;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp010" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+563;y,SCREEN_CENTER_Y+210);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,1.3;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp009" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+372;y,SCREEN_CENTER_Y-128);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,1.4;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp011" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+291;y,SCREEN_CENTER_Y-164);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,1.6;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp011" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+194;y,SCREEN_CENTER_Y-88);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,1.4;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp008" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+251;y,SCREEN_CENTER_Y-158);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp008" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+166;y,SCREEN_CENTER_Y-194);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.3;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};

	LoadActor( "rp013" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+253;y,SCREEN_CENTER_Y-19);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.0;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp013" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-261;y,SCREEN_CENTER_Y-448);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.1;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp013" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+180;y,SCREEN_CENTER_Y-100);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,1.25;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp013" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-219;y,SCREEN_CENTER_Y+88);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.12;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp013" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+233;y,SCREEN_CENTER_Y-105);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.6;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp013" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-167;y,SCREEN_CENTER_Y+195);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,0.9;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};
	LoadActor( "rp013" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y-200);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,3.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;linear,1;zoom,1.15;diffusealpha,1;
		decelerate,1;zoom,1.3;diffusealpha,0;sleep,7;queuecommand,"Animate");
	};


	--FLASH--------------------------------------------------
	LoadActor( "flash01.png" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-220;y,SCREEN_CENTER_Y-60);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,1.5;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;accelerate,0.3;zoom,1.05;diffusealpha,1;
		decelerate,0.5;zoom,1.1;diffusealpha,0;sleep,6.2;queuecommand,"Animate");
	};

	LoadActor( "flash01.png" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X-320;y,SCREEN_CENTER_Y+10);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,2.6;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1.8;diffusealpha,0;accelerate,0.3;zoom,2.05;diffusealpha,1;
		decelerate,0.5;zoom,2.1;diffusealpha,0;sleep,5.3;queuecommand,"Animate");
	};
	LoadActor( "flash01.png" )..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+390;y,SCREEN_CENTER_Y+100);
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0;sleep,3.7;queuecommand,"Animate");
		AnimateCommand=cmd(zoom,1;diffusealpha,0;accelerate,0.3;zoom,1.05;diffusealpha,1;
		decelerate,0.5;zoom,1.1;diffusealpha,0;sleep,8.4;queuecommand,"Animate");
	};
}

t[#t+1] = Def.ActorFrame{
  LoadActor( "lady" )..{
		InitCommand=cmd(xy,SCREEN_CENTER_X-382,SCREEN_CENTER_Y+15);
    OnCommand=cmd(addx,-100;linear,0.1;addx,100);
	};
}

t[#t+1] = Def.ActorFrame{
  InitCommand=cmd(Center);
  LoadActor( "logo white" )..{
    InitCommand=cmd(x,7;y,-2);
    OnCommand=cmd(diffusealpha,0;sleep,0.4;linear,0.1;diffusealpha,1);
  };
  LoadActor( "X2 Logo" )..{
    InitCommand=cmd(x,106;y,13;);
    OnCommand=cmd(zoom,2;diffusealpha,0;sleep,0.25;zoom,2;linear,0.1;zoom,0.95;linear,0.05;rotationz,2;diffusealpha,1;linear,0.1;zoom,1;rotationz,0;sleep,1);
	};
  LoadActor( "DDR" )..{
    InitCommand=cmd(x,-114;y,8;);
    OnCommand=cmd(zoom,2;diffusealpha,0;sleep,0.25;zoom,2;linear,0.1;zoom,0.95;diffusealpha,1;linear,0.1;zoom,1;sleep,1);
	};
}

return t;
