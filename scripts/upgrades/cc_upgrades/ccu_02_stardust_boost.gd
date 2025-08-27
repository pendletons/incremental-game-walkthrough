class_name CCU02StardustBoost
extends Upgrade
## Unlocks speedy stardust generation

## Max level of this upgrade
var max_level: int = 5


## Load data from save
func _init() -> void:
	level = Game.ref.data.cc_upgrades.upgrade_02_stardust_boost_level
	base_cost = 1
	level_exponential = 1.5
	cost = 1

	if not is_unlocked():
		HandlerCCUpgrades.ref.upgrade_01_stardust_generation.leveled_up.connect(_on_ccu01_level_up)


func title() -> String:
	var value: String = tr("CCU02_TITLE")

	if level > 0:
		var level_suffix_key = "UPGRADE_LEVEL_SUFFIX_%s" % level
		value += " " + tr(level_suffix_key)

	return value


## Abstract method, must be overwritten.[br]
## Return the description of the upgrade based on current cost / effects
func description() -> String:
	var text: String = tr("CCU02_DESCRIPTION")
	text += "\n" + tr("CCU02_EFFECT")

	if level < max_level:
		text += "\n" + tr("CONSCIOUSNESS_CORE_COST") % cost

	else:
		text += "\n" + tr("UPGRADE_MAX_LEVEL")

	return text


## Returns boolean for whether the player can afford the upgrade or not
func can_afford() -> bool:
	if level >= max_level:
		return false

	if Game.ref.data.consciousness_core >= cost:
		return true

	return false


## Consume stardust + level up
func level_up() -> void:
	if level >= max_level:
		return

	var error: Error = HandlerConsciousnessCore.ref.consume_consciousness_core(cost)

	if error:
		return

	level += 1
	Game.ref.data.cc_upgrades.upgrade_02_stardust_boost_level += 1

	leveled_up.emit()
	HandlerCCUpgrades.ref.upgrade_leveled_up.emit(self)


## Return whether or not the upgrade has been unlocked
func is_unlocked() -> bool:
	if Game.ref.data.cc_upgrades.upgrade_01_stardust_generation_level:
		return true

	return false


## Return whether or not the upgrade has been maxed out
func is_max_level() -> bool:
	return level >= max_level


func is_disabled() -> bool:
	return not is_max_level()


## Triggered when CCU01 upgrade is purchased
func _on_ccu01_level_up() -> void:
	HandlerCCUpgrades.ref.upgrade_01_stardust_generation.leveled_up.disconnect(_on_ccu01_level_up)
	HandlerCCUpgrades.ref.upgrade_unlocked.emit(self)
