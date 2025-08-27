class_name ComponentUpgrade
extends Control
## Component displaying an upgrade

## Reference to the title label
@export var label_title: Label

## Reference to the rich text label description
@export var label_description: RichTextLabel

## Reference to the purchase button
@export var button: Button

@export var max_upgrade_veil: ColorRect

## Current cost of the upgrade
var cost: int

## Which upgrade to display
var upgrade: Upgrade


func _ready() -> void:
	update_component()

	if not upgrade.is_max_level():
		HandlerStardust.ref.stardust_created.connect(update_button)
		HandlerStardust.ref.stardust_consumed.connect(update_button)

		upgrade.leveled_up.connect(_on_upgrade_level_up)


func update_component() -> void:
	update_button()
	update_label_title()
	update_label_description()
	update_upgrade_veil()


## Updates the title of the upgrade
func update_label_title() -> void:
	label_title.text = upgrade.title()


## Updates the description of the upgrade
func update_label_description() -> void:
	label_description.text = upgrade.description()


## Update the purchase button based on affordability
func update_button(_quantity: int = -1) -> void:
	if upgrade.can_afford():
		button.disabled = false
		return

	if upgrade.is_max_level():
		button.text = "MAX"

	button.disabled = true


func update_upgrade_veil() -> void:
	max_upgrade_veil.visible = upgrade.is_max_level()


## Trigger upgrade to level up post-purchase
func _on_purchase_button_pressed() -> void:
	upgrade.level_up()


func _on_upgrade_level_up() -> void:
	update_component()

	if upgrade.is_max_level():
		HandlerStardust.ref.stardust_created.disconnect(update_button)
		HandlerStardust.ref.stardust_consumed.disconnect(update_button)

		if upgrade.leveled_up.is_connected(update_component):
			upgrade.leveled_up.disconnect(update_component)
