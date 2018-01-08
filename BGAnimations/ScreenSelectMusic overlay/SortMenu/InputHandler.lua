local sort_wheel = ...

-- this handles user input
local function input(event)
	if not event.PlayerNumber or not event.button then
		return false
	end

	if event.type ~= "InputEventType_Release" then
		local overlay = SCREENMAN:GetTopScreen():GetChild("Overlay")

		if event.GameButton == "MenuRight" then
			sort_wheel:scroll_by_amount(1)
			overlay:GetChild("SortMenu"):GetChild("change_sound"):play()

		elseif event.GameButton == "MenuLeft" then
			sort_wheel:scroll_by_amount(-1)
			overlay:GetChild("SortMenu"):GetChild("change_sound"):play()

		elseif event.GameButton == "Start" then
			overlay:GetChild("SortMenu"):GetChild("start_sound"):play()
			local focus = sort_wheel:get_actor_item_at_focus_pos()
			MESSAGEMAN:Broadcast('Sort',{order=focus.sort_by})
			overlay:queuecommand("HideSortMenu")

		elseif event.GameButton == "Back" or event.GameButton == "Select" then
			overlay:queuecommand("HideSortMenu")
		end
	end

	return false
end

return input
