extends CharacterBody2D
@export var jogador: Node2D


const SPEED = 150


func _physics_process(delta: float) -> void:
	var direccion = (jogador.position-position).normalized()
	velocity = SPEED * direccion
	look_at(jogador.position)

	move_and_slide()
