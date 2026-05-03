extends Area2D

var pos: Vector2
var rota: float
var dir: float
var speed = 300
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	global_position = pos
	global_rotation = rota
	animated_sprite.play("disparo")
	animated_sprite.animation_finished.connect(queue_free)

func _physics_process(delta: float) -> void:
	global_position += Vector2(speed, 0).rotated(dir) * delta
	
func _on_body_entered(body):
	if body.has_method("recibir_daño"):
		body.recibir = true
		queue_free()
	elif body.get_parent().has_method("recibir_daño"):
		body.get_parent().recibir = true
		queue_free()
	if body.name == "TileMapLayer":
		queue_free()
