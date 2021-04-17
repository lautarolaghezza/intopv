extends Sprite

export (float) var speed : float

func _process(delta):
	var right : bool = Input.is_action_pressed("rightKey")
	var left  : bool = Input.is_action_pressed("leftKey")
	
	var direction : int = int(right) - int(left)
	position.x += direction * speed * delta
