extends CharacterBody2D

var nombre: String = "Burbuja"


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


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


func _on_areaburbuja_area_entered(area: Area2D) -> void:
	#print("mas aire")
	#print(area.name)
	pass


func _on_areaburbuja_body_entered(body: Node2D) -> void:
	#print("airee")
	#print(body.name)
	pass
