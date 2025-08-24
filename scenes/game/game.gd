class_name Game
extends Node
## Main node of the game

## Singleton reference
static var ref : Game

## Singleton check
func _singleton_check() -> void:
	if not ref:
		ref = self
		return
		
	queue_free()

## Reference to the User Interface scene
@export var scene_user_interface : PackedScene = preload("res://scenes/user_interface/user_interface.tscn")

## Contains game data to save/load
var data : Data

## Singleton check + data initialisation
func _enter_tree() -> void:
	_singleton_check()
	data = Data.new()
	SaveSystem.load_data()

func _ready() -> void:
	var node_user_interface : UserInterface = scene_user_interface.instantiate() as UserInterface
	add_child(node_user_interface)
	
## Save data on a regular basis
func _on_save_timer_timeout() -> void:
	SaveSystem.save_data()
