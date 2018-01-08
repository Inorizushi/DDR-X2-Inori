return Def.ActorFrame {
 	LoadFont("_helveticaneuelt pro 65 md Bold 24px") .. {
		Name="TextTitle";
		InitCommand=cmd(y,-16.5;zoom,1;maxwidth,256/0.875;shadowlength,1;zoomy,0;diffusealpha,0.8);
    OnCommand=cmd(sleep,0.333;decelerate,0.133;diffusealpha,0.8;accelerate,0.033;zoomy,1.07;zoomx,1.07;decelerate,0.033;zoomx,1;zoomy,1);
  	OffCommand=cmd(sleep,0.0000;sleep,0.333;decelerate,0.066;zoom,1.05;diffusealpha,0);
	};
 	LoadFont("_helveticaneuelt pro 65 md Bold 24px") .. {
		Name="TextSubtitle";
		InitCommand=cmd(zoom,0.5;maxwidth,256/0.5;shadowlength,1;zoomy,0;diffusealpha,0.8);
    OnCommand=cmd(sleep,0.333;decelerate,0.133;diffusealpha,0.8;accelerate,0.033;zoomy,1.07;zoomx,1.07;decelerate,0.033;zoomx,1;zoomy,1);
  	OffCommand=cmd(sleep,0.0000;sleep,0.333;decelerate,0.066;zoom,1.05;diffusealpha,0);
		};
	LoadFont("_helveticaneuelt pro 65 md Bold 24px") .. {
		Name="TextArtist";
		InitCommand=cmd(y,18;zoom,0.75;maxwidth,256/0.75;shadowlength,1;zoomy,0;diffusealpha,0.8);
    OnCommand=cmd(sleep,0.333;decelerate,0.133;diffusealpha,0.8;accelerate,0.033;zoomy,1.07;zoomx,1.07;decelerate,0.033;zoomx,1;zoomy,1);
  	OffCommand=cmd(sleep,0.0000;sleep,0.333;decelerate,0.066;zoom,1.05;diffusealpha,0);
		};
};
