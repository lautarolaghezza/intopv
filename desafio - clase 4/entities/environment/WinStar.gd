extends Area2D

onready var area := $Area2D

func _ready():
	playing = true
	scale = Vector2(0.25,0.25)

func _on_Area2D_body_entered(body):
		Global.level_passed()
