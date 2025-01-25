extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass


func _on_final_col_body_entered(body: Node2D) -> void:
	if body.name == "bichote":
		body.position = Vector2(body.position.x,70)
		
	pass # Replace with function body.
