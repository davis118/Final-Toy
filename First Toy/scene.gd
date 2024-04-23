extends Area2D
signal hit

@export var speed = 20;
@export var bounce = -0.6;
@export var decay = 0.8;
@export var maxjumps = 2;
@export var g = 20;

var velocity = Vector2.ZERO # The player's movement vector.
var screen_size
var jumped=true
var onground = false



# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta):
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up") && !jumped:
		jumped=true
		onground = false
		velocity.y -= 10
	
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		# See the note below about boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "jump"
		
	position += velocity * delta * speed
