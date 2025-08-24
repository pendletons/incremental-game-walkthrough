class_name HandlerStardustGenerator
extends Node
## Passively generate stardust


## Singleton reference
static var ref : HandlerStardustGenerator

## Singleton check
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
		
	queue_free()
	
## Reference the generator timer
@export var timer : Timer

## Load data
func _ready() -> void:
	if Game.ref.data.cc_upgrades.upgrade_01_stardust_generation_level:
		timer.start()
		return
		
	HandlerCCUpgrades.ref.upgrade_leveled_up.connect(watch_for_upgrades_leveling_up)

## Automatically create stardust
func _on_timer_timeout() -> void:
	HandlerStardust.ref.create_stardust(1)
	
## Wait for CCU_01 to be purchased
func watch_for_upgrades_leveling_up(upgrade : Upgrade) -> void:
	if upgrade == HandlerCCUpgrades.ref.upgrade_01_stardust_generation:
		timer.start()
		HandlerCCUpgrades.ref.upgrade_leveled_up.disconnect(watch_for_upgrades_leveling_up)
