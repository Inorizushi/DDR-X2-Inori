local group;

local t = Def.ActorFrame{
	OnCommand=cmd(zoomy,0;sleep,0.2;accelerate,0.1;zoomy,1.1;decelerate,0.2;zoomy,1);
	OffCommand=cmd(sleep,0.2;accelerate,0.1;zoom,1.4;decelerate,0.1;zoom,0);
	Def.Sprite {
		SetMessageCommand=function(self,params)
			group = params.Text;
			local so = GAMESTATE:GetSortOrder();
			if group then
				if so == "SortOrder_Group" then
					if group_name[group] ~= nil then
						local filePath = THEME:GetPathG("","_jackets/group/"..group_name[group]..".png");
						self:Load(filePath)
						self:diffusealpha(1);
					else
						self:Load( THEME:GetPathG("","_No banner") );
						self:diffusealpha(0);
					end;
				end;
			end;
		end;
	};
	Def.Banner {
	Name="SongBanner";
	InitCommand=cmd(scaletoclipped,256,256;diffusealpha,0;);
	SetMessageCommand=function(self,params)
		local pt_text = params.Text;
		local group = params.Text;
		if group then
			if params.HasFocus then
				setenv("getgroupname",pt_text);
			end;
			if group_name[group] ~= nil then
				self:Load( THEME:GetPathG("","_No banner") );
				self:diffusealpha(0);
			else
				self:LoadFromSongGroup(group);
				self:diffusealpha(1);
			end;
		else
			-- call fallback
			self:Load( THEME:GetPathG("","_No banner") );
			self:diffusealpha(1);
		end;

	end;
	};
	LoadFont("_helvetica Bold 24px")..{
		InitCommand=cmd(y,-84;addx,-5;maxwidth,150);
		SetMessageCommand=function(self, params)
			local song = params.Song;
			group = params.Text;
			local so = GAMESTATE:GetSortOrder();
			if group_name[group] ~= nil then
				self:settext("");
			else
				if so == "SortOrder_Group" then
					self:settext(group);
					self:strokecolor(color("#000000"))
					self:diffuse(color("#FFFFFF"));
				else
					self:settext("");
				end;
			end;
		end;
	};
	-- Def.Banner {
		-- Name="SongBanner";
		-- InitCommand=cmd(scaletoclipped,220,220;);
		-- SetMessageCommand=function(self,params)
			-- self:Load( THEME:GetPathG("group jacket","series blackcorder") );
		-- end;
	-- };
	-- Def.Banner {
		-- Name="SongBanner";
		-- InitCommand=cmd(scaletoclipped,220,220;y,220;rotationx,180;croptop,0.5;diffusealpha,0.5;diffusetopedge,1,1,1,0);
		-- SetMessageCommand=function(self,params)
			-- self:Load( THEME:GetPathG("group jacket","series blackcorder") );
		-- end;
	-- };


	Def.ActorFrame{
		LoadActor("folder top")..{
			InitCommand=cmd(y,-128);
		};
		LoadActor("folder bottom")..{
			InitCommand=cmd(y,112);
		};
	};
};
return t;
