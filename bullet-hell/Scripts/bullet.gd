extends Area2D

var pos: Vector2
var rota: float 
var dir: float
var speed = 2000

func _ready():
	global_position = pos
	global_rotation = rota

func _physics_process(delta: float) -> void:
	var movement = Vector2(speed, 0).rotated(dir)
	global_position += movement * delta

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("recibir_dano"):
		body.recibir_dano()
		queue_free()
	if body.name == "TileMapLayer":
		queue_free()
