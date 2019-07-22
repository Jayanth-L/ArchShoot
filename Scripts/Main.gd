extends Spatial

signal collided
var instance

var arrow = preload("res://ModelScenes/Arrow.tscn")
func _ready():
	instance = arrow.instance()
	instance.connect("fall_tree", self, "respawn_arrow")
	$Player/SpawnPosition.add_child(instance)


func _on_PineTree_body_shape_entered(body_id, body, body_shape, local_shape):
	print("Something collided:" + str(body.name))
	if("Arrow" in body.name):
		emit_signal("collided")
		body.queue_free()
		$PineTree/AnimationPlayer.play("FallTree")

func respawn_arrow():
	instance = arrow.instance()
	instance.connect("fall_tree", self, "respawn_arrow")
	$Player/SpawnPosition.add_child(instance)
