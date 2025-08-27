class_name ViewUniverse
extends View
## Main view for the universe

## Text to display on launch of a new game
@export var intro_text: Label
## Main content to display once the player has started generating stardust
@export var main_content: MarginContainer


func _ready() -> void:
	super()
	_initialize_view()


## Display intro text or current state of the universe
func _initialize_view() -> void:
	if not Game.ref.data.cc_upgrades.upgrade_01_stardust_generation_level:
		intro_text.visible = true
		main_content.visible = false

		HandlerCCUpgrades.ref.upgrade_01_stardust_generation.leveled_up.connect(_on_ccu01_level_up)

	else:
		intro_text.visible = false
		main_content.visible = true


## After Universe is set up, do not display intro text and swap to universe state
func _on_ccu01_level_up() -> void:
	intro_text.visible = false
	main_content.visible = true

	HandlerCCUpgrades.ref.upgrade_01_stardust_generation.leveled_up.disconnect(_on_ccu01_level_up)
