extends Node

var props = {
    'move_state' : {
        'current' : 0,
        'TANG' : 0,
        'INTANG' : 1
    },
    'damage_state' : {
        'current' : 0,
        'VULN' : 0,
        'INVULN': 1,
    },
	'physic_state' : {
		'current' : 0,
		'NORMAL' : 0,
		'ZIPPING' : 1,
		'NO_CLIP' : 2,
	},
	'physics' :{
		'GRAVITY' : 0,
		'ACCEL' : 0,
 		'MAX_SPEED' : 0,
		'JUMP_HEIGHT' : 0,
		'GROUNDED_FRICTION' : 0,
		'AERIAL_FRICTION' : 0,
		'COLLIDING' : false,
		'SCREEN_WRAP' : false,
		'CANCEL_MOMENTUM' : false
	}
}
var main_camera
var cam_node
var camera_track
var player

const PROP_TEMPLATES = {
	'NORMAL' : {
		'GRAVITY' : 15,
		'ACCEL' : 50,
 		'MAX_SPEED' : 400,
		'JUMP_HEIGHT' : -400,
		'GROUNDED_FRICTION' : 0.2,
		'AERIAL_FRICTION' : 0.175,
		'COLLIDING' : true,
		'SCREEN_WRAP' : false,
		'CANCEL_MOMENTUM' : false
	},
	'ZIPPING' : {
		'GRAVITY' : 0,
		'ACCEL' : 300,
 		'MAX_SPEED' : 400,
		'JUMP_HEIGHT' : -400,
		'GROUNDED_FRICTION' : 0,
		'AERIAL_FRICTION' : 0,
		'COLLIDING' : false,
		'SCREEN_WRAP' : true,
		'CANCEL_MOMENTUM' : true
	},
	'DASHING' : {
		'GRAVITY' : 0,
		'ACCEL' : 0,
 		'MAX_SPEED' : 200,
		'JUMP_HEIGHT' : 0,
		'GROUNDED_FRICTION' : 0,
		'AERIAL_FRICTION' : 0,
		'COLLIDING' : false,
		'SCREEN_WRAP' : false,
		'CANCEL_MOMENTUM' : true
	},
	'NO_CLIP' : {
		'GRAVITY' : 15,
		'ACCEL' : 50,
 		'MAX_SPEED' : 400,
		'JUMP_HEIGHT' : -400,
		'GROUNDED_FRICTION' : 0.2,
		'AERIAL_FRICTION' : 0.175,
		'COLLIDING' : false,
		'SCREEN_WRAP' : false,
		'CANCEL_MOMENTUM' : false
	},
}
func _ready():
	Change_Physic_State(0)
	Initialize_Camera()
	pass

func _process(delta):
	if player != null && camera_track != null:
		Camera_Follow(delta)
	pass
	
func Initialize_Camera():
	main_camera = Node2D.new()
	cam_node = Camera2D.new()
	main_camera.set_name('Main Camera')
	cam_node.set_name('Cam Node')
	add_child(main_camera,true)
	main_camera.add_child(cam_node,true)
	cam_node.anchor_mode = 1
	cam_node.make_current()
	cam_node.smoothing_enabled = true
	cam_node.smoothing_speed = 5
	
	pass
	
func Change_Physic_State(val):
	props.physic_state['current'] = val
	if val == 0:
		props.physics = PROP_TEMPLATES.NORMAL
	elif val == 1:
		props.physics = PROP_TEMPLATES.ZIPPING
	elif val == 2:
		props.physics = PROP_TEMPLATES.DASHING
	
	pass

func Assign_Camera_Track(track):
	camera_track = track
	pass


func Distance_Sort(a,b):
	if player.get_global_position().distance_to(a) < player.get_global_position().distance_to(b):
		return true
	return false
	


func Camera_Follow(d):
	var path_points = camera_track.curve.get_baked_points()
	var my_array = Vector2()
	var points_array = [my_array]
	
	for x in range(path_points.size()):
		points_array.append(path_points[x])
		pass
	points_array.sort_custom(self,'Distance_Sort')
	var target_pos = Vector2(points_array[0].x,points_array[0].y)
	main_camera.global_position = target_pos
	pass

