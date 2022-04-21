extends Sprite

var speed = 400
var angular_speed = PI

signal drop



func _ready():
	# get_node() 이름 기준으로 해당 노드를 가져온다
	var timer = get_node("Timer")
	timer.connect("timeout",self,"_on_Timer_timeout")
	emit_signal("drop")
	

func _on_Timer_timeout():
	visible = not visible
	self.connect("drop",self,"_on_Drop")
	
func _on_Drop():
	pass

func _process(delta:float)->void:
	rotation += angular_speed * delta
	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

func _on_Button_pressed():
	# process 를 토글 처리 할 수 있다.
	set_process(not is_processing())
