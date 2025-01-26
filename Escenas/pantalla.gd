extends Area2D
@onready var burbujaSprite: AnimatedSprite2D = $bichote/burbuja/AnimatedSprite2D
@onready var transicion_black: ColorRect = $ColorRect

@onready var bichote: CharacterBody2D = $bichote
var segundos: float = 0
var valorpasado: float = 0
var valorpresente : float = 0
@onready var cronometro: Timer = $Cronometro
@onready var label: Label = $GUI/Label
@onready var texture_progress_bar: TextureProgressBar = $"GUI/Medidor Aire/TextureProgressBar"
@onready var texture_progress_dorada: TextureProgressBar = $"GUI/Medidor Aire2/TextureProgressBar"
@onready var burbuja: Area2D = $bichote/burbuja
var escala_original: Vector2
var valor_pasado : int = 30
var valor_actual : int = 30
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	escala_original = $bichote/burbuja.scale
	#$bichote/burbuja/CollisionShape2D.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$TextureRect.size.y += 80 * delta
	#print($bichote/burbuja/CollisionShape2D.disabled)
	
func _on_final_col_body_entered(body: Node2D) -> void:
	if body.name == "bichote":
		body.position = Vector2(body.position.x,70)
		$Spawner.position = Vector2($Spawner.position.x,-235)
	
	pass # Replace with function body.


func _on_cronometro_timeout() -> void:
	segundos += cronometro.wait_time
	label.text = str(segundos).pad_decimals(2)
	cronometro.start

func HAS_MUERTO():
	cronometro.stop()
	Scoreboard._setPuntos(segundos)
	texture_progress_bar.value = 0
	bichote.velocity.x =0
	bichote.velocity.y =0
	bichote.sacabao()
	$Spawner.spawnFuera()
	$bichote/burbuja/BurbujaBorde.visible = false
	$bichote/burbuja/Burbuja.visible = false
	burbujaSprite.visible = true
	burbujaSprite.play("Explosion")
	transicion_black.position.x = bichote.position.x
	transicion_black.position.y = bichote.position.y
	$ColorRect/AnimationPlayer.play("fade")
	
	
func _on_time_aire_timeout() -> void:
	valorpasado = texture_progress_bar.value
	if Input.is_action_pressed("sprint"):
		texture_progress_bar.value -= 2
	else:
		texture_progress_bar.value -= 1
		
	valorpresente = texture_progress_bar.value
	
	
	if $bichote/burbuja.tocodorada == true:
		#$bichote/burbuja.set_deferred("disable_mode",true)
		$bichote/burbuja/CollisionShape2D.disabled = true
		print("patata")
		$bichote/Sprite2D.play("bichodorado")
		$"GUI/Medidor Aire2".call_deferred("set_visible",true)
		$AudioTransformacion.play()
		
		texture_progress_dorada.value -=1
	elif $bichote/burbuja.tocodorada == false:
		$bichote/burbuja/CollisionShape2D.disabled = false
		print("falsisimo")
		$"GUI/Medidor Aire2".call_deferred("set_visible",false)
		

	#if valorpasado > valorpresente:
		#$bichote/burbuja.scale -= Vector2(0.025,0.025)
	#elif valorpasado < valorpresente:
		#$bichote/burbuja.scale += Vector2(0.025,0.025)
	$TimeAire.start()
	ParallaxBackground
	


func _on_texture_progress_bar_value_changed(value: float) -> void:
	valor_pasado = valor_actual
	valor_actual = value
	if value<=0:
		HAS_MUERTO()
	elif value > valor_pasado:
		$bichote/burbuja.scale += Vector2(0.025*abs(valor_actual-valor_pasado),0.025*abs(valor_actual-valor_pasado))
	elif value < valor_pasado:
		$bichote/burbuja.scale -= Vector2(0.025*abs(valor_actual-valor_pasado),0.025*abs(valor_actual-valor_pasado))
		


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://Escenas/puntuaciones.tscn")
	pass # Replace with function body.

	
func _on_texture_progress_dorada_value_changed(value: float) -> void:
	if value == 9:
		texture_progress_bar.value += 20
	
	if value<=0:
		$bichote/burbuja.tocodorada = false
		texture_progress_dorada.value =10
		$bichote/burbuja/Burbuja.texture = load("res://assets/burbuja.png")
		$bichote/burbuja/BurbujaBorde.texture = load("res://assets/burbuja borde y detalles.png")


		$"GUI/Medidor Aire2".call_deferred("set_visible",false)
		$bichote/Sprite2D.play("default")
		$bichote/burbuja.set_deferred("disable_mode",false)
		
