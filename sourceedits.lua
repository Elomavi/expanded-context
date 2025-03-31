sourceedits =
{
	["scriptfunc"] =
	{
		{
		find = [[if (not intsc and is_sim)
					or (intsc and is_int) then
						setColorArr(s.syntaxcolor_command)]],
			
		replace = [[if (not intsc and is_sim)
		or (intsc and is_int) then
			if intsc and (partss[1] == "iftrinkets" or partss[1] == "iftrinketsless" 
			or partss[1] == "ifflag" or partss[1] == "iflast"
			or partss[1] == "loadscript" or partss[1] == "teleportscript") then
				setColorArr({238,220,02})
				--Hardcoded color value for now, Dav will add this in a future patch and implement it properly so I'm not going to bother fixing this here
			else
				setColorArr(s.syntaxcolor_command)
			end]],

			ignore_error = false,
			luapattern = false,
			allowmultiple = true,
		},
		{
		find = [[elseif (
		parts[1] == "iftrinkets"
		or parts[1] == "iftrinketsless"]],
		
		replace = [[elseif (internalscript or cutscenebarsinternalscript)
		and (parts[1] == "iftrinkets" or parts[1] == "iftrinketsless" 
		or parts[1] == "ifflag" or parts[1] == "iflast"
		or parts[1] == "loadscript" or parts[1] == "teleportscript") then
			return "mainscript_failsafe", parts[1]
		elseif (parts[1] == "createentity" and parts[4] ~= nil and parts[4] ~= "") then
			return "entity_list", parts[4], parts[5], parts[6]
		elseif (
			parts[1] == "iftrinkets" and not intsc
			or parts[1] == "iftrinketsless" and not intsc]]
	}
},
	["uis/scripteditor/draw"] =
	{
		{
		find = [[elseif context == "track" then]],
			
		replace = [[
		elseif context == "mainscript_failsafe" then
			ved_printf("This command points to a main-game script!", love.graphics.getWidth()-(128-8), 8+(24*12)+4, 128-16, "center")
		elseif context == "entity_list" then
			local entity = getEntitybyID(carg1)
			local text_offset = 0
			if entity == nil then
				ved_printf("This entity doesn't exist!", love.graphics.getWidth()-(128-8), 8+(24*12)+4, 128-16, "center")
			else
				-- Draw Visual Sprite
				
				if carg1 == "14" then
					-- Display Teleporter
					drawtele(love.graphics.getWidth()-113, 8+(24*(12))+4,1)
				elseif carg1 == "2" or carg1 == "3" or carg1 == "4" then
					drawentcolour(entity[2], love.graphics.getWidth()-(81-8), (24*(12))+8)
				elseif carg1 == "6" or carg1 == "7" then
					-- Draw Particle Color
					r, g, b = entity[2]
					love.graphics.setColor(r,g,b)
					love.graphics.rectangle("fill", love.graphics.getWidth()-(81-8), (24*(12))+8,16,16)
				elseif carg1 == "8" or carg1 == "3" or carg1 == "4" then
					-- Display tile from tiles1
				elseif carg1 == "11" or carg1 == "12" then
					love.graphics.rectangle("fill", love.graphics.getWidth()-81, (24*(12))+8,32,1)
				else
					if tostring(entity[4]) == "Sprite" and tonumber(carg2) ~= nil then
						drawentitysprite(entity[2]+tonumber(carg2), love.graphics.getWidth()-(81-8), 8+(24*(12)), 0)
					else
						drawentitysprite(entity[2], love.graphics.getWidth()-(81-8), 8+(24*(12)), 0)
					end
				end
				-- Display more entity info here
				love.graphics.setColor(255,255,255)
				ved_printf(tostring(entity[3]), love.graphics.getWidth()-(128-8), 8+(12*26), 128-16, "center")
				if carg2 ~= nil and entity[4] ~= nil then
					ved_printf(tostring(entity[4])..": "..tostring(carg2), love.graphics.getWidth()-(128-8), (12*(27+text_offset))+16, 128-16, "center")
					text_offset = text_offset + 1
				end
				if carg3 ~= nil and entity[5] ~= nil then
					ved_printf(tostring(entity[5])..": "..tostring(carg3), love.graphics.getWidth()-(128-8), (12*(27+text_offset))+16, 128-16, "center")
				end

			end
		elseif context == "track" then]],

			ignore_error = false,
			luapattern = false,
			allowmultiple = false,
		}
	}
}