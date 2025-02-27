extends CharacterBody2D

var nombre: String = "Nube"
# Called when the node enters the scene tree for the first time.
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

func playSound():
	audio.play(0.7)
	


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction_x := Input.get_axis("paizquierda", "paderecha")
	#var direction_y:=Input.get_axis("parriba", "pabajo")
	velocity.y = SPEED * 0.8
	
	if Input.is_action_pressed("pabajo"):
		#if !Input.is_action_pressed("sprint"):
		velocity.y = SPEED * 0.3
	if Input.is_action_just_released("pabajo"):
		velocity.y = SPEED * 0.8
	move_and_slide()


func _on_timer_timeout() -> void:
	self.queue_free()


func _on_area_nube_area_entered(area: Area2D) -> void:
	if area.name == "burbuja":
		print("desactivose")
		$AreaNube/CollisionShape2D2.set_deferred("disabled", true)
		$AreaNube/CollisionShape2D2.disabled = true
