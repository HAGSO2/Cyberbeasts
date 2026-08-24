extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_new_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Controls.tscn")


func _on_load_pressed(save_menu: NodePath) -> void:
	get_node(save_menu).visible = true


func _on_back_button_pressed(save_menu: NodePath) -> void:
	get_node(save_menu).visible = false
