extends CenterContainer

@onready var start_game_button = %StartGameButton
@onready var quit_button = %QuitButton
@onready var button_sound = %ButtonSound
@onready var cycle_sound = $CycleSound


func _process(delta):
	if (Input.is_action_just_pressed("move_up") or Input.is_action_just_pressed("move_down")) and (start_game_button.has_focus() or quit_button.has_focus()):
		cycle_sound.play()

func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)
	start_game_button.grab_focus()

func _on_start_game_button_pressed():
	button_sound.play()
	await LevelTransition.fade_to_black()
	get_tree().change_scene_to_file("res://level_one.tscn")
	LevelTransition.fade_from_black()

func _on_quit_button_pressed():
	button_sound.play()
	get_tree().quit()
