class_name HandlerStardustUpgrades
extends Node
## Manages upgrades for stardust

## Singleton reference
static var ref: HandlerStardustUpgrades


## Singleton check
func _enter_tree() -> void:
	if not ref:
		ref = self
		return

	queue_free()


## Emitted when an upgrade has levelled up
signal upgrade_leveled_up(upgrade: Upgrade)
