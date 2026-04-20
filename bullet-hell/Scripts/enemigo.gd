extends CharacterBody2D
@export var jogador: Node2D

const SPEED = 150

func _ready():
	jogador = get_node("/root/Node2D/jugador")
	
#func _physics_process(delta: float) -> void:
	#var direccion = (jogador.get_node("jogador").global_position-global_position).normalized()
	#print(direccion)
	#velocity = SPEED * direccion
	#$AnimatedSprite2D.play("walk")
	#look_at(jogador.global_position)
#
	#move_and_slide()
func _physics_process(delta: float) -> void:
	var direccion = (jogador.get_node("jogador").global_position - global_position).normalized()
	velocity = SPEED * direccion
	
	# Voltear el sprite según hacia dónde se mueve horizontalmente
	if direccion.x < 0:
		$AnimatedSprite2D.flip_h = true   # Mirando a la izquierda
	elif direccion.x > 0:
		$AnimatedSprite2D.flip_h = false  # Mirando a la derecha
	
	$AnimatedSprite2D.play("walk")
	move_and_slide()
