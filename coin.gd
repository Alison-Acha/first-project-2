extends Sprite2D

var is_collected = false 
func _on_interaction_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player') and not is_collected:
		is_collected = true
		Global.total_coins += 100
		$interaction/AudioStreamPlayer2D.play()
		hide() 
