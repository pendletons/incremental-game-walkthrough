class_name Up02GeneratorUpgrade
extends Upgrade
## Upgrade 02 - Increases stardust created by the generator

## Load data from save
func _init() -> void:
	level = Game.ref.data.up_02_level
	base_cost = 10
	title = "Generator Upgrade"
	level_exponential = 2.0
	super()
	
## Return the description of the upgrade based on current cost / effects
func description() -> String:
	var _description : String = "Increases the amount of stardust created by the Generator."
	_description += "\nEffects : +1 Stardust / Level"
	_description += "\nCost : %s" %cost
	
	return _description

## Calculate the current cost based on base cost / level
func calculate_cost() -> void:
	cost = int(base_cost * pow(level_exponential, level))
	
## Returns boolean for whether the player can afford the upgrade or not
func can_afford() -> bool:
	if HandlerStardust.ref.stardust() >= cost:
		return true
		
	return false
	
## Consume stardust + level up
func level_up() -> void:
	var error : Error = HandlerStardust.ref.consume_stardust(cost)
	
	if not error:
		level += 1
		Game.ref.data.up_02_level = level
		
		calculate_cost()
		
		leveled_up.emit()
