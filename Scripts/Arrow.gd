extends KinematicBody

var shoot = false
signal fall_tree

export var speed_div = 100

func _ready():
	get_tree().get_root().get_node("Main").connect("collided", self, "stop")
	pass

var position = 0.01
func _process(delta):
	if Input.is_mouse_button_pressed(1):
		shoot = true
	if shoot:
		set_as_toplevel(true)
		move_and_collide(get_global_transform().basis.z.normalized()/ speed_div)

func stop():
	print("Got sisgnal")
	emit_signal("fall_tree")
	shoot = false