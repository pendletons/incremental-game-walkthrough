class_name PrototypeClicker
extends View
## A clicker prototype creating stardust

## Initialise the label at launch
func _ready() -> void:
	super()
	visible = false

## Create stardust + update the label with the new value
func _on_button_pressed() -> void:
	HandlerStardust.ref.trigger_clicker()
