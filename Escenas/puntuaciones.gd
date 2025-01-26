extends Node2D
@onready var cronometro: Timer = $Cronometro
var nombre : String = ""
@onready var lista_nombres: Label = $puntuacionesFinales/listaNombres
var file = "user://savegame.save"
var nombre_libre : int = 1
#var save_file = FileAccess.open("user://savegame.save", FileAccess.READ_WRITE)
#var load_file = FileAccess.open(file, FileAccess.READ)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$puntuacionesFinales.visible = false
	
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
		
		#guardar_partida()
		#while save_file.get_position() < save_file.get_length():
			#var json_string = save_file.get_line()
			#var json = JSON.new()
			#var parse_result = json.parse(json_string)
			#
			#
		## Get the data from the JSON object.
			#
			#if not parse_result == OK:
				#print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
				#continue
			#var node_data = json.data
			#
			#var new_object = load(node_data["filename"]).instantiate()
			#get_node(node_data["parent"]).add_child(new_object)
			#new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])
			
#
#var dic = {"number": 1}
#
#dic["number"] = 
		#print(str(load_game()))
		var truedic : Dictionary = {"nombre" : "", "puntos" : 0}
		#while truedic["nombre"+str(nombre_libre)] != "" && nombre_libre < 9:
			#nombre_libre+=1
		truedic["nombre"] = nombre
		save((truedic["nombre"]))
		print(str(load_game()))
		save((truedic["puntos"]))
		
		print(str(load_game()))
		#lista_nombres.text = str(truedic)
		
		#for i in truedic: 
			#if typeof(truedic[i]) == TYPE_STRING:
				#lista_nombres.text += str(truedic[i] + "\n")
				#print(truedic[i])
				#if truedic[i] == "":
					#break
			#elif typeof(truedic[i]) == TYPE_INT:
				#$puntuacionesFinales/totalSegundos.text += str(truedic[i]) + "\n"
				#print(truedic[i])
		#print(str(truedic["nombre"])
		#print(str(truedic))
	pass # Replace with function body.

func save(content):
	var filo
	if FileAccess.file_exists(file):
		print("existe")
		filo = FileAccess.open(file,FileAccess.READ_WRITE)
		print(filo.get_position())
		#filo.seek(filo.get_length())

	else:
		print("no existe")
		filo = FileAccess.open(file,FileAccess.WRITE)
	filo.store_var(content)
	print(filo.get_position())

	filo = null

#func read(file: FileAccess):
	#while file.get_position() < file.get_length():
		#var json_string = file.get_line()
		#var json = JSON.new()
		#var parse_result = json.parse(json_string)
		#var node_data = json.get_data()
		#
		#return node_data
		
func load_game():
	var fila = FileAccess.open(file,FileAccess.READ)
	fila.seek(0)
	var content = fila.get_var()
	return content
	
func _on_rejugar_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/inicio.tscn")
	pass # Replace with function body.
