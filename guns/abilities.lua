dofile('guns/bullet.lua')

abilities = {
	bullet_swarm = {
		amount = 360/10
	}
}

function abilities.bullet_swarm:trigger(dt)
	i = 360
	while (i > 0) do
		i = i - self.amount
		spawn_bullet(i, dt)
	end
end
