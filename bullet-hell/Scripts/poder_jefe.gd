extends Node2D

var bullet_violet = preload("res://Scenes/bulletVioletJefe.tscn")
var bullet_verde = preload("res://Scenes/bulletVerdeJefe.tscn")
var bullet_rojo = preload("res://Scenes/bulletRojoJefe.tscn")
var radio = 0.0
var rotaSpeed = 0.10

func _ready() -> void:
	_fire_loop()

func _fire_loop():
	while true:
		# Patrón 1 — Violet (cruz normal)
		for i in range(4):
			var bullet = bullet_violet.instantiate()
			bullet.dir = (PI / 2) * i
			bullet.pos = global_position
			bullet.rota = (PI / 2) * i
			get_tree().current_scene.add_child(bullet)
		await get_tree().create_timer(0.5).timeout

		# Patrón 2 — Verde (cruz rotada 45°)
		for i in range(4):
			var bullet = bullet_verde.instantiate()
			bullet.dir = (PI / 2) * i + PI / 4
			bullet.pos = global_position
			bullet.rota = (PI / 2) * i + PI / 4
			get_tree().current_scene.add_child(bullet)
		await get_tree().create_timer(0.5).timeout

		# Patrón 3 — Rojo (espiral)
		var cooldown = 0
		while cooldown < 1:
			for i in range(4):
				var angulo = radio + (TAU / 4) * i
				var bullet = bullet_rojo.instantiate()
				bullet.dir = angulo
				bullet.pos = global_position
				bullet.rota = angulo
				get_tree().current_scene.add_child(bullet)
			radio += rotaSpeed
			await get_tree().create_timer(0.1).timeout
			cooldown += 0.1
		await get_tree().create_timer(0.5).timeout

		await get_tree().create_timer(0.1).timeout
