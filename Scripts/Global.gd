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
	var main_camera = Camera2D.new()
	main_camera.set_name('Main Camera')
	add_child(main_camera,true)
	
func Change_Physic_State(val):
	props.physic_state['current'] = val
	if val == 0:
		props.physics = PROP_TEMPLATES.NORMAL
	elif val == 1:
		props.physics = PROP_TEMPLATES.ZIPPING
	elif val == 2:
		props.physics = PROP_TEMPLATES.DASHING
	
	pass
