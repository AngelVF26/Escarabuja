extends Area2D

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
	if body.name == "nube":
		print("nubecita")
		pass
	if body.name == "burbuja_pickup":
		print("burbujita")
		pass
	if body.name == "espatula":
		print("MUERTE Y DESTRUCCION")
		pass
	pass # Replace with function body.
