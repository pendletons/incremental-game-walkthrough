class_name ComponentActiveEffects
extends VBoxContainer
## Displays the active effects of the universe

## Reference to the label displaying the current level of stardust generated
@export var stardust_per_second: RichTextLabel


func _ready() -> void:
	_connect_signals()
	_update_stardust_per_second()


func _connect_signals() -> void:
	HandlerStardustGenerator.ref.generator_power_calculated.connect(
		_on_stardust_generator_power_calculated
	)


func _update_stardust_per_second() -> void:
	var text: String = (
		"[b]Stardust per Second:[/b] %s" % HandlerStardustGenerator.ref.generator_power
	)
	stardust_per_second.text = text


func _on_stardust_generator_power_calculated() -> void:
	_update_stardust_per_second()
