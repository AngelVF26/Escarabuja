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
	if $LineEdit.text != "":
		Scoreboard.player_name = $LineEdit.text
		Scoreboard.puntos = Scoreboard._getPuntos()
		var sw_result : Dictionary = await  SilentWolf.Scores.save_score(Scoreboard.player_name, Scoreboard.puntos).sw_save_score_complete
		#print("pressed punt")
		print(str(Scoreboard.player_name) + " " + str(Scoreboard.puntos))
		print("Score persisted successfully: " + str(sw_result.score_id))
		#self.hide()
		%Submit.visible = false
		$LineEdit.visible = false
		$puntuacionesFinales.visible = true
		$"Añade tu nombre".visible = false
		nombre = $LineEdit.text
		
		#print(str(Scoreboard.dictTemp))
		#Scoreboard.dictTemp = Scoreboard.datos_originales
		#Scoreboard.dictTemp[nombre] = Scoreboard._getPuntos()
		#print(str(Scoreboard.dictTemp))
#
		##Scoreboard.load_game()
		#Scoreboard.save_game(Scoreboard.dictTemp)
		#dictPunt = Scoreboard.load_game()
		#print(str(dictPunt))
		#print("ordenado")
		#sort_dict(dictPunt)
		#dictPunt=sorted_dict(dictPunt)
		#print(str(dictPunt))
		#
		#for i in dictPunt:
			#lista_nombres.text += str(i) + "\n"
			#$puntuacionesFinales/totalSegundos.text += str(dictPunt[i]).pad_decimals(2) + "\n"
		#print(str(Scoreboard.dictTemp))
		
		#print(str(load_game()))

#func sort_dict(dict: Dictionary) -> void:
	#var pairs = dict.keys().map(func (key): return [key, dict[key]])
	#print(str(pairs))
	#pairs.sort()
	#print(str(pairs))
	#dict.clear()
	#for p in pairs:
		#print(str(p))
		#dict[p[0]] = p[1]
#
#func sorted_dict(dict: Dictionary) -> Dictionary:
	#var keys = dict.keys()
	#keys.sort()
	#var new_dict: = {}
	#for k in keys:
		#new_dict[k] = dict[k]
	#return new_dict

#func save(dict : Dictionary):
	#var config = ConfigFile.new()
		#
	#for i in dict:
		#config.set_value("Player", str(i), str(dict.get(nombre)) )
		#
	#
	#config.save("user://scores.cfg")

#func load_game():
	#var score_data = {}
	#var config = ConfigFile.new()
## Load data from a file.
	#var err = config.load("user://scores.cfg")
#
## If the file didn't load, ignore it.
	#if err != OK:
		#print("error")
		#return

# Iterate over all sections.
	#for player in config.get_sections():
		#var player_name = config.get_value(player, "player_name")
		#var player_score = config.get_value(player, "score")
		#score_data[player_name] = player_score
		#nombre_libre += 1
	#return score_data
	
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
		print("hola")
		%Submit.disabled = false
	else:
		print("adiosadios")
		%Submit.disabled = true
