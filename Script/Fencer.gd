extends KinematicBody2D

const SPEED = 200
const JUMP_SPEED = 7500

var velocity = Vector2()
var is_moving = false

signal moving

func _physics_process(delta):
	if Global.current_mask == "GERMANY":
		$Germanyside.visible = true
		
	if Global.current_mask == "UK":
		$Ukside.visible = true
	
	if Global.current_mask == "DEFAULT":
		disable_every_mask()
	#movement left - right
	if Global.can_move == true:
		if Input.is_action_pressed("d"):
			velocity.x = SPEED
			emit_signal("moving")
		elif Input.is_action_pressed("a"):
			Global.lost_priority = true
			velocity.x = -SPEED
			Global.has_priority = false
		else:
			Global.lost_priority = true
			velocity.x = 0
	
		#jump
		if Input.is_action_just_released("space"):
			velocity.x = JUMP_SPEED
			$AttackTimer.start()
			
		move_and_slide(velocity)
	
	#right of way
	if Global.has_priority == false:
		$ArrowControl/Arrow.visible = false
		$Hurtbox/CollisionShape2D2.disabled =  false
	if Global.has_priority == true:
		$ArrowControl/Arrow.visible = true
		$Hurtbox/CollisionShape2D2.disabled =  true
		
func _on_Fencer_moving():
	Global.has_priority = true
	$PriorityTimer.start()

func _on_Timer_timeout():
	Global.has_priority = false
	
func _on_Hurtbox_body_entered(body):
	if Global.in_defence == false:
		Global.righthit = true
		Global.rightscore += 1
		Global.can_move = false
		$PauseTimer.start()
		
func disable_every_mask():
	$Germanyside.visible = false
	$Ukside.visible = false

func _on_PauseTimer_timeout():
	get_tree().reload_current_scene()
	Global.righthit = false
