extends CharacterBody2D

const SPEED = 20.0
const JUMP_VELOCITY = -400.0
@onready var label: Label = $Label
@onready var cronometro: Timer = $Cronometro
var segundos: float = 0
var spawneados: Array
@onready var timer_spawns: Timer = $TimerSpawns

var Burbuja = load("res://Escenas/burbuja_pickup.tscn")
var Nube = load("res://Escenas/nube.tscn")
var Matamoscas = load("res://Escenas/matamoscas.tscn")
var listaSpawn: Array = [Burbuja, Nube, Matamoscas]
#var pos_spawn = $Area2D.get_global_position()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#velocity.y = -SPEED * 0.8
	#if Input.is_action_pressed("paizquierda"):
		#rotation_degrees = -15
	#if Input.is_action_pressed("paderecha"):
		#rotation_degrees = 15
	#if Input.is_action_just_released("paderecha"):
		#rotation_degrees = 0
	#if Input.is_action_just_released("paizquierda"):
		#rotation_degrees = 0
	#if Input.is_action_pressed("sprint"):
		#velocity.y = -SPEED *1.5
	#if Input.is_action_just_released("sprint"):
		#velocity.y = direction_y * SPEED
	#if Input.is_action_pressed("pabajo"):
		#if !Input.is_action_pressed("sprint"):
			#velocity.y = -SPEED * 0.3
	#if Input.is_action_just_released("pabajo"):
		#velocity.y = -SPEED * 0.8
	
	move_and_slide()

func _on_cronometro_timeout() -> void:
	segundos += cronometro.wait_time
	cronometro.start


func _on_timer_spawns_timeout() -> void:
	if spawneados.size() > 4 && !spawneados.has(Burbuja) :
		spawneados.append(Burbuja)
	else:
		spawneados.append(listaSpawn.pick_random())
	
	var new_spawn = spawneados.back().instantiate()
	new_spawn.global_position = Vector2(randf_range(100,1000),100)
	new_spawn
	call_deferred("add_sibling",new_spawn)
	
	if spawneados.size() > 5:
		spawneados.remove_at(0)
	timer_spawns.start()
	
