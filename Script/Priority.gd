extends Node2D

var has_priority = false
var is_moving = false

func _process(delta):
#right of way
	if has_priority == false:
		$Fencer/ArrowControl/Arrow.visible = false
	if has_priority == true:
		$Fencer/ArrowControl/Arrow.visible = true

func _on_Fencer_moving():
	has_priority = true
	$Timer.start()

func _on_Timer_timeout():
	has_priority = false
	
func lost_priority():
	pass
