extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$CharacterBody2D.reset()
	for i in $walls.get_children():
		i.reset()
	for i in $platforms.get_children():
		i.reset()
	get_tree().get_first_node_in_group	("gameover").visible = false
	
	pass # Replace with function body.

func death():
	print("hello")
	get_tree().get_first_node_in_group("gameover").visible = true
