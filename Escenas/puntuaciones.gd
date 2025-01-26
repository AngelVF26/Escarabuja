extends Node2D
@onready var cronometro: Timer = $Cronometro
var nombre : String = ""
@onready var lista_nombres: Label = $puntuacionesFinales/listaNombres
var file = "user://scores.cfg"
var nombre_libre : int = 1
var dictPunt : Dictionary
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

#var save_file = FileAccess.open("user://savegame.save", FileAccess.READ_WRITE)
#var load_file = FileAccess.open(file, FileAccess.READ)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$puntuacionesFinales.visible = false
	$ColorRect2.visible = false
	audio_stream_player.play()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#func guardar_partida():	
#
	#
	#save_file.store_string(nombre)
	## Now, we can call our save function on each node.
		#
	#
func _on_submit_pressed() -> void:
	if $LineEdit.text != "":
		$Submit.visible = false
		$LineEdit.visible = false
		$puntuacionesFinales.visible = true
		$"Añade tu nombre".visible = false
		nombre = $LineEdit.text
		
		Scoreboard.dictTemp[nombre] = Scoreboard._getPuntos()
		
		#Scoreboard.load_game()
		Scoreboard.save_game(Scoreboard.dictTemp)
		dictPunt = Scoreboard.load_game()
		print(str(dictPunt))
		#sort_dict(dictPunt)
		dictPunt=sorted_dict(dictPunt)
		print(str(dictPunt))
		for i in dictPunt:
			lista_nombres.text += str(i) + "\n"
			$puntuacionesFinales/totalSegundos.text += str(dictPunt[i]).pad_decimals(2) + "\n"
		#Scoreboard.dictTemp += load_game()
		print(str(Scoreboard.dictTemp))
		
		#print(str(load_game()))

func sort_dict(dict: Dictionary) -> void:
	var pairs = dict.keys().map(func (key): return [key, dict[key]])
	pairs.sort()
	dict.clear()
	for p in pairs:
		dict[p[0]] = p[1]

func sorted_dict(dict: Dictionary) -> Dictionary:
	var keys = dict.keys()
	keys.sort()
	var new_dict: = {}
	for k in keys:
		new_dict[k] = dict[k]
	return new_dict

func save(dict : Dictionary):
	# Create new ConfigFile object.
	var config = ConfigFile.new()
	#if config.get_value(player, "player_name") != null:
		
# Store some values.nombre_libre:
	#print("Player " + str(nombre_libre) + nombre)
	#print("Player " + str(nombre_libre) + str(Scoreboard._getPuntos()))
	for i in dict:
		config.set_value("Player", str(i), str(dict.get(nombre)) )
		
	
	#config.set_value("Player2", "player_name", "V3geta")
	#config.set_value("Player2", "score", 9001)
	
	config.save("user://scores.cfg")

func load_game():
	#var fila = FileAccess.open(file,FileAccess.READ)
	#fila.seek(0)
	#var content = fila.get_var()
	#return content
	var score_data = {}
	var config = ConfigFile.new()
# Load data from a file.
	var err = config.load("user://scores.cfg")

# If the file didn't load, ignore it.
	if err != OK:
		print("error")
	#save(nombre)
		return

# Iterate over all sections.
	for player in config.get_sections():
		# Fetch the data for each section.
		var player_name = config.get_value(player, "player_name")
		var player_score = config.get_value(player, "score")
		score_data[player_name] = player_score
		nombre_libre += 1
		for i in score_data:
			print("score data 1")
			print(str(i))
			print(str(player_score))
			
	
	return score_data
	
func _on_rejugar_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/inicio.tscn")
	pass # Replace with function body.




func _on_volver_credito_pressed() -> void:
	$ColorRect2.set_deferred("visible",false)
	pass # Replace with function body.


func _on_creditos_pressed() -> void:
	$ColorRect2.set_deferred("visible",true)
	
	pass # Replace with function body.
