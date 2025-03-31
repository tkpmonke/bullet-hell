dofile('guns/guns.lua')
dofile('player.lua')

function spawn_bullet(angle, dt)
	obj = {}

	obj.positionX = player.body.body:getX()
	obj.positionY = player.body.body:getY()
	obj.directionX = math.cos(angle)
	obj.directionY = math.sin(angle)
	obj.speed = guns.pistol.bullet_speed

	function obj:update(dt)
		self.positionX = self.positionX + self.directionX * dt * self.speed
		self.positionY = self.positionY + self.directionY * dt * self.speed
		print(self.positionX)
		print(self.positionY)
		print("-------------------")
	end
	
	function obj:draw()
		love.graphics.circle("fill", self.positionX, self.positionY, 10)
	end

	table.insert(scene.objects, obj)
end
