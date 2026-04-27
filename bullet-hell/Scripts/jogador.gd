extends CharacterBody2D

const SPEED = 300.0
var animated_sprite_2d: AnimatedSprite2D
var salud = 3
var recibir: bool = false

@onready var corazon1 = $"../UI/fondo/borde/corazon"
@onready var corazon2 = $"../UI/fondo2/borde/corazon2"
@onready var corazon3 = $"../UI/fondo3/borde/corazon3"

func _ready() -> void:
	animated_sprite_2d = $AnimatedSprite2D

func _process(delta: float) -> void:
	recibir_daño()
	restar_corazones()

func recibir_daño():
	if recibir == true:
		if salud > 0:
			salud -= 1
			recibir = false
	if salud <= 0:
		get_tree().reload_current_scene()

func restar_corazones():
	if salud == 3:
		corazon1.visible = true
		corazon2.visible = true
		corazon3.visible = true
	if salud == 2:
		corazon1.visible = false
		corazon2.visible = true
		corazon3.visible = true
	if salud == 1:
		corazon1.visible = false
		corazon2.visible = false
		corazon3.visible = true
	if salud == 0:
		corazon1.visible = false
		corazon2.visible = false
		corazon3.visible = false

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	if velocity.x == 0 and velocity.y == 0:
		animated_sprite_2d.play("idle")

	if Input.is_action_pressed("ui_right"):
		animated_sprite_2d.play("walk")
		animated_sprite_2d.flip_h = false

	if Input.is_action_pressed("ui_left"):
		animated_sprite_2d.play("walk")
		animated_sprite_2d.flip_h = true

	if Input.is_action_pressed("ui_up"):
		animated_sprite_2d.play("walk")

	if Input.is_action_pressed("ui_down"):
		animated_sprite_2d.play("walk")

	move_and_slide()
