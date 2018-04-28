extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 15
const ACCEL = 50
const MAX_SPEED = 200
const JUMP_HEIGHT = -400
var d_jump = false
var grounded =  false


var motion = Vector2()

func _physics_process(delta):
	

	if is_on_floor():
		if !d_jump:
			d_jump = true

	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCEL, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCEL, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		friction = true
		$Sprite.play("Idle")
	

	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			motion.y = JUMP_HEIGHT
		else:
			if d_jump == true:
				motion.y = JUMP_HEIGHT * 0.8
				d_jump = false

		

	if !is_on_floor():
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)


	
	motion = move_and_slide(motion, UP)
	pass
	