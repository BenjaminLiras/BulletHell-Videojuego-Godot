extends Area2D

var pos: Vector2
var rota: float
var dir: float
var speed = 200
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	global_position = pos
	global_rotation = rota
	animated_sprite.play("disparo")
	animated_sprite.animation_finished.connect(queue_free)

func _physics_process(delta: float) -> void:
	global_position += Vector2(speed, 0).rotated(dir) * delta
	
func _on_body_entered(body):
	print("Toque a: ", body.name)
	# Busca el metodo en el body o en su padre
	if body.has_method("recibir_daño"):
		body.recibir = true
		queue_free()
	elif body.get_parent().has_method("recibir_daño"):
		body.get_parent().recibir = true
		queue_free()
