extends Node

var leftscore = 0
var rightscore = 0
var has_priority = false
var player_name = ""
var current_mask = "DEFAULT"
var can_move = false
var in_defence = false
var righthit = false
var lefthit = false
var lost_priority = false

#onready var game_data = Saving.game_data

#func _ready():
	#current_mask = game_data.mask
	#player_name = game_data.name

#if moves first -> right of way
#if parry/dodge -> right of way
#if stand still or go back -> right of way     DONE
#if attack and miss -> right of way
#if jump and miss -> right of way

#if right of way -> right glowy thing? arrow?

#right of way -> left or right person
#who has right of way -> arrow points at them
#every move -> who has right of way? update if needed
