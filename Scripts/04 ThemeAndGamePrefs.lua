function ScreenGameplay_P1X()
	local st = GAMESTATE:GetCurrentStyle():GetStepsType();
	if st == "StepsType_Dance_Solo" then
		return SCREEN_CENTER_X;
	elseif st == "StepsType_Dance_Couple" then
		return WideScale(SCREEN_CENTER_X-175,SCREEN_CENTER_X-160);
	else
		return WideScale(SCREEN_CENTER_X-175,SCREEN_CENTER_X-240);
	end
end
function ScreenGameplay_P2X()
	local st = GAMESTATE:GetCurrentStyle():GetStepsType();
	if st == "StepsType_Dance_Solo" then
		return SCREEN_CENTER_X;
	elseif st == "StepsType_Dance_Couple" then
		return WideScale(SCREEN_CENTER_X+175,SCREEN_CENTER_X+160);
	else
		return WideScale(SCREEN_CENTER_X+175,SCREEN_CENTER_X+240);
	end
end
function ScreenGameplayLifeY()
	return SCREEN_TOP+35
end

function play_sample_music()
    if GAMESTATE:IsCourseMode() then return end
    local song = GAMESTATE:GetCurrentSong()

    if song then
        local songpath = song:GetMusicPath()
        local sample_start = song:GetSampleStart()
        local sample_len = song:GetSampleLength()

        if songpath and sample_start and sample_len then
            SOUND:DimMusic(PREFSMAN:GetPreference("SoundVolume"), math.huge)
            SOUND:PlayMusicPart(songpath, sample_start,sample_len, 0.5, 1.5, true, true)
        else
            stop_music()
        end
    else
        stop_music()
    end
end

function stop_music()
    SOUND:PlayMusicPart("", 0, 0)
end
