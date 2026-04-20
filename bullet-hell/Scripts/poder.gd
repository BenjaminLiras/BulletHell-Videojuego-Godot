extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"
var sePuedeDisparar = true
var bullet_path = preload("res://Scenes/bullet.tscn")

func _physics_process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("ui_accept"):
		if sePuedeDisparar:
			fire()
		

func fire():
		var bullet = bullet_path.instantiate()
		bullet.dir = rotation
		bullet.pos = global_position
		bullet.rota = global_rotation
		get_parent().add_child(bullet)
		sePuedeDisparar = false
		print("empezo   timer")
		await get_parent().get_tree().create_timer(0.3).timeout
		sePuedeDisparar = true   
		print("termino timer")


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
