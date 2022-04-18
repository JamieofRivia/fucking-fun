extends Node

onready var fencer = $Fencer
onready var SAVE_KEY : String = "Profile" + name

onready var game_data = Saving.game_data

func _ready():
	Global.current_mask = game_data.mask
	Global.player_name = game_data.name

#player name
func _on_LineEdit_text_entered(new_text):
	$Label.text = new_text
	Global.player_name = new_text
	Saving.save_data()
	
func _on_ResetButton_pressed():
	Global.current_mask = "DEFAULT"
	Saving.save_data()

func _on_UkButton_pressed():
	Global.current_mask = "UK"
	Saving.save_data()

func _on_GermanyButton_pressed():
	Global.current_mask = "GERMANY"
	Saving.save_data()
		
func _on_BackButton_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")


