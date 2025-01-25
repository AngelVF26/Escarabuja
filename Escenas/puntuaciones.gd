extends Node2D
@onready var cronometro: Timer = $Cronometro

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$puntuacionesFinales.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func guardar_partida():	

	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	# Now, we can call our save function on each node.
		
	
func _on_submit_pressed() -> void:
	if $LineEdit.text != "":
		$Submit.visible = false
		$LineEdit.visible = false
		$puntuacionesFinales.visible = true
		$"Añade tu nombre".visible = false
		guardar_partida()
	pass # Replace with function body.
