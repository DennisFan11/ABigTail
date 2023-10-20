extends Node2D
var speed:float = 5
func _process(delta):
	position = position.lerp(Global.PlayerPosition, delta * speed)
	
