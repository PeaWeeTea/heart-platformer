extends Area2D

const PICKUP_SOUND = preload("res://Sound/pickupCoin.wav")

func _on_body_entered(_body):
	self.hide()
	await AudioManager.play_sfx(PICKUP_SOUND, get_tree().current_scene)
	queue_free()
	var hearts = get_tree().get_nodes_in_group("Hearts")
	if hearts.size() == 1:
		Events.level_completed.emit()
