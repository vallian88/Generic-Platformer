extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var dir = Vector2(1,1)
var speed = Vector2(10,0)

func _physics_process(delta):
	# Called every time the node is added to the scene.
	apply_impulse(dir,speed)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
