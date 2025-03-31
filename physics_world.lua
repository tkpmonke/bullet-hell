dofile('constants.lua')

physics_world = {
	world = nil,
	init = function()
		love.physics.setMeter(meter)
		physics_world.world = love.physics.newWorld(0, 0, true)
	end
}
