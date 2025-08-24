class_name Up01ClickerUpgrade
extends Node
## Upgrade 01 - Increases stardust created by the clicker

## Level of the upgrade (max: infinity)
var level : int = 0

## Title of the upgrade
var title : String = "Clicker Upgrade"

## Base cost of the upgrade
var base_cost : int = 5

## Current cost of the upgrade
var cost : int

## Emit a signal when the upgrade levels up
signal leveled_up

## Load data from save
func _init() -> void:
	level = Game.ref.data.up_01_level
	calculate_cost()
	
## Return the description of the upgrade based on current cost / effects
func description() -> String:
	var _description : String = "Increases the amount of stardust created by the Clicker."
	_description += "\nEffects : +1 Stardust / Level"
	_description += "\nCost : %s" %cost
	
	return _description

## Calculate the current cost based on base cost / level
func calculate_cost() -> void:
	cost = int(base_cost * pow(1.5, level))

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
		Game.ref.data.up_01_level = level
		
		calculate_cost()
		
		leveled_up.emit()
