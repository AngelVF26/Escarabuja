extends Area2D
@onready var time_aire: Timer = $"../../TimeAire"
@onready var texture_progress_bar: TextureProgressBar = $"../../GUI/Medidor Aire/TextureProgressBar"
@onready var nivel: Area2D = $"../.."
var tocodorada : bool
@onready var bichote: CharacterBody2D = $bichote
var nombre: String = "Burbuja"
var burbuja_explota: bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func _physics_process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	print("funciona body")
	print(body.name)
	if body.nombre == "Nube":
		print("nubecita")
		texture_progress_bar.value +=-5
		pass
	if body.nombre == "Burbuja":
		if body.dorada == true:
			print("dorada oh oh")
			tocodorada = true
		print("burbujita oh oh")
		texture_progress_bar.value +=10
	if body.nombre == "Matamoscas":
		print("MUERTE Y DESTRUCCION")
		nivel.HAS_MUERTO()

func _on_body_exited(body: Node2D) -> void:
	print(body.name)


func _on_animated_sprite_2d_animation_finished() -> void:
	visible = false
	set_deferred("visible",false)
