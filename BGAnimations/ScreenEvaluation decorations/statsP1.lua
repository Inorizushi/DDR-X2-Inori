local t = Def.ActorFrame {};

local Combo = 	STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):MaxCombo();

local Marvelous = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W1");
local Perfect = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W2");
local Great = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W3");
local Good = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_W4");
local Ok = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetHoldNoteScores("HoldNoteScore_Held");
local Miss = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetTapNoteScores("TapNoteScore_Miss");

local Score = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):GetScore();

--Max Combo--

t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("","ScreenEvaluation judge");
			InitCommand=cmd(player,PLAYER_1;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,1;draworder,5;y,SCREEN_CENTER_Y+178;halign,1);
			OnCommand = function(self)
				self:Load("RollingNumbersJudgment");
				self:targetnumber(Combo);
			end;
		};
--Marvelous--
t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("","ScreenEvaluation judge");
			InitCommand=cmd(player,PLAYER_1;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,1;draworder,6;y,SCREEN_CENTER_Y-14;halign,1);
			OnCommand = function(self)
				self:Load("RollingNumbersJudgment");
				self:targetnumber(Marvelous);
			end;
		};
--Perfect--
t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("","ScreenEvaluation judge");
			InitCommand=cmd(player,PLAYER_1;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,1;draworder,6;y,SCREEN_CENTER_Y+18;halign,1);
			OnCommand = function(self)
				self:Load("RollingNumbersJudgment");
				self:targetnumber(Perfect);
			end;
		};
--Great--
t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("","ScreenEvaluation judge");
			InitCommand=cmd(player,PLAYER_1;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,1;draworder,6;y,SCREEN_CENTER_Y+50;halign,1);
			OnCommand = function(self)
				self:Load("RollingNumbersJudgment");
				self:targetnumber(Great);
			end;
		};
--Good--
t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("","ScreenEvaluation judge");
			InitCommand=cmd(player,PLAYER_1;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,1;draworder,6;y,SCREEN_CENTER_Y+82;halign,1);
			OnCommand = function(self)
				self:Load("RollingNumbersJudgment");
				self:targetnumber(Good);
			end;
		};
--Ok--
t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("","ScreenEvaluation judge");
			InitCommand=cmd(player,PLAYER_1;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,1;draworder,6;y,SCREEN_CENTER_Y+114;halign,1);
			OnCommand = function(self)
				self:Load("RollingNumbersJudgment");
				self:targetnumber(Ok);
			end;
		};

--Miss--(Miss)
t[#t+1] = Def.RollingNumbers {
			File = THEME:GetPathF("","ScreenEvaluation judge");
			InitCommand=cmd(player,PLAYER_1;diffuse,color("#ffffff");strokecolor,color("#000000");zoom,1;draworder,6;y,SCREEN_CENTER_Y+146;halign,1);
			OnCommand = function(self)
				self:Load("RollingNumbersJudgment");
				self:targetnumber(Miss);
			end;
		};

return t;
