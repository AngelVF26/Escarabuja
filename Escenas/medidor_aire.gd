extends Node2D

@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar
@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_progress_bar.value= 30


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = str(texture_progress_bar.value)
