extends CenterContainer

@onready var menu_button = $VBoxContainer/MenuButton
@onready var button_sound = $ButtonSound

func _ready():
	LevelTransition.fade_from_black()
	menu_button.grab_focus()

func _on_menu_button_pressed():
	button_sound.play()
	await button_sound.finished
	get_tree().change_scene_to_file("res://start_menu.tscn")
	
