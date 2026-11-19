extends StaticBody3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Food:
		body.is_cooking = true

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is Food:
		body.is_cooking = false
