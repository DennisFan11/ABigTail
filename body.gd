extends CharacterBody2D
var MaxTime = 0.15
var points = []
var TIME:float = 0
var DashCD:float = 0:
	set(new):
		if new <= 0:
			DashCD = 0
			Global.Stat = Global.STAT.IDLE
			$GPUParticles2D.emitting = false
		else:
			DashCD = new
var DashPosition:Vector2 = Vector2.ZERO

func _ready():
	points.resize(5)
	points.fill(Vector2.ZERO)
func _physics_process(delta):
	#--------------------同步位置--------------------
	Global.PlayerPosition = global_position
	#--------------------移動--------------------
	match Global.Stat:
		
		Global.STAT.IDLE:
			IdleMove()
		Global.STAT.DASH:
			DashMove()
	#--------------------尾巴--------------------
	TIME += delta
	if TIME >= MaxTime:
		points.push_front(global_position)
		points.pop_back()
		TIME = 0
	points[0] = global_position
	$"../Line2D".points = points
	#--------------------遮罩--------------------
	#--------------------殘影觸發------------------
	DashCD -= delta
	if Input.is_action_just_pressed("space") and DashCD == 0:
		$GPUParticles2D.emitting = true
		DashCD = Global.DashCD
		DashPosition = (get_global_mouse_position()-global_position).normalized()
		Global.Stat = Global.STAT.DASH
	
	
func DashMove():
	velocity = DashPosition * Global.DashSpeed
	move_and_slide()
	
func IdleMove():
	var target = get_global_mouse_position()
	var move = (target - global_position).normalized()
	velocity += move * Global.AddSpeed
	if velocity.length() >= Global.MaxSpeed:
		velocity = velocity.normalized() * Global.MaxSpeed
	move_and_slide()

















