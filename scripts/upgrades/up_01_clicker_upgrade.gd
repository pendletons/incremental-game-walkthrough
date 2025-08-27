class_name Up01ClickerUpgrade
extends Upgrade
## Upgrade 01 - Increases stardust created by the clicker


## Load data from save
func _init() -> void:
	level = Game.ref.data.up_01_level
	base_cost = 5
	level_exponential = 1.5
	super()


func title() -> String:
	return "Clicker Upgrade"


## Return the description of the upgrade based on current cost / effects
func description() -> String:
	var value: String = "Increases the amount of stardust created by the Clicker."
	value += "\nEffects : +1 Stardust / Level"
	value += "\nCost : %s" % cost

	return value


## Returns boolean for whether the player can afford the upgrade or not
func can_afford() -> bool:
	if HandlerStardust.ref.stardust() >= cost:
		return true

	return false


## Calculate the current cost based on base cost / level
func calculate_cost() -> void:
	cost = int(base_cost * pow(level_exponential, level))


## Consume stardust + level up
func level_up() -> void:
	var error: Error = HandlerStardust.ref.consume_stardust(cost)

	if not error:
		level += 1
		Game.ref.data.up_01_level = level

		calculate_cost()

		leveled_up.emit()
