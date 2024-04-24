extends CharacterBody2D


const SPEED = 15
const JUMP_VELOCITY = -800.0

@onready var screen_width = get_viewport().get_visible_rect().size.x
@onready var original = position

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var canjump = true
var counter = 0




func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	

	if Input.is_action_pressed("move_right"):
		velocity.x += SPEED
	if Input.is_action_pressed("move_left"):
		velocity.x -= SPEED
	if Input.is_action_just_pressed("move_up"):
		if is_on_floor():
			canjump = true
			velocity.y += JUMP_VELOCITY
		else:
			if canjump:
				canjump = false
				velocity.y += JUMP_VELOCITY
	
		
	
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
		
	move_and_slide()
	
func increment_score():
	counter += 1
	$"gui/score/Label".text = str(counter)
	$AudioStreamPlayer2D.play()

func reset():
	position = original
	counter = 0
	$"gui/score/Label".text = ""
