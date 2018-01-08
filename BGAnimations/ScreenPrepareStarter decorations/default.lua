local t = Def.ActorFrame{};

if IsStarterMode() then
	t[#t+1] = Def.ActorFrame{
		InitCommand=function(s) s:Center() end,
		Def.Quad{
			InitCommand=function(s) s:diffuse(color "#000000"):zoomx(SCREEN_WIDTH):zoomy(64):diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.5):linear(0.2):diffusealpha(1):queuecommand("StarterBuild") end,
			StarterBuildCommand=function(s) AssembleStarter(); MESSAGEMAN:Broadcast("BuildDone") end,
			BuildDoneMessageCommand=function(s) s:linear(0.2):diffusealpha(0) end
		};
		Def.BitmapText{
			Text = "Please wait...",
			Font = "_handelgothic bt 20px",
			InitCommand=function(s) s:diffusealpha(0) end,
			OnCommand=function(s) s:sleep(0.5):linear(0.2):diffusealpha(1) end,
			BuildDoneMessageCommand=function(s) s:linear(0.2):diffusealpha(0) end
		}
	}
end

return t;
