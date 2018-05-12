extends Node

onready var screen_size = Vector2(640,360)
onready var g = get_node('/root/Global')
onready var last_player_pos = Get_Player_Grid_Pos()
var desired_pos
var transition_speed = 7

func _ready():
	var canvas_transform = get_viewport().get_canvas_transform()
	canvas_transform[2] = -g.player.global_position+(screen_size/4)
	desired_pos = -g.player.global_position+(screen_size/4)
	get_viewport().set_canvas_transform(canvas_transform)
	pass
	
func _process(delta):
	
	Update_Camera(delta*transition_speed)
	pass
	
func Get_Player_Grid_Pos():
	var pos = g.player.global_position
	var x = floor(pos.x / screen_size.x)
	var y = floor(pos.y / screen_size.y)
	return Vector2(x,y)

func Update_Camera(d):
	var new_player_grid_pos = Get_Player_Grid_Pos()
	var transform = Transform2D()
	#print(desired_pos)
	if new_player_grid_pos != last_player_pos:
		
		if g.props.physics.SCREEN_WRAP == false:
			last_player_pos = new_player_grid_pos
			desired_pos = -last_player_pos * screen_size
		
		var new_bounds = {
		'LEFT_BOUND' : -desired_pos.x,
		'RIGHT_BOUND' : -1*(desired_pos.x - (screen_size.x)),
		'TOP_BOUND' : -desired_pos.y,
		'BOT_BOUND' : -1*(desired_pos.y - (screen_size.y))
		}
		g.props.camera.BOUNDS = new_bounds
		pass
	transform = get_viewport().get_canvas_transform()
	
	var lerp_pos = Vector2(lerp(transform[2].x,desired_pos.x,d),lerp(transform[2].y,desired_pos.y,d))
	transform[2] = lerp_pos
	get_viewport().set_canvas_transform(transform)	
	
		
	pass
	


