extends StaticBody2D

const decay = 0.95
const minx = 0.2
const miny = 0.4

@onready var screen_width = get_viewport().get_visible_rect().size.y
@onready var screen_height = get_viewport().get_visible_rect().size.y
@onready var player = get_tree().get_first_node_in_group("player")
@onready var original = position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(get_screen_transform().get_origin().y)
	if get_screen_transform().get_origin().y>screen_width:
		global_position += Vector2(0,-1200)
		position.x = randi_range(64,344)
		scale *= decay
		scale.x = max(scale.x, minx)
		scale.y = max(scale.y, miny)
		player.increment_score()
		
	if get_screen_transform().get_origin().y<-screen_height:
		visible = false
	
func reset():
	position = original
	scale = Vector2(1,1)
	visible = true
