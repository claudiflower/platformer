extends Area2D
@onready var game_manager: Node = $"../../GameManager"
@onready var animation_player: AnimationPlayer = $AudioStreamPlayer2D/AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	print("+1")
	game_manager.add_point()
	#animation_player.play("pickup")
	queue_free()
