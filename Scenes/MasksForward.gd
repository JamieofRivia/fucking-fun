extends Node2D

func _process(delta):
	match Global.current_mask:
		"UK":
			disable_every_mask()
			$Ukflag.visible = true
		"GERMANY":
			disable_every_mask()
			$Germanyflag.visible = true
		"DEFAULT":
			disable_every_mask()

func disable_every_mask():
	$Germanyflag.visible = false
	$Ukflag.visible = false
