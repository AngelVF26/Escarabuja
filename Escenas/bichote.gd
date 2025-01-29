extends CharacterBody2D


var SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@export var bichodorado: bool = false


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x := Input.get_axis("paizquierda", "paderecha")
	var direction_y:=Input.get_axis("parriba", "pabajo")
	#velocity.y = -SPEED * 0.8
	velocity.x = direction_x * SPEED
	if Input.is_action_pressed("paizquierda"):
		rotation_degrees = -15
	if Input.is_action_pressed("paderecha"):
		rotation_degrees = 15
	if Input.is_action_just_released("paderecha"):
		rotation_degrees = 0
	if Input.is_action_just_released("paizquierda"):
		rotation_degrees = 0
	if Input.is_action_pressed("sprint") && direction_x == -1:
		velocity.x = -SPEED *2
	if Input.is_action_pressed("sprint") && direction_x == 1:
		velocity.x = SPEED *2
	if Input.is_action_just_released("sprint"):
		velocity.x = direction_x * SPEED
	#if Input.is_action_pressed("pabajo"):
		#if !Input.is_action_pressed("sprint"):
			#velocity.y = -SPEED * 0.3
	#if Input.is_action_just_released("pabajo"):
		#velocity.y = -SPEED * 0.8
	
	move_and_slide()
	
func sacabao():
	SPEED =0
	sprite_2d.play("muerte")
