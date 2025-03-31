scene = {
	objects = {},

	update_objects = function(dt)
		for _,k in pairs(scene.objects) do
			if k.update ~= nil then
				k:update(dt)
			end
		end
	end,

	draw_objects = function()
		for _,k in pairs(scene.objects) do
			if k.draw ~= nil then
				k:draw(k)
			end
		end
	end
}
