extends Sprite

onready var arm = $Arm

var speed = 200 #Pixeles

func initialize(projectile_container):
	arm.container = projectile_container

func _physics_process(delta):
	
	var mouse_posittion:Vector2 = get_local_mouse_position()
	arm.rotation = mouse_posittion.normalized().angle();

	if Input.is_action_just_pressed("fire"):
		arm.fire()

	var direction:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	position.x += direction * speed * delta


	
	
	
