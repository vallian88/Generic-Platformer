extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 15
const ACCEL = 50
const MAX_SPEED = 400
const JUMP_HEIGHT = -400
const GROUNDED_FRICTION = 0.2
const AERIAL_FRICTION = 0.175

var motion = Vector2()
var current_friction = GROUNDED_FRICTION




func _physics_process(delta):
	
	if is_on_floor():
		current_friction = GROUNDED_FRICTION
	else:
		current_friction = AERIAL_FRICTION
	
	if is_on_floor():
		if Input.is_action_just_pressed('ui_up'):
			motion.y = JUMP_HEIGHT
	
	if Input.is_action_pressed('ui_right'):
		motion.x = min(motion.x+ACCEL, MAX_SPEED)
	
	if Input.is_action_pressed('ui_left'):
        motion.x = max(motion.x-ACCEL,-MAX_SPEED)
    
	motion.y += GRAVITY
	motion.x = lerp(motion.x,0,current_friction)
	motion = move_and_slide(motion,UP)
	pass