-- the metatable for an item in the sort_wheel
return {
	__index = {
		create_actors = function(self, name)
			self.name=name

			local af = Def.ActorFrame{
				Name=name,

				InitCommand=function(subself)
					self.container = subself
					subself:MaskDest()
					subself:diffusealpha(0)
				end,
			}

			-- top text
			af[#af+1] = LoadFont("Common Normal")..{
				Text="",
				InitCommand=function(subself)
					subself:diffusealpha(0)
					subself:horizalign(left)
					subself:addx(-30);
					subself:addy(-25);
					self.text= subself
				end,
				OnCommand=function(self)
					self:addx(-30);
					self:addy(-25);
					self:sleep(0.13)
					self:horizalign(left)
					self:linear(0.05)
					self:diffusealpha(1)
				end
			}

			return af
		end,

		transform = function(self, item_index, num_items, has_focus)
			self.container:finishtweening()

			if has_focus then
				self.container:accelerate(0.15)
				self.container:zoom(1)
				self.container:diffuse(color("#ffffff"))
				self.container:glow(color("1,1,1,0.5"))
			else
				self.container:glow(color("1,1,1,0"))
				self.container:accelerate(0.15)
				self.container:zoom(1)
				self.container:diffuse(color("#888888"))
				self.container:glow(color("1,1,1,0"))
			end

			self.container:y(36 * (item_index - math.ceil(num_items/2)))

			if item_index <= 1 or  item_index >= num_items then
				self.container:diffusealpha(0)
			else
				self.container:diffusealpha(1)
			end
		end,

		set = function(self, info)
			if not info then self.text:settext("") return end
			self.info= info
			self.kind = info[1]

			if self.kind == "SortBy" then
				self.sort_by = info[2]
			end
			
			self.text:settext(THEME:GetString("ScreenSelectMusic", info[2]))
		end
	}
}
