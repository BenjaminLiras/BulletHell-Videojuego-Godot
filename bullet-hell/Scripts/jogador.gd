extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DASH_SPEED = 800.0
var dashing = false
var dash_timer = 0.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D 



func _physics_process(delta: float) -> void:
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
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
	
	var direccion = 0
	if velocity.x == 0 and velocity.y == 0:
		animated_sprite_2d.play("idle")
		
	if Input.is_action_pressed("ui_right"):
		direccion += 1
		animated_sprite_2d.play("walk")
		animated_sprite_2d.flip_h = false
		
	if Input.is_action_pressed("ui_left"):
		direccion -= 1
		animated_sprite_2d.play("walk")
		animated_sprite_2d.flip_h = true
		
		
	if Input.is_action_pressed("ui_up"):
		direction_y += 1
		animated_sprite_2d.play("walk")
	
	if Input.is_action_pressed("ui_down"):
		direction_y -= 1
		animated_sprite_2d.play("walk")
	


	move_and_slide()
