extends Node2D

var sePuedeDisparar = true
var bullet_path = preload("res://Scenes/bulletViolet.tscn")

func _physics_process(delta):
	if sePuedeDisparar:
		fire()

func fire():
	sePuedeDisparar = false
	
	for i in range (4): #Uso pi para calcular los angulos i = 0 > derecha // i = 1 > abajo // i = 2 > izq // i = 3 > arriba
		var bullet = bullet_path.instantiate()
		bullet.dir = (PI / 2) * i
		bullet.pos = global_position
		bullet.rota = (PI / 2) * i
		get_tree().current_scene.add_child(bullet)
		
	await get_tree().create_timer(2).timeout
	sePuedeDisparar = true

func _ready() -> void:
	pass
