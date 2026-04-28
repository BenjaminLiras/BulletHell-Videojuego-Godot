extends Node2D

var sePuedeDisparar = true
var bullet_path = preload("res://Scenes/bulletRojo.tscn")
var rotaSpeed = 0.10 #velocidad de la rotacion
var radio = 0  # el radio

func _ready() -> void:
	_fire_loop()

func _fire_loop():
	while true:
		var cooldown = 0
		while cooldown < 1:
			fire()
			await get_tree().create_timer(0.1).timeout
			cooldown += 0.1
		await get_tree().create_timer(2).timeout
		
			
		

#func _physics_process(delta):
	#if sePuedeDisparar:
		#fire()
		#await get_tree().create_timer(1).timeout
		#

func fire():
	for i in range(4):
		var angulo = radio + (TAU / 4) * i
		var bullet = bullet_path.instantiate()
		bullet.dir = angulo
		bullet.pos = global_position
		bullet.rota = angulo
		get_tree().current_scene.add_child(bullet)
	radio += rotaSpeed
