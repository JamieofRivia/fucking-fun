extends Node2D

#comment

func _on_StartPractice_pressed():
	get_tree().change_scene("res://Scenes/FoilStrip.tscn")

func _on_Start1v1_pressed():
	get_tree().change_scene("res://Scenes/FoilStrip1v1.tscn")

func _on_Profile_pressed():
	get_tree().change_scene("res://Scenes/Profile.tscn")

