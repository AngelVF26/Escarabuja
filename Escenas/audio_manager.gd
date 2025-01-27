extends Node2D

func _ready():
	$HSlider.value = AudioSettings.audio_value

func _on_h_slider_value_changed(value):
	AudioSettings.audio_value = value
	AudioServer.set_bus_volume_db(0, linear_to_db(value))
