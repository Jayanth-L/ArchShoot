extends KinematicBody

var camera_angle = 0
var mouse_sensitivity = 0.4
var camera_change = Vector2()

var velocity = Vector3()
var direction = Vector3()

#fly variables
const FLY_SPEED = 20
const FLY_ACCEL = 4
var flying = false

#walk variables
var gravity = -9.8 * 3
const MAX_SPEED = 20
const MAX_RUNNING_SPEED = 30
const ACCEL = 2
const DEACCEL = 6

#jumping
var jump_height = 15
var in_air = 0
var has_contact = false

#slope variables
const MAX_SLOPE_ANGLE = 35

#stair variables
const MAX_STAIR_SLOPE = 20
const STAIR_JUMP_HEIGHT = 6

var direction_vector

const VELOCITY_RATIO = 50
func _process(delta):
	aim()
	
	if Input.is_action_pressed("ui_up"):
		direction_vector = transform.basis.z.normalized() / VELOCITY_RATIO
		move_and_collide(-Vector3(direction_vector.x, 0, direction_vector.z))
	if Input.is_action_pressed("ui_down"):
		direction_vector = transform.basis.z.normalized() / VELOCITY_RATIO
		move_and_collide(Vector3(direction_vector.x, 0, direction_vector.z))
	if Input.is_action_pressed("ui_right"):
		direction_vector = transform.basis.x.normalized() / VELOCITY_RATIO
		move_and_collide(Vector3(direction_vector.x, 0, direction_vector.z))
	if Input.is_action_pressed("ui_left"):
		direction_vector = transform.basis.x.normalized() / VELOCITY_RATIO
		move_and_collide(-Vector3(direction_vector.x, 0, direction_vector.z))

func _input(event):
	if event is InputEventMouseMotion:
		camera_change = event.relative

func aim():
	if camera_change.length() > 0:
		rotate_y(deg2rad(camera_change.x * mouse_sensitivity))

		var change = -camera_change.y * mouse_sensitivity
		if change + camera_angle < 90 and change + camera_angle > -90:
			rotate(transform.basis.x, deg2rad(-change))
			camera_angle += change
		camera_change = Vector2()

