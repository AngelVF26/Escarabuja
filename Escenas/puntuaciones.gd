extends Node2D
@onready var cronometro: Timer = $Cronometro
var nombre : String = ""
@onready var lista_nombres: RichTextLabel = $puntuacionesFinales/listaNombres
var file = "user://scores.cfg"
var nombre_libre : int = 1
var dictPunt : Dictionary
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
var dictOrdenado : Dictionary

func _ready() -> void:
	$puntuacionesFinales.visible = false
	$ColorRect2.visible = false
	audio_stream_player.play()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_submit_pressed() -> void:
	%Submit.disabled = true
	Scoreboard.player_name = $LineEdit.text
	Scoreboard.puntos = Scoreboard._getPuntos()
	var sw_result : Dictionary = await  SilentWolf.Scores.save_score(Scoreboard.player_name, Scoreboard.puntos).sw_save_score_complete
	print("pressed punt")
	print(str(Scoreboard.player_name) + " " + str(Scoreboard.puntos))
	print("Score persisted successfully: " + str(sw_result.score_id))
	#self.hide()
	%Submit.visible = false
	$LineEdit.visible = false
	$puntuacionesFinales.visible = true
	$"Añade tu nombre".visible = false
	nombre = $LineEdit.text
	
func _on_rejugar_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/inicio.tscn")
	pass # Replace with function body.


func _on_volver_credito_pressed() -> void:
	$ColorRect2.set_deferred("visible",false)
	pass # Replace with function body.

func _on_creditos_pressed() -> void:
	$ColorRect2.set_deferred("visible",true)
	
	pass # Replace with function body.

func _on_line_edit_text_changed(new_text: String) -> void:
	if new_text != "":
		%Submit.disabled = false
	else:
		%Submit.disabled = true

func _on_label_itch_meta_clicked(meta):
	OS.shell_open("https://saturnia-games.itch.io/")
	pass # Replace with function body.


func _on_tag_bluesky_meta_clicked(meta):
	OS.shell_open("https://bsky.app/profile/saturniagames.bsky.social")
	pass # Replace with function body.
