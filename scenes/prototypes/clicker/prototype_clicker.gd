class_name PrototypeClicker
extends View
## A clicker prototype creating stardust

## Create stardust + update the label with the new value
func _on_button_pressed() -> void:
	HandlerStardust.ref.trigger_clicker()
