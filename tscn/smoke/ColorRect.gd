extends ColorRect
func _ready():
	material.set_shader_parameter("position", Vector2(randi_range(0,1000)*5,randi_range(0,1000)*5))
