class_name MilestoneStardust
extends Node
## Generate consciousnes core every x amount of stardust created

## The amount of stardust to create the next consciousness core
var stardust_goal : int = -1

## Amount of stardust generated in the last milestone
var stardust_progress : int = -1

## Reference to the universe data
var universe : DataUniverse

func _init() -> void:
	universe = Game.ref.data.universe
	HandlerStardust.ref.stardust_created.connect(_on_stardust_created)
	initialise_new_milestone(universe.stardust_milestone_progress)
	
## Initialise a new milestone after the previous one is finished
func initialise_new_milestone(transferred_progress : int = 0) -> void:
	print("universe cc")
	print(universe.consciousness_core)
	if universe.consciousness_core == 0:
		stardust_goal = 4
		
	else:
		stardust_goal = universe.consciousness_core * 8

	print("sd goal")
	print(stardust_goal)
	stardust_progress = transferred_progress
	universe.stardust_milestone_progress = stardust_progress

## Check if we've generated enough stardust for the milestone
func check_for_completion() -> void:
	if stardust_progress < stardust_goal:
		return
	
	var stardust_excess : int = stardust_progress - stardust_goal
	
	HandlerConsciousnessCore.ref.create_consciousness_core(1)
	initialise_new_milestone(stardust_excess)
	check_for_completion()
	
func _on_stardust_created(quantity : int) -> void:
	stardust_progress += quantity
	universe.stardust_milestone_progress = stardust_progress
	check_for_completion()
	 
