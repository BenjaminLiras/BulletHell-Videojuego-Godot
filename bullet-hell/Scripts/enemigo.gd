extends CharacterBody2D
@export var jogador: Node2D

const SPEED = 150

func _ready():
	jogador = get_node("/root/Node2D/jugador")
	
func _physics_process(delta: float) -> void:
	var direccion = (jogador.global_position-global_position).normalized()
	velocity = SPEED * direccion
	
	if direccion.x < 0:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = true
	elif direccion.x > 0:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false
	move_and_slide()
