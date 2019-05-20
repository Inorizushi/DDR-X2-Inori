local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")
t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay")..{
	InitCommand = cmd(draworder,110);
};

t[#t+1] = StandardDecorationFromFileOptional("SortOrder","SortOrderText") .. {
	BeginCommand=cmd(playcommand,"Set");
	SortOrderChangedMessageCommand=cmd(playcommand,"Set";);
	SetCommand=function(self)
		local s = SortOrderToLocalizedString( GAMESTATE:GetSortOrder() );
		self:settext( s );
		self:playcommand("Sort");
	end;
};

t[#t+1] = Def.ActorFrame{
	LoadActor("bpm")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+70;y,SCREEN_CENTER_Y-266);
		OnCommand=cmd(diffusealpha,0;sleep,0.2;diffusealpha,1);
		OffCommand=cmd(stoptweening;sleep,0.25;linear,0.1;diffusealpha,0);
	};
};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+170;zoom,1);
	OnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.1;diffusealpha,1);
	OffCommand=cmd(stoptweening;sleep,0.25;linear,0.1;diffusealpha,0);
	LoadActor("pane base");
};


t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(y,SCREEN_CENTER_Y+170;x,SCREEN_CENTER_X+154;diffuse,color("0,0,0,1"));
	LoadActor("diffbg.png")..{
		InitCommand=cmd(y,-80);
		OnCommand=cmd(cropright,1;sleep,0.576;linear,0.5;cropright,0);
		OffCommand=cmd(stoptweening;sleep,0.25;linear,0.1;diffusealpha,0);
	};
	LoadActor("diffbg.png")..{
		InitCommand=cmd(y,-40);
		OnCommand=cmd(cropright,1;sleep,0.486;linear,0.5;cropright,0);
		OffCommand=cmd(stoptweening;sleep,0.25;linear,0.1;diffusealpha,0);
	};
	LoadActor("diffbg.png")..{
		InitCommand=cmd(y,0);
		OnCommand=cmd(cropright,1;;sleep,0.446;linear,0.5;cropright,0);
		OffCommand=cmd(stoptweening;sleep,0.25;linear,0.1;diffusealpha,0);
	};
	LoadActor("diffbg.png")..{
		InitCommand=cmd(y,40);
		OnCommand=cmd(cropright,1;sleep,0.486;linear,0.5;cropright,0);
		OffCommand=cmd(stoptweening;sleep,0.25;linear,0.1;diffusealpha,0);
	};
	LoadActor("diffbg.png")..{
		InitCommand=cmd(y,80);
		OnCommand=cmd(cropright,1;sleep,0.576;linear,0.5;cropright,0);
		OffCommand=cmd(stoptweening;sleep,0.25;linear,0.1;diffusealpha,0);
	};

};

t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(x,SCREEN_CENTER_X-326;y,SCREEN_CENTER_Y+172);
	OnCommand=cmd(zoom,0;sleep,0.25;accelerate,0.2;zoom,1);
	OffCommand=cmd(stoptweening;sleep,0.25;linear,0.1;diffusealpha,0);
	LoadActor("radar base");
	LoadActor( "radar_scan" )..{
		InitCommand=cmd(halign,0;valign,0;xy,0,0;zoom,1.05;blend,Blend.Add;diffusealpha,0.5);
		OnCommand=cmd(spin;effectmagnitude,0,0,120);
		OffCommand=cmd(stopeffect);
	};
};

t[#t+1] = Def.ActorFrame{
	OffCommand=cmd(stoptweening;sleep,0.25;linear,0.1;diffusealpha,0);
	LoadActor("line")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-164;y,SCREEN_CENTER_Y+168;zoom,1);
		OnCommand=cmd(croptop,1;cropbottom,1;sleep,0.2;linear,0.6;croptop,0;cropbottom,0);
	};
	LoadActor("label_stream")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-326;y,SCREEN_CENTER_Y+82);
		OnCommand=cmd(zoom,0;sleep,0.2;linear,0.2;zoom,1);
	};
	LoadActor("label_voltage")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-438;y,SCREEN_CENTER_Y+146);
		OnCommand=cmd(zoom,0;sleep,0.2;linear,0.2;zoom,1);
	};
	LoadActor("label_chaos")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-212;y,SCREEN_CENTER_Y+146);
		OnCommand=cmd(zoom,0;sleep,0.2;linear,0.2;zoom,1);
	};
	LoadActor("label_air")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-404;y,SCREEN_CENTER_Y+247);
		OnCommand=cmd(zoom,0;sleep,0.2;linear,0.2;zoom,1);
	};
	LoadActor("label_freeze")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-253;y,SCREEN_CENTER_Y+247);
		OnCommand=cmd(zoom,0;sleep,0.2;linear,0.2;zoom,1);
	};
};

t[#t+1] = LoadActor("X2DifficultyList.lua");
-------------------------------------------------------------------------------------------------------------------
-- Groove Radars
-------------------------------------------------------------------------------------------------------------------
t[#t+1] = StandardDecorationFromFileOptional( "GrooveRadarP1_Default", "GrooveRadarP1_Default" );
t[#t+1] = StandardDecorationFromFileOptional( "GrooveRadarP2_Default", "GrooveRadarP2_Default" );

-- song options text (e.g. 1.5xmusic)
t[#t+1] = StandardDecorationFromFileOptional("SongOptions","SongOptions")

-- other items (balloons, etc.)
t[#t+1] = StandardDecorationFromFile( "Balloon", "Balloon" );
t[#t+1] = Def.ActorFrame {
	LoadActor(THEME:GetPathS("","Music_In"))..{
		OnCommand=cmd(play);
	};
};

if GAMESTATE:IsCourseMode() == false then
t[#t+1] = Def.ActorFrame{
	Def.ActorFrame{
		NextSongMessageCommand=cmd(finishtweening;linear,0;x,SCREEN_CENTER_X+154+20;decelerate,0.5;x,SCREEN_CENTER_X+154);
		InitCommand=cmd(draworder,99;x,SCREEN_CENTER_X+154;y,SCREEN_CENTER_Y-20;zoom,1);
		OffCommand=cmd(sleep,0.5;linear,0.4;diffusealpha,0;addx,SCREEN_WIDTH);
		LoadActor("_selectarrowRightG");
		LoadActor("_selectarrowRightR") .. {
			InitCommand=cmd(diffusealpha,0;draworder,100);
			NextSongMessageCommand=cmd(finishtweening;diffusealpha,1;sleep,0.4;diffusealpha,0);
		};
	};
	Def.ActorFrame{
		InitCommand=cmd(draworder,99;x,SCREEN_CENTER_X-154;y,SCREEN_CENTER_Y-20;rotationy,180;zoom,1);
		OffCommand=cmd(sleep,0.5;linear,0.4;diffusealpha,0;addx,-SCREEN_WIDTH);
		PreviousSongMessageCommand=cmd(finishtweening;linear,0;x,SCREEN_CENTER_X-154-20;decelerate,0.5;x,SCREEN_CENTER_X-154);
		LoadActor("_selectarrowRightG");
		LoadActor("_selectarrowRightR") .. {
			InitCommand=cmd(diffusealpha,0;draworder,100);
			PreviousSongMessageCommand=cmd(finishtweening;diffusealpha,1;sleep,0.4;diffusealpha,0);
		};
	};
};
end

t[#t+1] = LoadActor( "_ShockArrow_mark 1P" ) .. {
	InitCommand=cmd(draworder,100;x,SCREEN_CENTER_X-104;y,SCREEN_CENTER_Y-20;zoom,1;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,0.85,0.85,0.85,1;effectperiod,0.25;playcommand,"Set");
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		local diffuse = 0
		if song then
			local steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
			if steps then
				if steps:GetRadarValues(PLAYER_1):GetValue('RadarCategory_Mines') == 0 then
					yZoom = 0
				else
					yZoom = 1
				end
			else
				yZoom = 0
			end
		else
			yZoom = 0
		end
		self:finishtweening()
		self:zoomy(yZoom)
	end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
	OffCommand=cmd(stoptweening;sleep,0.25;linear,0.1;diffusealpha,0);
};

-- ShockArrow mark 2P
t[#t+1] = LoadActor( "_ShockArrow_mark 2P" ) .. {
	InitCommand=cmd(draworder,100;x,SCREEN_CENTER_X+104;y,SCREEN_CENTER_Y-20;zoom,1;diffuseshift;effectcolor1,1,1,1,1;effectcolor2,0.85,0.85,0.85,1;effectperiod,0.25;playcommand,"Set");
	SetCommand=function(self)
		local yZoom = 0
		if GAMESTATE:GetCurrentSong() then
			local steps = GAMESTATE:GetCurrentSteps(PLAYER_2)
			if steps then
				if steps:GetRadarValues(PLAYER_2):GetValue('RadarCategory_Mines') == 0 then
					yZoom = 0
				else
					yZoom = 1
				end
			else
				yZoom = 0
			end
		else
			yZoom = 0
		end
		self:finishtweening()
		self:zoomy(yZoom)
	end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
	OffCommand=cmd(decelerate,0.25;zoomy,0);
};

t[#t+1] = LoadActor( "ST.png" )..{
		OnCommand=function(self)
			if(GAMESTATE:IsCourseMode()) then
				(cmd(x,SCREEN_CENTER_X-150;y,SCREEN_CENTER_Y+30;diffusealpha,0;sleep,0.2;decelerate,0.15;diffusealpha,1;))(self);
			else
				(cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+32;diffusealpha,0;sleep,0.2;decelerate,0.15;diffusealpha,1;))(self);
			end

		end;
		OffCommand=cmd(stoptweening;sleep,0.25;linear,0.1;diffusealpha,0);
	};


local ut = Def.ActorFrame{
	LoadFont("_helvetica Bold 24px")..{
		Name="songTitle";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+20;zoom,0.9;diffuse,color("0,0,0,1");strokecolor,color("#ffffff"));
		OnCommand=cmd(diffusealpha,0;sleep,0.4;diffusealpha,1);
		OffCommand=cmd(sleep,0.5;addy,900);
		SetCommand=function(self)
			local song;
			local tit="";
			if GAMESTATE:IsCourseMode() then
				song=GAMESTATE:GetCurrentCourse();
				tit=song:GetDisplayFullTitle();

			else
				song=GAMESTATE:GetCurrentSong();
				tit=song:GetDisplayMainTitle();
			end;
			self:settextf("%s",tit);
		end;
	};
	LoadFont("_helvetica Bold 24px")..{
		Name="songArtist";
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+34;zoom,0.8;diffuse,color("#000000");strokecolor,color("#ffffff");draworder,2);
		OnCommand=cmd(diffusealpha,0;sleep,0.4;diffusealpha,1);
		OffCommand=cmd(sleep,0.5;addy,900);
		SetCommand=function(self)
			local song;
			local sub="";
			local art="";
			if GAMESTATE:IsCourseMode() then
			else
				song=GAMESTATE:GetCurrentSong();
				sub=song:GetDisplaySubTitle();
				art=song:GetDisplayArtist();
				self:settextf("%s\n%s",sub,art);
			end;
		end;
	};
};

local function updateTitle(self)
	local upTit = self:GetChild("songTitle");
	local upArt = self:GetChild("songArtist");
	local curSelection = GAMESTATE:GetCurrentSong();
	local curSelCourse = GAMESTATE:GetCurrentCourse();
	upTit:maxwidth(600);
	upArt:maxwidth(600);
	if curSelection or curSelCourse then
		local song;
		local tit="";
		local sub="";
		local art="";
		if GAMESTATE:IsCourseMode() then
			song=GAMESTATE:GetCurrentCourse();
			tit=song:GetDisplayFullTitle();
			upTit:settextf("%s",tit);
		else
			song=GAMESTATE:GetCurrentSong();
			tit=song:GetDisplayMainTitle();
			sub=song:GetDisplaySubTitle();
			art=song:GetDisplayArtist();
			upTit:settextf("%s",tit..sub);
		end;
		upTit:diffuse(color("0,0,0,1"));
		upTit:strokecolor(Color("White"));

		upArt:settextf("\n%s",art);
		upArt:diffuse(color("0,0,0,1"));
		upArt:strokecolor(Color("White"));
	else
		upTit:settext("");
		upArt:settext("");
	end;
end;

ut.InitCommand=cmd(SetUpdateFunction,updateTitle);


t[#t+1] = ut;

return t
