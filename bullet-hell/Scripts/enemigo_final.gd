extends CharacterBody2D

@export var jogador: Node2D
signal murio
const SPEED = 100
var vida = 50

var mapa_min = Vector2(-300, -300)
var mapa_max = Vector2(1500, 1000)

func _ready():
	jogador = get_node("/root/Node2D/jugador")
	$AnimatedSprite2D.play("idle")
	_loop_teletransporte()

func _loop_teletransporte():
	while true:
		await get_tree().create_timer(3.0).timeout
		var nueva_pos = Vector2(
			randf_range(mapa_min.x, mapa_max.x),
			randf_range(mapa_min.y, mapa_max.y)
		)
		global_position = nueva_pos

func recibir_dano():
	vida -= 1
	if vida <= 0:
		emit_signal("murio")
		queue_free()
