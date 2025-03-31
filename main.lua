dofile('physics_world.lua')
dofile('player.lua')
dofile('scene.lua')
dofile('guns/bullet.lua')
dofile('guns/abilities.lua')

function love.load()
	physics_world.init()
	player.create_body()

	ground = {}
	ground.body = love.physics.newBody(physics_world.world, love.graphics.getWidth()/2, love.graphics.getHeight()-25)
	ground.shape = love.physics.newRectangleShape(love.graphics.getWidth(), 50)
	ground.fixture = love.physics.newFixture(ground.body, ground.shape)

	love.graphics.setBackgroundColor(0.41, 0.53, 0.97)

end

left_was_down = false
right_was_down = false
function love.update(dt)
	physics_world.world:update(dt)

	mouseX, mouseY = love.mouse.getPosition()
	angle = math.atan2(mouseY-player.body.body:getY(),mouseX-player.body.body:getX()) 
	player.update(ground, angle)


	if love.mouse.isDown(1) and not left_was_down then
		spawn_bullet(angle, dt) 
		left_was_down = true
	elseif not love.mouse.isDown(1) then
		left_was_down = false
	end

	if love.mouse.isDown(2) and not right_was_down then
		abilities.bullet_swarm:trigger(dt)
		right_was_down = true
	elseif not love.mouse.isDown(2) then
		right_was_down = false
	end

	scene.update_objects(dt)
end

function love.draw()
	player.draw()
	love.graphics.setColor(0,0.1,0.4)
	love.graphics.polygon("fill", ground.body:getWorldPoints(ground.shape:getPoints()))


	scene.draw_objects()
end
