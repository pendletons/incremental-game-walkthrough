class_name UserInterface
extends Control
## Main user interface

## List of views that are available to display
enum Views { CONSCIOUSNESS_CORE, UNIVERSE }

## Set a signal to request changing the visible view
signal navigation_requested(view: Views)


func _ready() -> void:
	navigation_requested.emit(Views.UNIVERSE)


## Respond to clicking the consciousness core link
func _on_consciousness_core_link_button_up() -> void:
	emit_signal("navigation_requested", Views.CONSCIOUSNESS_CORE)


## Respond to clicking the universe link
func _on_universe_link_button_up() -> void:
	emit_signal("navigation_requested", Views.UNIVERSE)
