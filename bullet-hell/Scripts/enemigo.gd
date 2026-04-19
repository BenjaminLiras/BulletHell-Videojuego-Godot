extends CharacterBody2D
@export var jogador: Node2D


const SPEED = 150


#func _physics_process(delta: float) -> void:
	##var direccion = (jogador.global_position-global_position).normalized()
	##velocity = SPEED * direccion
	##look_at(jogador.global_position)
##
	##move_and_slide()
