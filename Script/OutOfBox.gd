extends Area2D

func _on_OutOfBoxLeft_body_entered(body):
	Global.rightscore += 1

func _on_OutOfBoxRight_body_entered(body):
	Global.rightscore += 1
