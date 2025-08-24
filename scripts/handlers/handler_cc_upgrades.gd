class_name HandlerCCUpgrades
extends Node
## Manages upgrades for consciousness core

## Singleton reference
static var ref : HandlerCCUpgrades

## Singleton check
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
		
	queue_free()

## Emitted when an upgrade has levelled up
signal upgrade_leveled_up(upgrade : Upgrade)

@onready var upgrade_01_stardust_generation : CCU01StardustGenerator = CCU01StardustGenerator.new()

@onready var upgrade_02_stardust_boost : CCU02StardustBoost = CCU02StardustBoost.new()

@onready var upgrade_03_unlock_nebulas : CCU03UnlockNebulas = CCU03UnlockNebulas.new()

## Returns all CCUpgrades
func get_all_upgrades() -> Array[Upgrade]:
	return [
		upgrade_01_stardust_generation,
		upgrade_02_stardust_boost,
		upgrade_03_unlock_nebulas
	]
