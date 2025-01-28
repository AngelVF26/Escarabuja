extends GridContainer

var player_list_with_pos = []

func _ready() -> void:
	pass
	

func add_player_to_grid(player_list):
	var pos_vbox = VBoxContainer.new()
	var name_vbox = VBoxContainer.new()
	var score_vbox = VBoxContainer.new()
	
	
	
	for score_data in player_list_with_pos:
		var pos_label = Label.new()
		pos_label.set("theme_override_font_sizes/font_size", 45)
		pos_label.set("theme_override_colors/font_color", String("#000000"))
		pos_label.set("theme_override_constants/outline_size", 11)
		pos_label.set("theme_override_colors/font_outline_color", String("#99e550"))
		pos_label.text = str(score_data["position"])
		pos_label.show()
		pos_vbox.add_child(pos_label)
	add_child(pos_vbox)
	
	for score_data in player_list_with_pos:
		var name_label = Label.new()
		name_label.set("theme_override_font_sizes/font_size", 45)
		name_label.set("theme_override_colors/font_color", String("#000000"))
		name_label.set("theme_override_constants/outline_size", 11)
		name_label.set("theme_override_colors/font_outline_color", String("#99e550"))
		name_label.text = str(score_data["player_name"])
		name_label.show()
		name_vbox.add_child(name_label)
	add_child(name_vbox)
	
	for score_data in player_list_with_pos:
		var score_label = Label.new()
		score_label.set("theme_override_font_sizes/font_size", 45)
		score_label.set("theme_override_colors/font_color", String("#000000"))
		score_label.set("theme_override_constants/outline_size", 11)
		score_label.set("theme_override_colors/font_outline_color", String("#99e550"))
		score_label.text = str(score_data["score"]).pad_decimals(2)
		score_label.show()
		score_vbox.add_child(score_label)
	add_child(score_vbox)
	
	
func sort_players_and_add_position(player_list):
	var position = 1
	for player in player_list:
		player["position"] = position
		position +=1
	
	return player_list


func _on_submit_pressed() -> void:
	print("PRESSED GRID")
	var sw_result: Dictionary = await  SilentWolf.Scores.get_scores(20).sw_get_scores_complete
	
	player_list_with_pos =sort_players_and_add_position(SilentWolf.Scores.scores)
	add_player_to_grid(player_list_with_pos)
