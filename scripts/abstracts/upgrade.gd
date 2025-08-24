class_name Upgrade
extends Node
## Abstract class defining an upgrade

## Level of the upgrade (max: infinity)
var level : int = -1

## Title of the upgrade
var title : String = "Base Upgrade Class"

## Base cost of the upgrade
var base_cost : int = -1

## Exponential for the cost for leveling up
var level_exponential : float = -1.0

## Current cost of the upgrade
var cost : int = -1

## Emit a signal when the upgrade levels up
signal leveled_up

## Load data from save
func _init() -> void:
	calculate_cost()

## Abstract method, must be overwritten.[br]
## Return the description of the upgrade based on current cost / effects
func description() -> String:
	return "Description not defined"

## Calculate the current cost based on base cost / level
func calculate_cost() -> void:
	cost = -1

## Returns boolean for whether the player can afford the upgrade or not
func can_afford() -> bool:
	push_error("Must define can_afford() in the subclass")
	
	return false

## Returns boolean for whether the upgrade is maxed out
func is_max_level() -> bool:
	push_error("Must define can_afford() in the subclass")
	
	return false
	
## Consume stardust + level up
func level_up() -> void:
	printerr("Must define this in the subclass")

## Return whether or not the upgrade has been unlocked
func is_unlocked() -> bool:
	return false
