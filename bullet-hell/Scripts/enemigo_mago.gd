extends CharacterBody2D
@export var jogador: Node2D

signal murio

const SPEED = 100
var vida = 2

func _ready():
	jogador = get_node("/root/Node2D/jugador")
	
func _physics_process(delta: float) -> void:
	var direccion = (jogador.global_position-global_position).normalized()
	velocity = SPEED * direccion
	
	if direccion.x < 0:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false
	elif direccion.x > 0:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = true
	move_and_slide()
	
func recibir_dano():
	vida -= 1
	if vida <= 0:
		emit_signal("murio")
		queue_free()
