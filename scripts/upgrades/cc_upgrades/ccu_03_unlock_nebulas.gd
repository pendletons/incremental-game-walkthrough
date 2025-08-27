class_name CCU03UnlockNebulas
extends Upgrade
## CC03Upgrade 03 : Unlocks Nebulas

var max_level: int = 1


## Initialise values
func _init() -> void:
	level = Game.ref.data.cc_upgrades.upgrade_03_unlock_nebulas
	base_cost = 2
	cost = 2

	if not is_unlocked():
		HandlerCCUpgrades.ref.upgrade_01_stardust_generation.leveled_up.connect(_on_ccu01_level_up)


func title() -> String:
	return "Unlock Nebulas"


## Return the description of the upgrade based on current cost / effects
func description() -> String:
	var text: String = "[b]Effect:[/b] Unlock the ability to create Nebulas."

	if level < max_level:
		text += "\n[b]Cost:[/b] %s Consciousness Core" % cost

	else:
		text += "\n[b]Max Level[/b]"

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
	Game.ref.data.cc_upgrades.upgrade_03_unlock_nebulas = true

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
