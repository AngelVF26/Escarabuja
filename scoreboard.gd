extends Node

var blSaveLoad = null
var puntos 
var pos_dict = {}

var Scores = {
	"nombre1" : "", "puntos1" : 0,
	"nombre2" : "", "puntos2" : 0,
	"nombre3" : "", "puntos3" : 0,
	"nombre4" : "", "puntos4" : 0,
	"nombre5" : "", "puntos5" : 0,
	"nombre6" : "", "puntos6" : 0,
	"nombre7" : "", "puntos7" : 0,
	"nombre8" : "", "puntos8" : 0,
	"nombre9" : "", "puntos9" : 0
}

var dictTemp : Dictionary

func _setPuntos(points):
	puntos = points
func _getPuntos():
	return puntos
	
	
var file = "user://savegame.save"
var default_dict = {
		"Player 1" : {
			"nombre" : "",
			"puntuacion" : 0
		},
		"Player 2" : {
			"nombre" : "",
			"puntuacion" : 0
		},
		"Player 3" : {
			"nombre" : "",
			"puntuacion" : 0
		},
		"Player 4" : {
			"nombre" : "",
			"puntuacion" : 0
		},
		"Player 5" : {
			"nombre" : "",
			"puntuacion" : 0
		},
		"Player 6" : {
			"nombre" : "",
			"puntuacion" : 0
		},
		"Player 7" : {
			"nombre" : "",
			"puntuacion" : 0
		},
		"Player 8" : {
			"nombre" : "",
			"puntuacion" : 0
		},
		"Player 9" : {
			"nombre" : "",
			"puntuacion" : 0
		},
		"Player 10" : {
			"nombre" : "",
			"puntuacion" : 0
		}
	}
func _ready():
	#borrarPartida()
	if not FileAccess.file_exists(file):
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
		var datos_originales = load_game()
		for datos in datos_originales.keys():
			for dato in datos_originales[datos]:
				if datos_nuevos[datos][dato] < datos_originales[datos][dato]:
					datos_nuevos[datos][dato] = datos_originales[datos][dato]
				else:
					print("datos_nuevos superiores")
		json_string = JSON.stringify(datos_nuevos)
	var saveGame = FileAccess.open_encrypted_with_pass(file, FileAccess.WRITE, "kebab")
	saveGame.store_line(json_string)
	
func load_game():
	if not FileAccess.file_exists(file):
		return
	
	var loadGame = FileAccess.open_encrypted_with_pass(file, FileAccess.READ, "kebab")
	var datos = read(loadGame)
	return datos
	

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
