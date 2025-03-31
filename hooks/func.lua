function getEntitybyID(id)
	entityData = {
	{0,0,"Player","Invisible",nil},
	{1,24,"Main Game Enemy","Movement ID","Speed"},
	{2,12,"Moving Platform","Movement ID","Speed"},
	{3,24,"Disappearing Platform","Tilecol -1 Tile ID",nil},
	{4,48,"Quicksand Block",nil,nil},
	{5,9,"Gravity Token",nil,nil},
	{6,{40,2,2},"Particle","X-Velocity","Y-Velocity"},
	{7,{134,184,188},"Particle","X-Velocity","Y-Velocity"},
	{8,48,"Coin","Trinket ID",nil},
	{9,22,"Trinket","Trinket ID",nil},
	{10,20,"Checkpoint","Sprite","Checkpoint ID"},	
	{11,-1,"Gravity Line (Horizontal)","Length",nil},	
	{12,-1,"Gravity Line (Vertical)","Length",nil},
	{13,18,"Warp Token","Dest. X-Pos","Dest. Y-Pos"},
	{14,-1,"Teleporter",nil,"Checkpoint ID"},
	{15,0,"Verdigris","AI State",nil},
	{16,0,"Vitellary","AI State",nil},
	{17,0,"Victoria","AI State",nil},
	{18,0,"Crewmate","Color ID","Sad"},
	{19,0,"Vermilion","AI State",nil},
	{20,16,"Terminal","Sprite",nil},
	{21,16,"Terminal (Unresponsive)","Sprite",nil},
	{22,22,"Cosmetic Trinket","Trinket ID",nil},
	{23,78,"Gravitron Square","Direction",nil},
	{24,0,"Supercrewmate","Color ID","Sad"},
	{25,180,"Trophy","Sprite","Achievement ID"},
	{26,18,"Giant Warp Token",nil,"Dest. Y-Pos"},
	{51,-1,"Warp Line (Left)","Length",nil},
	{52,-1,"Warp Line (Right)","Length",nil},
	{53,-1,"Warp Line (Top)","Length",nil},
	{54,-1,"Warp Line (Bottom)","Length",nil},
	{55,0,"Rescuable Crewmate","Crewmate ID","Color ID"},
	{56,78,"Enemy","Movement ID","Speed"}
	}
	for k=0,(#entityData-1) do
		-- debug
		k = k + 1
		--ved_printf(tostring(entityData[k][1]), love.graphics.getWidth()-(228-8), 8+(24*(12+k))+4, 128-16, "center")
		--ved_printf(tostring(id), love.graphics.getWidth()-(328-8), 8+(24*(12+k))+4, 128-16, "center")
		if tostring(id) == tostring(entityData[k][1]) then
			--ved_printf("Success?", love.graphics.getWidth()-(428-8), 8+(24*(12+k))+4, 128-16, "center")
			return entityData[k]
			
		end
	end
	return nil
end