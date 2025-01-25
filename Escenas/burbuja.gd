extends Area2D
@onready var time_aire: Timer = $"../../TimeAire"
@onready var texture_progress_bar: TextureProgressBar = $"../../GUI/Medidor Aire/TextureProgressBar"

@onready var bichote: CharacterBody2D = $bichote
var nombre: String = "Burbuja"
var burbuja_explota: bool = false
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
	if body.name == "nube":
		print("nubecita")
		texture_progress_bar.value +=-5
		
	if body.name == "burbuja_pickup":
		print("burbujita oh oh")
		texture_progress_bar.value +=10
	if body.name == "espatula":
		print("MUERTE Y DESTRUCCION")


func _on_body_exited(body: Node2D) -> void:
	print(body.name)
