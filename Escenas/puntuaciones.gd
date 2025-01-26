extends Node2D
@onready var cronometro: Timer = $Cronometro
var nombre : String = ""
@onready var lista_nombres: Label = $puntuacionesFinales/listaNombres
var file = "user://savegame.txt"
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
		
		load_game()
		Scoreboard.dictTemp
		save(nombre)
		
		print(str(load_game()))
#
#
#dic["number"] = 
		#print(str(load_game()))
		#var truedic : Dictionary = {"nombre" : "", "puntos" : 0}
		##while truedic["nombre"+str(nombre_libre)] != "" && nombre_libre < 9:
			##nombre_libre+=1
		#truedic["nombre"] = nombre
		#save((truedic["nombre"]))
		#print(str(load_game()))
		#save((truedic["puntos"]))
		
		#print(str(load_game()))
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

#func save(content):
	#var filo
	#if FileAccess.file_exists(file):
		#print("existe")
		#filo = FileAccess.open(file,FileAccess.READ_WRITE)
		#print(filo.get_position())
		##filo.seek(filo.get_length())
#
	#else:
		#print("no existe")
		#filo = FileAccess.open(file,FileAccess.WRITE)
	#filo.store_var(content)
	#print(filo.get_position())
#
	#filo = null
	
func save(nombre):
	# Create new ConfigFile object.
	var config = ConfigFile.new()
	
# Store some values.nombre_libre:
	print("Player " + str(nombre_libre) + nombre)
	print("Player " + str(nombre_libre) + str(Scoreboard._getPuntos()))
	config.set_value("Player" + str(nombre_libre), "player_name", nombre)
	config.set_value("Player" + str(nombre_libre), "score", Scoreboard._getPuntos())
	
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
		save(nombre)
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
	$ColorRect2.set_deferred("visible",true)
	pass # Replace with function body.




func _on_volver_credito_pressed() -> void:
	$ColorRect2.set_deferred("visible",false)
	pass # Replace with function body.


func _on_creditos_pressed() -> void:
	pass # Replace with function body.
