extends Node

var score = 0
@onready var label: Label = $Label4

func add_point():
	# add a point to the score
	score += 1
	label.text = "You got " + str(score) + " coins!"
