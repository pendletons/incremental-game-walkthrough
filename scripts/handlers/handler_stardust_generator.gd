class_name HandlerStardustGenerator
extends Node
## Passively generate stardust


## Singleton reference
static var ref : HandlerStardustGenerator

## Amount of Stardust generated every loop
var generator_power : int = 1

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
	calculate_generator_power()
	
	HandlerCCUpgrades.ref.upgrade_leveled_up.connect(watch_for_upgrades_leveling_up)
	
	if Game.ref.data.cc_upgrades.upgrade_01_stardust_generation_level:
		timer.start()
		return
	
	HandlerCCUpgrades.ref.upgrade_01_stardust_generation.leveled_up.connect(watch_for_ccu01_level_up)

## Automatically create stardust
func _on_timer_timeout() -> void:
	HandlerStardust.ref.create_stardust(generator_power)
	
## Watch for any non-CCU_01 upgrades
func watch_for_upgrades_leveling_up(upgrade : Upgrade) -> void:
	calculate_generator_power()
	
## Wait for CCU_01 to be purchased
func watch_for_ccu01_level_up() -> void:
	timer.start()
	HandlerCCUpgrades.ref.upgrade_01_stardust_generation.leveled_up.disconnect(watch_for_ccu01_level_up)

func calculate_generator_power() -> void:
	var new_power : int = 1
	new_power += Game.ref.data.cc_upgrades.upgrade_02_stardust_boost_level
	
	generator_power = new_power
