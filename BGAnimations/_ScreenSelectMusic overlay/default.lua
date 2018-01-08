local t = Def.ActorFrame {}
local st = GAMESTATE:GetCurrentStyle():GetStepsType();

if GAMESTATE:GetPlayMode() == 'PlayMode_Regular' and not Is2ndMIX() then
	-- TargetScore Bar
	local function Update(self, _)
		if GAMESTATE then
			local song = GAMESTATE:GetCurrentSong()
			local steps = {}
			local anyStepsChanged = false
			for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
				steps[pn] = GetCurrentSteps(pn)
				if steps[pn] ~= lastSteps[pn] then anyStepsChanged = true break end
			end
			local songChanged = song~=lastSong
			if songChanged or anyStepsChanged then
				MESSAGEMAN:Broadcast("SNDLUpdate", {SongChanged=songChanged, StepsChanged=anyStepsChanged})
			end
			lastSong = song
			lastSteps = steps
		end
	end

	-- Reset BGAnimations\ScreenTitleMenu background\default.lua
	local TargetBarP1 = getenv("TargetScoreBarP1");
	local TargetBarP2 = getenv("TargetScoreBarP2");
	local MenuState = {
		PlayerNumber_P1 = {
			Select = TargetBarP1,
		},
		PlayerNumber_P2 = {
			Select = TargetBarP2,
		},
	};
	-- TargetScore Bar
	-- 乱入OK用に調整、もし乱入不可にしたら再調整する
	for pn in ivalues(PlayerNumber) do
		local bTargetScore = TargetScore(pn);
		t[#t+1] = Def.ActorFrame {
			InitCommand=cmd(player,pn;zoom,0.75);
			OnCommand=function(self)
				if pn == PLAYER_1 then
					if MenuState[PLAYER_1].Select == 0 then
						self:x(SCREEN_LEFT-334);
						if bTargetScore == "off" then
							self:visible(false);
						end;
					elseif MenuState[PLAYER_1].Select == 2 then
						self:x(SCREEN_LEFT-334);
					else
						self:x(SCREEN_LEFT);
					end;
				else
					if MenuState[PLAYER_2].Select == 0 then
						self:x(SCREEN_RIGHT+334);
						if bTargetScore == "off" then
							self:visible(false);
						end;
					elseif MenuState[PLAYER_2].Select == 2 then
						self:x(SCREEN_RIGHT+334);
					else
						self:x(SCREEN_RIGHT);
					end;
				end;
			end;
			OffCommand=cmd(diffusealpha,0);
			CurrentSongChangedMessageCommand=function(self,params)
				local song = GAMESTATE:GetCurrentSong()
				if song then
					if pn == PLAYER_1 then
						if MenuState[PLAYER_1].Select == 0 then
							self:linear(0.25)
							self:x(SCREEN_LEFT-334)
						elseif MenuState[PLAYER_1].Select == 2 then
							self:linear(0.25)
							self:x(SCREEN_LEFT-334)
						else
							self:linear(0.25)
							self:x(SCREEN_LEFT)
						end;
					else
						if MenuState[PLAYER_2].Select == 0 then
							self:linear(0.25)
							self:x(SCREEN_RIGHT+334)
						elseif MenuState[PLAYER_2].Select == 2 then
							self:linear(0.25)
							self:x(SCREEN_RIGHT+334)
						else
							self:linear(0.25)
							self:x(SCREEN_RIGHT)
						end;
					end;
				else
					if pn == PLAYER_1 then
						if MenuState[PLAYER_1].Select == 0 then
							self:linear(0.25)
							self:x(SCREEN_LEFT-334)
						elseif MenuState[PLAYER_1].Select == 2 then
							self:linear(0.25)
							self:x(SCREEN_LEFT-334)
						else
							self:linear(0.25)
							self:x(SCREEN_LEFT-334)
						end;
					else
						if MenuState[PLAYER_2].Select == 0 then
							self:linear(0.25)
							self:x(SCREEN_RIGHT+334)
						elseif MenuState[PLAYER_2].Select == 2 then
							self:linear(0.25)
							self:x(SCREEN_RIGHT+334)
						else
							self:linear(0.25)
							self:x(SCREEN_RIGHT+334)
						end;
					end;
				end;
			end;
			CodeMessageCommand=function(self,params)
				if params.PlayerNumber ~= pn then return end
				if params.Name == 'Select' then
					local select = MenuState[params.PlayerNumber].Select
					local pname = ToEnumShortString(pn);
					if select == 0 or select == 2 then
						local env = GAMESTATE:Env()
						env.TargetOn = true
						self:visible(true);
						self:linear(0.25);
						if params.PlayerNumber == PLAYER_1 then
							self:x(SCREEN_LEFT);
						else
							self:x(SCREEN_RIGHT);
						end;
						setenv("TargetScoreBar"..pname,1);
						MenuState[params.PlayerNumber].Select = 1
					else
						local env = GAMESTATE:Env()
						env.TargetOn = false
						self:linear(0.25);
						if params.PlayerNumber == PLAYER_1 then
							self:x(SCREEN_LEFT-334);
						else
							self:x(SCREEN_RIGHT+334);
						end;
						setenv("TargetScoreBar"..pname,2);
						MenuState[params.PlayerNumber].Select = 2
					end;
					MESSAGEMAN:Broadcast("SelectButton", { Player = params.PlayerNumber, Input = params.Name, })
				elseif params.Name == 'SelectUp' then
					MESSAGEMAN:Broadcast("SelectUpButton", { Player = params.PlayerNumber, Input = params.Name, })
				elseif params.Name == 'SelectDown' then
					MESSAGEMAN:Broadcast("SelectDownButton", { Player = params.PlayerNumber, Input = params.Name, })
				end;
			end;
			SelectUpButtonMessageCommand=function(self,params)
				if params.Player ~= pn then return end
				self:visible(true);
			end;
			SelectDownButtonMessageCommand=function(self,params)
				if params.Player ~= pn then return end
				self:visible(true);
			end;
			LoadActor("TargetScore_Bar_Select")..{
				InitCommand=function(self)
					if PROFILEMAN:IsPersistentProfile(pn) then
						if bTargetScore == "machine" then
							self:y(SCREEN_CENTER_Y-118);
						elseif bTargetScore == "personal" then
							self:y(SCREEN_CENTER_Y-200);
						elseif bTargetScore == "off" then
							self:visible(false);
						end;
					else
						if bTargetScore == "machine" then
							self:y(SCREEN_CENTER_Y-200);
						elseif bTargetScore == "personal" then
							self:y(SCREEN_CENTER_Y-200);
						elseif bTargetScore == "off" then
							self:visible(false);
						end;
					end;
					if pn == PLAYER_1 then
						self:horizalign(left);
					else
						self:zoomx(-1);
						self:horizalign(left);
					end;
				end;
				SelectUpButtonMessageCommand=function(self,params)
					local bTargetScore = TargetScore(pn);
					if params.Player ~= pn then return end
					if PROFILEMAN:IsPersistentProfile(pn) then
						local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
						if bTargetScore == "off" then
							self:visible(true);
							self:y(SCREEN_CENTER_Y-118);
							WritePrefToFile("X3_TargetScore_"..profileGUID, 'machine');
						elseif bTargetScore == "personal" then
							self:visible(false);
							WritePrefToFile("X3_TargetScore_"..profileGUID, 'off');
						elseif bTargetScore == "machine" then
							self:visible(true);
							self:y(SCREEN_CENTER_Y-200);
							WritePrefToFile("X3_TargetScore_"..profileGUID, 'personal');
						end;
					else
						local pname = ToEnumShortString(pn);
						if bTargetScore == "off" then
							self:visible(true);
							self:y(SCREEN_CENTER_Y-200);
							WritePrefToFile("X3_TargetScore_"..pname, 'machine');
						elseif bTargetScore == "personal" then
							self:visible(false);
							WritePrefToFile("X3_TargetScore_"..pname, 'off');
						elseif bTargetScore == "machine" then
							self:visible(false);
							WritePrefToFile("X3_TargetScore_"..pname, 'off');
						end;
					end;
				end;
				SelectDownButtonMessageCommand=function(self,params)
					local bTargetScore = TargetScore(pn);
					if params.Player ~= pn then return end
					if PROFILEMAN:IsPersistentProfile(pn) then
						local profileGUID = PROFILEMAN:GetProfile(pn):GetGUID();
						if bTargetScore == "off" then
							self:visible(true);
							self:y(SCREEN_CENTER_Y-200);
							WritePrefToFile("X3_TargetScore_"..profileGUID, 'personal');
						elseif bTargetScore == "personal" then
							self:visible(true);
							self:y(SCREEN_CENTER_Y-118);
							WritePrefToFile("X3_TargetScore_"..profileGUID, 'machine');
						elseif bTargetScore == "machine" then
							self:visible(false);
							WritePrefToFile("X3_TargetScore_"..profileGUID, 'off');
						end;
					else
						local pname = ToEnumShortString(pn);
						if bTargetScore == "off" then
							self:visible(true);
							self:y(SCREEN_CENTER_Y-200);
							WritePrefToFile("X3_TargetScore_"..pname, 'machine');
						elseif bTargetScore == "personal" then
							self:visible(false);
							WritePrefToFile("X3_TargetScore_"..pname, 'off');
						elseif bTargetScore == "machine" then
							self:visible(false);
							WritePrefToFile("X3_TargetScore_"..pname, 'off');
						end;
					end;
				end;
				SetCommand=function(self)
					if not GAMESTATE:IsSideJoined(pn) then return end;
					local bTargetScore = TargetScore(pn);
					if PROFILEMAN:IsPersistentProfile(pn) then
						if bTargetScore == "machine" then
							self:y(SCREEN_CENTER_Y-118);
						elseif bTargetScore == "personal" then
							self:y(SCREEN_CENTER_Y-200);
						elseif bTargetScore == "off" then
							self:visible(false);
						end;
					else
						if bTargetScore == "machine" then
							self:y(SCREEN_CENTER_Y-200);
						elseif bTargetScore == "personal" then
							self:y(SCREEN_CENTER_Y-200);
						elseif bTargetScore == "off" then
							self:visible(false);
						end;
					end;
				end;
				SelectButtonMessageCommand=cmd(playcommand,"Set");
			};
			-- Sound
			LoadActor( THEME:GetPathS("", "_switch up") ) .. {
				SelectUpButtonMessageCommand=function(self,params)
					if params.Player ~= pn then return end
					self:play();
				end;
			};
			LoadActor( THEME:GetPathS("", "_switch down") ) .. {
				SelectDownButtonMessageCommand=function(self,params)
					if params.Player ~= pn then return end
					self:play();
				end;
			};
			LoadActor( THEME:GetPathS("", "_swoosh normal") ) .. {
				SelectButtonMessageCommand=function(self,params)
					if params.Player ~= pn then return end
					self:play();
				end;
			};
			-- BestScore
			Def.ActorFrame {
				InitCommand=function(self)
					self:y(SCREEN_CENTER_Y-200);
					if PROFILEMAN:IsPersistentProfile(pn) then
						self:visible(true);
					else
						self:visible(false);
					end;
				end;
				SetCommand=function(self)
					if not GAMESTATE:IsSideJoined(pn) then return end;
					if PROFILEMAN:IsPersistentProfile(pn) then
						self:visible(true);
					else
						self:visible(false);
					end;
				end;
				SelectButtonMessageCommand=cmd(playcommand,"Set");
				-- Back
				LoadActor("TargetScore_Bar_Back")..{
					InitCommand=function(self)
						if pn == PLAYER_1 then
							self:horizalign(left);
						else
							self:zoomx(-1);
							self:horizalign(left);
						end;
					end;
				};
				-- Text
				LoadFont("common normal") .. {
					InitCommand=function(self)
						self:settext("MY BEST SCORE");
						if pn == PLAYER_1 then
							self:x(356);
						else
							self:x(-356);
						end;
						(cmd(diffuse,color("#fff90a");y,-22;zoom,0.75;uppercase,true))(self)
					end;
				};
				-- Name
				LoadFont("_sveningsson Bold 60px")..{
					InitCommand=function(self)
						if pn == PLAYER_1 then
							self:horizalign(left);
							self:x(150);
						else
							self:horizalign(left);
							self:x(-440);
						end;
						(cmd(y,-1;zoomy,0.5;zoomx,0.5;maxwidth,416;uppercase,true;strokecolor,color("0,0,0,1")))(self)
					end;
					SetCommand=function(self)
						if MenuState[pn].Select == 0 then return end;
						if not GAMESTATE:IsSideJoined(pn) then return end;
						if not PROFILEMAN:IsPersistentProfile(pn) then return end;
						local SongorCourse, StepsOrTrail;
						if GAMESTATE:IsCourseMode() then
							SongOrCourse = GAMESTATE:GetCurrentCourse();
							StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
						else
							SongOrCourse = GAMESTATE:GetCurrentSong();
							StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
						end;

						local profile, scorelist;
						local text = "";
						if SongOrCourse and StepsOrTrail then
							local st = StepsOrTrail:GetStepsType();
							local diff = StepsOrTrail:GetDifficulty();
							local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

							if PROFILEMAN:IsPersistentProfile(pn) then
								-- player profile
								profile = PROFILEMAN:GetProfile(pn);
								name = profile:GetDisplayName();
							else
								-- machine profile
								profile = PROFILEMAN:GetMachineProfile();
								name = "STEP";
							end;
							scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
							assert(scorelist)
							local scores = scorelist:GetHighScores();
							local topscore=0;
							if scores[1] then
								topscore = scores[1]:GetScore();
							end;
							assert(topscore);
							if topscore ~= 0 then
									self:settext(name);
							else
								self:settext(" - - - - - - - -");
							end;
						else
							self:settext(" - - - - - - - -");
						end;
					end;
					CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
					CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
					CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
					SelectButtonMessageCommand=cmd(playcommand,"Set");
				};
				-- Score
				Def.RollingNumbers {
					File=THEME:GetPathF("","_helveticaneuelt pro 65 md Bold 24px");
					InitCommand=function(self)
						if pn == PLAYER_1 then
							self:horizalign(right);
							self:x(440);
						else
							self:horizalign(left);
							self:x(-440);
						end;
						(cmd(Load,"RollingNumbersScore";zoomy,0.9;y,15;diffuse,color("#ffff99");strokecolor,color("#000000");playcommand,"Set"))(self)
					end;
					SetCommand=function(self)
						if MenuState[pn].Select == 0 then return end;
						if not GAMESTATE:IsSideJoined(pn) then return end;
						if not PROFILEMAN:IsPersistentProfile(pn) then return end;
						local SongorCourse, StepsOrTrail;
						if GAMESTATE:IsCourseMode() then
							SongOrCourse = GAMESTATE:GetCurrentCourse();
							StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
						else
							SongOrCourse = GAMESTATE:GetCurrentSong();
							StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
						end;

						local profile, scorelist;
						local text = "";
						if SongOrCourse and StepsOrTrail then
							local st = StepsOrTrail:GetStepsType();
							local diff = StepsOrTrail:GetDifficulty();
							local courseType = GAMESTATE:IsCourseMode() and SongOrCourse:GetCourseType() or nil;

							if PROFILEMAN:IsPersistentProfile(pn) then
								-- player profile
								profile = PROFILEMAN:GetProfile(pn);
								name = profile:GetDisplayName();
							else
								-- machine profile
								profile = PROFILEMAN:GetMachineProfile();
								name = "STEP";
							end;
							scorelist = profile:GetHighScoreList(SongOrCourse,StepsOrTrail);
							assert(scorelist)
							local scores = scorelist:GetHighScores();
							local topscore=0;
							if scores[1] then
								topscore = 10*math.round(SN2Scoring.GetSN2ScoreFromHighScore(StepsOrTrail, scores[1])/10)
							end;
							assert(topscore);
							if topscore ~= 0 then
								local scorel3 = topscore%1000;
								local scorel2 = (topscore/1000)%1000;
								local scorel1 = (topscore/1000000)%1000000;
							text = string.format("%01d"..",".."%03d"..",".."%03d",scorel1,scorel2,scorel3);
							else
								text = "0,000,000";
							end;
						else
							text = "0,000,000";
						end;
						self:settext(text);
					end;
					CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
					CurrentTrailP1ChangedMessageCommand=cmd(playcommand,"Set");
					CurrentTrailP2ChangedMessageCommand=cmd(playcommand,"Set");
					SelectButtonMessageCommand=cmd(playcommand,"Set");
				};
				-- Color Icon
				LoadActor("TargetScore_Bar_Icon_Normal")..{
					InitCommand=function(self)
						if pn == PLAYER_1 then
							self:x(462);
						else
							self:zoomx(-1);
							self:x(-462);
						end;
					end;
				};
				-- Text Icon
				Def.Sprite {
					InitCommand=function(self)
						if pn == PLAYER_1 then
							self:x(462);
						else
							self:x(-462);
						end;
						(cmd(playcommand,"Set"))(self)
					end;
					SetCommand=function(self)
						if pn == PLAYER_1 then
							self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_P1_Black"));
						else
							self:Load(THEME:GetPathB("ScreenSelectMusic","overlay/TargetScore_Bar_Icon_P2_Black"));
						end;
					end;
				};
			};
		};
	end;
end;

return t
