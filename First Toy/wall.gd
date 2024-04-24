extends StaticBody2D

@onready var screen_height = get_viewport().get_visible_rect().size.y
@onready var screen_width = get_viewport().get_visible_rect().size.x
@onready var original = position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_screen_transform().get_origin().y>screen_height:
		global_position += Vector2(0,-1200)
	
	if get_screen_transform().get_origin().y<-screen_height:
		visible = false
		get_tree().get_first_node_in_group("game").death()

func reset():
	position = original
	visible = true
