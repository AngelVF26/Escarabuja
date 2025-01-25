extends Area2D


var segundos: float = 0
var valorpasado: float = 0
var valorpresente : float = 0
@onready var cronometro: Timer = $Cronometro
@onready var label: Label = $GUI/Label
@onready var texture_progress_bar: TextureProgressBar = $"GUI/Medidor Aire/TextureProgressBar"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_final_col_body_entered(body: Node2D) -> void:
	if body.name == "bichote":
		body.position = Vector2(body.position.x,70)
		$Spawner.position = Vector2($Spawner.position.x,-235)
	
	pass # Replace with function body.


func _on_cronometro_timeout() -> void:
	segundos += cronometro.wait_time
	label.text = str(segundos).pad_decimals(2)
	cronometro.start


func _on_time_aire_timeout() -> void:
	valorpasado = texture_progress_bar.value
	texture_progress_bar.value -= 1
	valorpresente = texture_progress_bar.value
	if valorpasado > valorpresente:
		$bichote/burbuja.scale -= Vector2(0.025,0.025)
	elif valorpasado < valorpresente:
		$bichote/burbuja.scale += Vector2(0.025,0.025)
	$TimeAire.start()
	


#func _on_texture_progress_bar_value_changed(value: float) -> void:
	#if valorpasado > valorpresente:
		#$bichote/burbuja.scale -= Vector2(1,1)
	#elif valorpasado < valorpresente:
		#$bichote/burbuja.scale += Vector2(1,1)
