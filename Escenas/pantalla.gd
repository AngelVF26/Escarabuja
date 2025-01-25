extends Area2D


var segundos: float = 0
@onready var cronometro: Timer = $Cronometro
@onready var label: Label = $GUI/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass


func _on_final_col_body_entered(body: Node2D) -> void:
	if body.name == "bichote":
		body.position = Vector2(body.position.x,70)
		
	pass # Replace with function body.


func _on_cronometro_timeout() -> void:
	segundos += cronometro.wait_time
	label.text = str(segundos).pad_decimals(2)
	cronometro.start
