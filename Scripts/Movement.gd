extends KinematicBody2D

const UP = Vector2(0,-1)
onready var g = get_node('/root/Global')
var motion = Vector2()
var current_friction = 0
signal move


func _ready():
	
	current_friction = g.props.physics.GROUNDED_FRICTION
	g.player = self
	pass

func _physics_process(delta):
	if is_on_floor():
		current_friction = g.props.physics.GROUNDED_FRICTION
	else:
		current_friction = g.props.physics.AERIAL_FRICTION
	
	if is_on_floor() || g.props.physic_state.current == 1:
		if Input.is_action_just_pressed('jump'):
			motion.y = g.props.physics.JUMP_HEIGHT
	
	if Input.is_action_pressed('right'):
		motion.x = min(motion.x+g.props.physics.ACCEL, g.props.physics.MAX_SPEED)
	
	if Input.is_action_pressed('left'):
        motion.x = max(motion.x-g.props.physics.ACCEL,-g.props.physics.MAX_SPEED)
		
	if Input.is_action_pressed('down'):
		Change_Physic_State(2)
		motion.y = 300
		pass
    
	Screen_Wrap()
	motion.y += g.props.physics.GRAVITY
	motion.x = lerp(motion.x,0,current_friction)
	motion = move_and_slide(motion,UP)
	pass

func _on_Area2D_body_entered(body):
	if body.get_collision_layer_bit(0) == true:
		Change_Physic_State(1)
		pass
	pass
	
func _on_Internal_Area_body_exited(body):
	if body.get_collision_layer_bit(0) == true:
		Change_Physic_State(0)
		pass
	pass
	
func Change_Physic_State(val):
	var oldVal = g.props.physic_state.current
	if oldVal != val:
		g.Change_Physic_State(val)
		
		if g.props.physics.CANCEL_MOMENTUM == true:
			motion = Vector2()
			pass
	$Collider.disabled = !g.props.physics.COLLIDING
	pass 
	
func Screen_Wrap():
	if g.props.physics.SCREEN_WRAP == true:
		if global_position.x > g.props.camera.BOUNDS.RIGHT_BOUND:
			global_position.x = g.props.camera.BOUNDS.LEFT_BOUND
		if global_position.x < g.props.camera.BOUNDS.LEFT_BOUND:
			global_position.x = g.props.camera.BOUNDS.RIGHT_BOUND
		if global_position.y > g.props.camera.BOUNDS.BOT_BOUND:
			global_position.y = g.props.camera.BOUNDS.TOP_BOUND
		if global_position.y < g.props.camera.BOUNDS.TOP_BOUND:
			global_position.y = g.props.camera.BOUNDS.BOT_BOUND
	pass
