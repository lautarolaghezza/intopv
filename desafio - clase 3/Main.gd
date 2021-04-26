extends Node

onready var player = $Player
onready var enemies = $Enemies


func _ready():
	player.initialize(self)
	for node in enemies.get_children():
		node.initialize(player)
