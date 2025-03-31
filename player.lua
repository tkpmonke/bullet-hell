dofile('physics_world.lua')
dofile('guns/guns.lua')

player = {
	body = {},
	current_gun = 0,

	create_body = function() 
		player.body.body = love.physics.newBody(physics_world.world, 50, 50, "dynamic")
		player.body.body:setLinearDamping(2)
		player.body.shape = love.physics.newRectangleShape(0, 0, 50, 50)
		player.body.fixture = love.physics.newFixture(player.body.body, player.body.shape, 1)
		player.body.fixture:setRestitution(0.0)
	end,

	update = function(ground, angle)
		forwardX = math.cos(angle)
		forwardY = math.sin(angle)

		rightX = math.cos(angle + math.pi / 2)
		rightY = math.sin(angle + math.pi / 2)

		player.body.body:setAngle(angle)

		if love.keyboard.isDown("w") then
			player.body.body:applyForce(player_speed*forwardX, player_speed*forwardY)
		end
		if love.keyboard.isDown("s") then
			player.body.body:applyForce(player_speed*-forwardX, player_speed*-forwardY)
		end
		if love.keyboard.isDown("d") then
			player.body.body:applyForce(player_speed*rightX, player_speed*rightY)
		end
		if love.keyboard.isDown("a") then
			player.body.body:applyForce(player_speed*-rightX, player_speed*-rightY)
		end
		
	end,

	draw = function()
		love.graphics.setColor(0.2, 0.3, 0.7)
		love.graphics.polygon("fill", player.body.body:getWorldPoints(player.body.shape:getPoints()))
	end
}
