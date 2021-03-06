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
		'NO_FRICTION': 3
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
	},
	'camera' :{
		'BOUNDS' :{
		'LEFT_BOUND' : 0,
		'RIGHT_BOUND' : 0,
		'TOP_BOUND' : 0,
		'BOT_BOUND' : 0
		}
	}
}
#var main_camera
#var cam_node
#var camera_track
var player

const PROP_TEMPLATES = {
	'NORMAL' : {
		'GRAVITY' : 16,
		'ACCEL' : 16,
 		'MAX_SPEED' : 128,
		'JUMP_HEIGHT' : -320,
		'GROUNDED_FRICTION' : 0.2,
		'AERIAL_FRICTION' : 0.175,
		'COLLIDING' : true,
		'SCREEN_WRAP' : false,
		'CANCEL_MOMENTUM' : false
	},
	'ZIPPING' : {
		'GRAVITY' : 0,
		'ACCEL' : 1312,
 		'MAX_SPEED' : 1312,
		'JUMP_HEIGHT' : -432,
		'GROUNDED_FRICTION' : 0,
		'AERIAL_FRICTION' : 0,
		'COLLIDING' : false,
		'SCREEN_WRAP' : true,
		'CANCEL_MOMENTUM' : true
	},
	'DASHING' : {
		'GRAVITY' : 0,
		'ACCEL' : 0,
 		'MAX_SPEED' : 192,
		'JUMP_HEIGHT' : 0,
		'GROUNDED_FRICTION' : 0,
		'AERIAL_FRICTION' : 0,
		'COLLIDING' : false,
		'SCREEN_WRAP' : false,
		'CANCEL_MOMENTUM' : true
	},
	'NO_CLIP' : {
		'GRAVITY' : 15,
		'ACCEL' : 64,
 		'MAX_SPEED' : 416,
		'JUMP_HEIGHT' : -416,
		'GROUNDED_FRICTION' : 0.2,
		'AERIAL_FRICTION' : 0.175,
		'COLLIDING' : false,
		'SCREEN_WRAP' : false,
		'CANCEL_MOMENTUM' : false
	},
	'NO_FRICTION' : {
		'GRAVITY' : 15,
		'ACCEL' : 64,
 		'MAX_SPEED' : 416,
		'JUMP_HEIGHT' : -416,
		'GROUNDED_FRICTION' : 0.2,
		'AERIAL_FRICTION' : 0,
		'COLLIDING' : true,
		'SCREEN_WRAP' : false,
		'CANCEL_MOMENTUM' : false
	},
}
func _ready():
	Change_Physic_State(0)
	
	pass
	
func Change_Physic_State(val):
	props.physic_state['current'] = val
	if val == 0:
		props.physics = PROP_TEMPLATES.NORMAL
		print('Entering Normal State')
	elif val == 1:
		props.physics = PROP_TEMPLATES.ZIPPING
		print('Entering Zip State')
	elif val == 2:
		props.physics = PROP_TEMPLATES.DASHING
	elif val == 3:
		print('Entering No Friction State')
		props.physics = PROP_TEMPLATES.NO_FRICTION
	pass

