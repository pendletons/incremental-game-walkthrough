class_name CCU01StardustGenerator
extends Upgrade
## Unlocks passive stardust generation

var max_level: int = 1


## Load data from save
func _init() -> void:
	level = Game.ref.data.cc_upgrades.upgrade_01_stardust_generation_level
	base_cost = 1
	level_exponential = 1.5
	calculate_cost()


func title() -> String:
	return tr("CCU01_TITLE")


## Abstract method, must be overwritten.[br]
## Return the description of the upgrade based on current cost / effects
func description() -> String:
	var text: String = tr("CCU01_DESCRIPTION")
	text += "\n" + tr("CCU01_EFFECT")
	if level < max_level:
		text += "\n" + tr("CONSCIOUSNESS_CORE_COST") % cost

	else:
		text += "\n" + tr("UPGRADE_MAX_LEVEL")

	return text


## Calculate the current cost based on base cost / level
func calculate_cost() -> void:
	cost = base_cost


## Returns boolean for whether the player can afford the upgrade or not
func can_afford() -> bool:
	if level >= max_level:
		return false

	if Game.ref.data.consciousness_core >= cost:
		return true

	return false


## Consume stardust + level up
func level_up() -> void:
	if is_max_level():
		return

	var error: Error = HandlerConsciousnessCore.ref.consume_consciousness_core(cost)

	if error:
		return

	level += 1
	Game.ref.data.cc_upgrades.upgrade_01_stardust_generation_level = true

	leveled_up.emit()
	HandlerCCUpgrades.ref.upgrade_leveled_up.emit(self)


## Return whether or not the upgrade has been unlocked
func is_unlocked() -> bool:
	return true


## Return whether or not the upgrade has been maxed out
func is_max_level() -> bool:
	return level >= max_level


func is_disabled() -> bool:
	return not is_max_level()
