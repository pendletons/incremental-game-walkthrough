class_name PrototypeClicker
extends Control
## A clicker prototype creating stardust

## References to the label displaying the current amount of stardust
@export var label : Label
## Current amount of stardust created
var stardust : int = 0

@export var user_interface : UserInterface
@export var view : UserInterface.Views

## Initialise the label at launch
func _ready() -> void:
	update_label_text()
	visible = false
	user_interface.navigation_requested.connect(_on_navigation_requested)

## Create 1 stardust
func create_stardust() -> void:
	stardust += 1
	
## Update the label text to reflect current stardust amount
func update_label_text() -> void:
	label.text = "Stardust: %s" %stardust

## Create stardust + update the label with the new value
func _on_button_pressed() -> void:
	create_stardust()
	update_label_text()

## Navigate to this page if it was requested
func _on_navigation_requested(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
		
	visible = false
