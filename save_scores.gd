extends Node

var file = "user://savegame.save"
var blSaveLoad = null

var default_dict = {
		"Nombre" : {
			"tiempo" : 0,
		}
	}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	saveGame.seek_end()
	saveGame.store_line(json_string)
	
func load_game():
	if not FileAccess.file_exists(file):
		return
	
	var loadGame = FileAccess.open_encrypted_with_pass(file, FileAccess.READ, "kebab")
	var datos = read(loadGame)
	return datos

func read(file: FileAccess):
	while file.get_position() < file.get_length():
		var json_string = file.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		return node_data
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
