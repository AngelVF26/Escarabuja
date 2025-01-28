extends Node

var blSaveLoad = null
var puntos 
var pos_dict = {}
var datos_originales

var dat_pasados
var dictTemp : Dictionary 

func _setPuntos(points):
	puntos = points
func _getPuntos():
	return puntos
	
	
var file = "user://scores.cfg"
var default_dict 
func _ready():
	dat_pasados = datos_originales
	#borrarPartida()
	if not FileAccess.file_exists(file):
		print("holiwi")
		save_game(default_dict)
	elif blSaveLoad == false:
		load_game()
	else:
		pass

func save_game(datos_nuevos: Dictionary):
	var json_string
	if not FileAccess.file_exists(file):
		json_string = JSON.stringify(default_dict)
	else:
		datos_originales = load_game()
		print(str(datos_originales))
		#dictTemp = datos_originales
		
					#print("datos_nuevos superiores")
		json_string = JSON.stringify(datos_nuevos)
	var saveGame = FileAccess.open(file, FileAccess.WRITE)
	saveGame.store_line(json_string)
	
func load_game():
	if not FileAccess.file_exists(file):
		print("no retorna")
		return
	print("si retorna")
	var loadGame = FileAccess.open(file, FileAccess.READ)
	var datos = read(loadGame)
	return datos
	#var score_data = {}
	#var config = ConfigFile.new()
## Load data from a file.
	#var err = config.load("user://scores.cfg")
#
## If the file didn't load, ignore it.
	#if err != OK:
		#print("error")
		##save(nombre)
		#return
#
## Iterate over all sections.
	#for player in config.get_sections():
		## Fetch the data for each section.
		#var player_name = config.get_value(player, "player_name")
		#var player_score = config.get_value(player, "score")
		#score_data[player_name] = player_score
		##nombre_libre += 1
		#for i in score_data:
			#print("score data 1")
			#print(str(i))
			#print(str(player_score))
		#
		#return score_data
	

func borrarPartida():
	print("a borrar")
	DirAccess.remove_absolute(file)

func read(file: FileAccess):
	while file.get_position() < file.get_length():
		var json_string = file.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		return node_data
