class_name HandlerStardustUpgrades
extends Node
## Manages upgrades for stardust

## Singleton reference
static var ref : HandlerStardustUpgrades

## Singleton check
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
		
	queue_free()

## Emitted when an upgrade has levelled up
signal upgrade_leveled_up(upgrade : Upgrade)

@onready var upgrade_01_clicker_upgrade : Up01ClickerUpgrade = Up01ClickerUpgrade.new()

@onready var upgrade_02_generator_upgrade : Up02GeneratorUpgrade = Up02GeneratorUpgrade.new()

## Returns all Stardust Upgrades
func get_all_upgrades() -> Array[Upgrade]:
	return [
		upgrade_01_clicker_upgrade,
		upgrade_02_generator_upgrade,
	]
