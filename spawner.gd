extends Node2D

@onready var label: Label = $Label
@onready var cronometro: Timer = $Cronometro
var segundos: float = 0
var Burbuja
var Nube
var Matamoscas
var spawneados: Array
@onready var timer_spawns: Timer = $TimerSpawns
const BURBUJA = preload("res://Escenas/burbuja_pickup.tscn")
const NUBE = preload("res://Escenas/nube.tscn")
const MATAMOSCAS = preload("res://Escenas/matamoscas.tscn")
var listaSpawn: Array = [BURBUJA, NUBE, MATAMOSCAS]
#var pos_spawn = $Area2D.get_global_position()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_cronometro_timeout() -> void:
	segundos += cronometro.wait_time
	label.text = str(segundos).pad_decimals(2)
	cronometro.start


func _on_timer_spawns_timeout() -> void:
	if spawneados.size() > 4 && !spawneados.has(BURBUJA) :
		spawneados.append(BURBUJA)
	else:
		spawneados.append(listaSpawn.pick_random())
	
	var new_spawn = spawneados.back().instantiate()
	new_spawn.global_position = Vector2(randf_range(100,1000),100)
	new_spawn
	call_deferred("add_sibling",new_spawn)
	
	if spawneados.size() > 5:
		spawneados.remove_at(0)
	

	print(spawneados)

	timer_spawns.start()
	
