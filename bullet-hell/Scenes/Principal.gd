extends Node2D

@export var enemigo_mago: PackedScene
@export var enemigo_mago_verde: PackedScene
@export var enemigo_mago_rojo: PackedScene
# @export var escena_jefe: PackedScene

var oleada_actual = 1
var enemigos_vivos = 0

func _ready():
	iniciar_oleada()

func iniciar_oleada():
	print("Oleada: ", oleada_actual)
	
	if oleada_actual == 1:
		spawnear(enemigo_mago, 3)
	elif oleada_actual == 2:
		spawnear(enemigo_mago, 3)
		spawnear(enemigo_mago_verde, 2)
	elif oleada_actual == 3:
		spawnear(enemigo_mago_verde, 4)
		spawnear(enemigo_mago_rojo, 2)
	elif oleada_actual == 4:
		spawnear(enemigo_mago_rojo, 4)
		spawnear(enemigo_mago_verde, 3)
		spawnear(enemigo_mago, 3)
	elif oleada_actual == 5:
		print("¡Jefe final! (escena pendiente)")
		# spawnear(escena_jefe, 1)

func spawnear(escena: PackedScene, cantidad: int):
	for i in cantidad:
		var enemigo = escena.instantiate()
		add_child.call_deferred(enemigo)
		enemigo.global_position = Vector2(randi_range(50, 500), randi_range(50, 400))
		enemigo.connect("murio", _on_enemigo_murio)
		enemigos_vivos += 1

func _on_enemigo_murio():
	enemigos_vivos -= 1
	if enemigos_vivos == 0:
		oleada_actual += 1
		if oleada_actual > 5:
			print("¡Ganaste!")
		else:
			await get_tree().create_timer(2.0).timeout
			iniciar_oleada()
