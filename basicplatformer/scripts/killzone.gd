extends Area2D

@onready var timer: Timer = $Timer # finds the node in the path

func _on_body_entered(body: Node2D) -> void:
	print("died")
	Engine.time_scale = 0.5 # slow time
	
	# get the CollisionShape and remove it from the screen
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout() -> void:
	# runs when timer ends, want to restart the game
	Engine.time_scale = 1
	get_tree().reload_current_scene()
