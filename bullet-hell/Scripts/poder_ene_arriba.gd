extends Node2D

var sePuedeDisparar = true
var bullet_path = preload("res://Scenes/bulletRojo.tscn")

func _physics_process(delta):
	if sePuedeDisparar:
		fire()

func fire():
	var bullet = bullet_path.instantiate()
	bullet.dir = rotation
	bullet.pos = global_position
	bullet.rota = global_rotation
	get_tree().current_scene.add_child(bullet)  
	sePuedeDisparar = false
	await get_tree().create_timer(1).timeout
	sePuedeDisparar = true

func _ready() -> void:
	pass
