extends Label

#timers
func _on_Engarde_timeout():
	text = "Engarde"

func _on_Prt_timeout():
	text = "Prêt"

func _on_Allez_timeout():
	text = "Allez!"
	Global.can_move = true

func _on_Over_timeout():
	text = ""
