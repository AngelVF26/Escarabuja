extends Area2D

@onready var bichote: CharacterBody2D = $bichote
var segundos: float = 0
var valorpasado: float = 0
var valorpresente : float = 0
@onready var cronometro: Timer = $Cronometro
@onready var label: Label = $GUI/Label
@onready var texture_progress_bar: TextureProgressBar = $"GUI/Medidor Aire/TextureProgressBar"
@onready var burbuja: Area2D = $bichote/burbuja
var escala_original: Vector2
var valor_pasado : int = 30
var valor_actual : int = 30
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	escala_original = $bichote/burbuja.scale


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$TextureRect.size.y += 0.55

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
	texture_progress_bar.value = 0
	bichote.velocity.x =0
	bichote.velocity.y =0
	bichote.sacabao()

	$Spawner.spawnFuera()

func _on_time_aire_timeout() -> void:
	valorpasado = texture_progress_bar.value
	texture_progress_bar.value -= 1
	valorpresente = texture_progress_bar.value
	#if valorpasado > valorpresente:
		#$bichote/burbuja.scale -= Vector2(0.025,0.025)
	#elif valorpasado < valorpresente:
		#$bichote/burbuja.scale += Vector2(0.025,0.025)
	$TimeAire.start()
	ParallaxBackground
	


func _on_texture_progress_bar_value_changed(value: float) -> void:
	print("valor: " + str(value))
	valor_pasado = valor_actual
	valor_actual = value
	print("actual: " + str(valor_actual))
	print("pasado: " + str(valor_pasado))
	if value<=0:
		HAS_MUERTO()
	elif value > valor_pasado:
		$bichote/burbuja.scale += Vector2(0.025*abs(valor_actual-valor_pasado),0.025*abs(valor_actual-valor_pasado))
	elif value < valor_pasado:
		$bichote/burbuja.scale -= Vector2(0.025*abs(valor_actual-valor_pasado),0.025*abs(valor_actual-valor_pasado))
		
