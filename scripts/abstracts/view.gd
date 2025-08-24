class_name View
extends Control
## Abstract class

## User Interface references
@export var user_interface : UserInterface
@export var view : UserInterface.Views

## Initialise the label at launch
func _ready() -> void:
	user_interface.navigation_requested.connect(_on_navigation_requested)

## Navigate to this page if it was requested
func _on_navigation_requested(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
		
	visible = false
