class_name CCU03UnlockNebulas
extends Upgrade
## CC03Upgrade 03 : Unlocks Nebulas

var max_level : int = 1

## Initialise values
func _init() -> void:
	level = Game.ref.data.cc_upgrades.upgrade_03_unlock_nebulas
	title = "Unlock Nebulas"
	base_cost = 2
	cost = 2

## Return the description of the upgrade based on current cost / effects
func description() -> String:
	var text : String = "[b]Effect:[/b] Unlock the ability to create Nebulas."
	
	if level < max_level:
		text += "\n[b]Cost:[/b] %s Consciousness Core" %cost
		
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
		
	var error : Error = HandlerConsciousnessCore.ref.consume_consciousness_core(cost)
	
	if error:
		return
		
	level += 1
	Game.ref.data.cc_upgrades.upgrade_03_unlock_nebulas = true
	
	leveled_up.emit(self)
	HandlerCCUpgrades.ref.upgrade_leveled_up.emit(self)
