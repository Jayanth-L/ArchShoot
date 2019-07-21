extends Spatial

signal collided

var arrow = preload("res://ModelScenes/Arrow.tscn")
func _ready():
	arrow.connect("fall_tree", self, "fall_tree_fu")
	$Camera/SpawnPosition.add_child(arrow.instance())


func _on_PineTree_body_shape_entered(body_id, body, body_shape, local_shape):
	print("Something collided:" + str(body.name))
	emit_signal("collided")
	$PineTree/AnimationPlayer.play("FallTree")
