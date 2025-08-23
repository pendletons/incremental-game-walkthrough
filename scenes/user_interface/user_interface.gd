class_name UserInterface
extends Control
## Main user interface

## List of views that are available to display
enum Views {
	PROTOTYPE_GENERATOR,
	PROTOTYPE_CLICKER
}

## Set a signal to request changing the visible view
signal navigation_requested(view: Views)

## Respond to clicking the prototype clicker link
func _on_prototype_clicker_link_button_up() -> void:
	#navigation_requested.emit(Views.PROTOTYPE_CLICKER)
	emit_signal("navigation_requested", Views.PROTOTYPE_CLICKER)
	
## Respond to clicking the prototype generator link
func _on_prototype_generator_link_button_up() -> void:
	emit_signal("navigation_requested", Views.PROTOTYPE_GENERATOR)
	#navigation_requested.emit(Views.PROTOTYPE_GENERATOR)
