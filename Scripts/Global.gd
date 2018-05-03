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
    }
}

func Change_prop(key,val):
    props[key]['current'] = val
    pass