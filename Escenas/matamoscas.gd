extends CharacterBody2D

var nombre: String = "Matamoscas"
# Called when the node enters the scene tree for the first time.
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_moscas: AnimatedSprite2D = $AnimatedMoscas
@onready var area_2d: Area2D = $Area2D


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction_x := Input.get_axis("paizquierda", "paderecha")
	#var direction_y:=Input.get_axis("parriba", "pabajo")
	velocity.y = SPEED * 0.8
	
	if Input.is_action_pressed("pabajo"):
		if !Input.is_action_pressed("sprint"):
			velocity.y = SPEED * 0.3
	if Input.is_action_just_released("pabajo"):
		velocity.y = SPEED * 0.8
	move_and_slide()
	
	if animated_moscas.frame != 4:
		$Area2D/CollisionShape2D.set_deferred("disabled", true)
		$CollisionShape2D.set_deferred("disabled", true)
	else:
		$Area2D/CollisionShape2D.set_deferred("disabled", false)
		$CollisionShape2D.set_deferred("disabled", false)
