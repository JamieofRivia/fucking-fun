extends KinematicBody2D

const SPEED = 100

var velocity = Vector2()
var state = "RUNFORWARD"
var extended = false

onready var fencer_left = load("res://Script/Fencer.gd")

func _process(delta):
	match state:
		"ARMEXTEND":
			arm_extend()
		"DEFEND":
			pass
		"RUNBACK":
			pass
		"RUNFORWARD":
			pass



func _physics_process(delta):
	if Global.can_move == true and state == "RUNFORWARD":
		velocity.x = -SPEED
		move_and_slide(velocity * SPEED * delta)
		
	if Global.can_move == true and state == "RUNBACK":
		velocity.x = SPEED
		move_and_slide(velocity * SPEED * delta)
	
	
	
	if Global.has_priority == false:
		$ArrowControl/Arrow.visible = true
		$Hurtbox/CollisionShape2D2.disabled =  true
	if Global.has_priority == true:
		$ArrowControl/Arrow.visible = false
		$Hurtbox/CollisionShape2D2.disabled =  false

func _on_Hurtbox_body_entered(body):
	if Global.righthit != true:
		Global.lefthit = true
		Global.leftscore += 1
		Global.can_move = false
		$PauseTimer.start()


func _on_PrioAttack_body_entered(body):
	if Global.has_priority == false:
		state = "ARMEXTEND"

func _on_DefAttack_body_entered(body):
	state = "ARMEXTEND"


func arm_extend():
	if Global.in_defence == false and extended == false:
		$Foil.rotate(-PI/2)
		extended = true
	elif Global.in_defence == true and extended == false:
		$Foil.rotate(-PI/4)
		extended = true


func _on_PauseTimer_timeout():
	get_tree().reload_current_scene()
	Global.lefthit = false
