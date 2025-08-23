class_name PrototypeClicker
extends Control
## A clicker prototype creating stardust

@export var user_interface : UserInterface
@export var view : UserInterface.Views

## Initialise the label at launch
func _ready() -> void:
	visible = false
	user_interface.navigation_requested.connect(_on_navigation_requested)

## Create 1 stardust
func create_stardust() -> void:
	HandlerStardust.ref.create_stardust(1)
	
## Create stardust + update the label with the new value
func _on_button_pressed() -> void:
	create_stardust()

## Navigate to this page if it was requested
func _on_navigation_requested(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
		
	visible = false
