extends Node2D

const SPEED = 100

func _ready():
	$Fencer/ArrowControl/Arrow.visible = false

func _on_ReturnButton_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
