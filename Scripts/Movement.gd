extends KinematicBody2D


#const GRAVITY = 15
#const ACCEL = 50
#const MAX_SPEED = 400
#const JUMP_HEIGHT = -400
#const GROUNDED_FRICTION = 0.2
#const AERIAL_FRICTION = 0.175
const UP = Vector2(0,-1)
onready var g = get_node('/root/Global')
var motion = Vector2()
var current_friction = 0


func _ready():
	g.Change_Prop('special_state', 0)
	current_friction = g.props.physics.GROUNDED_FRICTION
	
	pass

func _physics_process(delta):
	
	if is_on_floor():
		current_friction = g.props.physics.GROUNDED_FRICTION
	else:
		current_friction = g.props.physics.AERIAL_FRICTION
	
	if is_on_floor():
		if Input.is_action_just_pressed('ui_up'):
			motion.y = g.props.physics.JUMP_HEIGHT
	
	if Input.is_action_pressed('ui_right'):
		motion.x = min(motion.x+g.props.physics.ACCEL, g.props.physics.MAX_SPEED)
	
	if Input.is_action_pressed('ui_left'):
        motion.x = max(motion.x-g.props.physics.ACCEL,-g.props.physics.MAX_SPEED)
		
	if Input.is_action_pressed('ui-down'):
		pass
    
	motion.y += g.props.physics.GRAVITY
	motion.x = lerp(motion.x,0,current_friction)
	motion = move_and_slide(motion,UP)
	pass

func _on_Area2D_body_entered(body):
	if body.get_collision_layer_bit(1) == true:
		g.Change_Prop('special_state', 1)
		pass
	pass 
