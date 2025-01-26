extends CharacterBody2D

var nombre: String = "Burbuja"

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var random: float = randf_range(0,3)
var dorada: bool = false
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

func _ready() -> void:
	print(random)
	if random > 1.3:
		dorada = true
		$Sprite2D.texture = load("res://assets/burbuja dorada borde2.png")

func _on_areaburbuja_area_entered(area: Area2D) -> void:
	$Sprite2D.set_deferred("visible",false)
	
func playSound():
	audio_stream_player.play()

func _on_areaburbuja_body_entered(body: Node2D) -> void:
	#print("airee")
	#print(body.name)
	pass
