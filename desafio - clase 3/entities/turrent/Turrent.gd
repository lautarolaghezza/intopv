extends Sprite

onready var fire_position = $FirePosition

export (PackedScene) var projectile_scene:PackedScene;

export (float) var projectile_time

var player_to_attack

var _timer = null

func initialize(player):
	player_to_attack = player


func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false)
	_timer.start()
	
	
func _on_Timer_timeout():
	var new_projectile = projectile_scene.instance()		
	var fire_direction = (player_to_attack.global_position - global_position).normalized()
	self.add_child(new_projectile)
	new_projectile.initialize(fire_direction, fire_position.global_position)
