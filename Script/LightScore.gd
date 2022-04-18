extends Node2D


func _process(delta):
	if Global.lefthit == true:
		$FencingStrip/LeftGreenLight.visible = true
		$FencingStrip/RightRedLight.visible = true
	elif Global.righthit == true:
		$FencingStrip/LeftRedLight.visible = true
		$FencingStrip/RightGreenLight.visible = true
	else:
		$FencingStrip/LeftGreenLight.visible = false
		$FencingStrip/RightRedLight.visible = false
		$FencingStrip/LeftRedLight.visible = false
		$FencingStrip/RightGreenLight.visible = false

