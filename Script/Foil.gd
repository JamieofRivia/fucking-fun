extends KinematicBody2D

var weapon_state = "UP"

func _process(delta):
	if Global.can_move == true:
		if Input.is_action_just_pressed("leftclick"):
			
			if weapon_state == "UP":
				rotate(PI/2)
				$Timer.start()
				weapon_state = "DOWN"
			elif weapon_state == "HALF":
				rotate(PI/4)
				weapon_state = "DOWN"

		if Input.is_action_just_pressed("rightclick"):
			if weapon_state == "UP":
				rotate(PI/4)
				$Timer.start()
				weapon_state = "HALF"
			elif weapon_state == "DOWN":
				rotate(PI/-4)
				weapon_state = "HALF"
		
		
		if weapon_state == "HALF":
			Global.in_defence = true
		else:
			Global.in_defence = false


func _on_Timer_timeout():
	if weapon_state == "HALF":
		rotate(PI/-4)
		weapon_state = "UP"
	elif weapon_state == "DOWN":
		rotate(PI/-2)
		weapon_state = "UP"
	else:
		pass
