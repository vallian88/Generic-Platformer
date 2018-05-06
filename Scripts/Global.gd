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
	'special_state' : {
		'current' : 0,
		'NORMAL' : 0,
		'ZIPPING' : 1,
	},
	'physics' :{
		'GRAVITY' : 0,
		'ACCEL' : 0,
 		'MAX_SPEED' : 0,
		'JUMP_HEIGHT' : 0,
		'GROUNDED_FRICTION' : 0,
		'AERIAL_FRICTION' : 0,
		'COLLIDING' : false,
		'SCREEN_WRAP' : false
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
		'SCREEN_WRAP' : false
	},
	'ZIPPING' : {
		'GRAVITY' : 0,
		'ACCEL' : 300,
 		'MAX_SPEED' : 400,
		'JUMP_HEIGHT' : -400,
		'GROUNDED_FRICTION' : 0,
		'AERIAL_FRICTION' : 0,
		'COLLIDING' : false,
		'SCREEN_WRAP' : true
	},
	'NO_CLIP' : {
		'GRAVITY' : 15,
		'ACCEL' : 50,
 		'MAX_SPEED' : 400,
		'JUMP_HEIGHT' : -400,
		'GROUNDED_FRICTION' : 0.2,
		'AERIAL_FRICTION' : 0.175,
		'COLLIDING' : false,
		'SCREEN_WRAP' : false
	},
}

func Change_Prop(key,val):
	props[key]['current'] = val
	if props.special_state.current == 0:
		props.physics = PROP_TEMPLATES.NORMAL
	elif props.special_state.current == 1:
		props.physics = PROP_TEMPLATES.ZIPPING
	
	pass