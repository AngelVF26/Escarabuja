extends Area2D
@onready var time_aire: Timer = $"../../TimeAire"
@onready var texture_progress_bar: TextureProgressBar = $"../../GUI/Medidor Aire/TextureProgressBar"
@onready var nivel: Node2D = $"../.."
var tocodorada : bool
@onready var bichote: CharacterBody2D = $bichote
var nombre: String = "Burbuja"
var burbuja_explota: bool = true
@onready var audio_stream_player: AudioStreamPlayer = $"../../AudioStreamPlayer"
@onready var burbuja: Sprite2D = $Burbuja
@onready var colision: CollisionShape2D = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$Burbuja.texture = load("res://assets/relleno burbuja dorada2.png")
	#$BurbujaBorde.texture = load("res://assets/burbuja dorada borde2.png")
	#$CollisionShape2D.disabled = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print($CollisionShape2D.disabled)
	pass

func _physics_process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	#print("funciona body")
	#print(body.name)
	#if body.nombre == "Nube":
		#print("nubecita")
		#texture_progress_bar.value +=-5
		#body.playSound()
		#pass
	#if body.nombre == "Burbuja":
		#if body.dorada == true:
			#print("dorada oh oh")
			#tocodorada = true
			#burbuja.texture = load("res://assets/relleno burbuja dorada2.png")
			#$BurbujaBorde.texture = load("res://assets/burbuja dorada borde2.png")
#
			#
		#print("burbujita oh oh")
		#texture_progress_bar.value +=10
		#body.playSound()
		#
	#if body.nombre == "Matamoscas":
		#print("MUERTE Y DESTRUCCION")
		#body.playSound()
		#nivel.HAS_MUERTO()
	pass

func _on_body_exited(body: Node2D) -> void:
	print(body.name)


func _on_animated_sprite_2d_animation_finished() -> void:
	visible = false
	set_deferred("visible",false)


func _on_burbuja_texture_changed() -> void:
	#if tocodorada:
		#print("EL DORADO IS REAL")
		#colision.disabled = true
	#else:
		#print("EL DORADO IS FALSE")
		#colision.disabled = false
	pass
		


func _on_area_entered(area: Area2D) -> void:
	print("funciona area")
	print(area.name)
	if area.name == "AreaNube":
		area.get_parent().playSound()
		print("nubecita")
		texture_progress_bar.value +=-5
		pass
	if area.name == "Areaburbuja":
		area.get_parent().playSound()
		if area.get_parent().dorada == true:
			print("dorada oh oh")
			tocodorada = true
			burbuja.texture = load("res://assets/relleno burbuja dorada2.png")
			$BurbujaBorde.texture = load("res://assets/burbuja dorada borde2.png")
			texture_progress_bar.value +=20
		else:
			texture_progress_bar.value +=10
		print("burbujita oh oh")
		
		#
	if area.name == "AreaMoscas":
		print("MUERTE Y DESTRUCCION")
		#area.get_parent().playSound()
		nivel.HAS_MUERTO()
