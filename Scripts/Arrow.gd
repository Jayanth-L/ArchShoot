extends KinematicBody

var shoot = false
signal fall_tree

func _ready():
	get_tree().get_root().get_node("Main").connect("collided", self, "stop")
	shoot = true
	set_as_toplevel(true)
	pass

var position = 0.01
func _process(delta):
	if shoot:
		move_and_collide(Vector3(0, 0, -0.01))

func stop():
	print("Got sisgnal")
	emit_signal("fall_tree")
	shoot = false