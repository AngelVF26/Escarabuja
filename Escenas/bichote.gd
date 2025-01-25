extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x := Input.get_axis("paizquierda", "paderecha")
	var direction_y:=Input.get_axis("parriba", "pabajo")
	velocity.y = direction_y * SPEED
	velocity.x = direction_x * SPEED
	if Input.is_action_pressed("paizquierda"):
		rotation_degrees = -15
	if Input.is_action_pressed("paderecha"):
		rotation_degrees = 15
	if Input.is_action_just_released("paderecha"):
		rotation_degrees = 0
	if Input.is_action_just_released("paizquierda"):
		rotation_degrees = 0
	if Input.is_action_pressed("sprint"):
		velocity.y = direction_y * SPEED *1.5
	if Input.is_action_just_released("sprint"):
		velocity.y = direction_y * SPEED
		
	
	move_and_slide()
