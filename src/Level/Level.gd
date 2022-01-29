extends Node2D

const LIMIT_LEFT = -315
const LIMIT_TOP = -250
const LIMIT_RIGHT = 955
const LIMIT_BOTTOM = 690

var initialPlayerPosition
var cloneScn = preload("res://src/Actors/Clone.tscn")

func _ready():
	for child in get_children():
		if child is Camera2D:
			child.zoom = Vector2(0.6, 0.6)
		if child is Player:
			initialPlayerPosition = child.position
		


func _on_door_entered():
	call_deferred("addClone")
	get_parent().emit_signal("on_door_passed")

func addClone():
	var clone = cloneScn.instance()
	add_child(clone)
	clone.set_position(initialPlayerPosition)
	print(clone.position)
