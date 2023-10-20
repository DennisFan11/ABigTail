extends Node
var PlayerPosition:Vector2 = Vector2.ZERO
var AddSpeed:float = 10 #25
var MaxSpeed:float = 150 #500
var DashCD:float = 0.3
var DashSpeed:float = 2000 #2000
var Stat:STAT = STAT.IDLE
enum STAT {IDLE = 0, DASH = 1}

var Slow:float = 30

	
