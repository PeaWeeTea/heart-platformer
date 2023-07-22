extends ColorRect

signal retry()
signal next_level()

@onready var retry_button = %RetryButton
@onready var next_level_button = %NextLevelButton
@onready var button_sound = $ButtonSound
@onready var cycle_sound = $CycleSound

func _process(delta):
	if (Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right")) and (next_level_button.has_focus() or retry_button.has_focus()):
		cycle_sound.play()

func _on_retry_button_pressed():
	button_sound.play()
	retry.emit()

func _on_next_level_button_pressed():
	button_sound.play()
	next_level.emit()
