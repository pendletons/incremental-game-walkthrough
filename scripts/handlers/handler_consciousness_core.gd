class_name HandlerConsciousnessCore
extends Node
## Manages consciousness core and related signals

## Singleton reference
static var ref : HandlerConsciousnessCore

## Singleton check
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
		
	queue_free()

## Emitted when consciousness core has been created
signal consciousness_core_created(quantity : int)
## Emitted when consciousness core has been consumed
signal consciousness_core_consumed(quantity : int)

## Node managing stardust milestones
@onready var stardust_milestone : MilestoneStardust = MilestoneStardust.new()

## Return the amount of consciousness core available
func consciousness_core() -> int:
	return Game.ref.data.consciousness_core

## Create a specific amount of consciousness core
func create_consciousness_core(quantity : int) -> void:
	Game.ref.data.consciousness_core += quantity
	Game.ref.data.universe.consciousness_core  += quantity
	consciousness_core_created.emit(quantity)

## Consume a specific amount of consciousness core, or error if consciousness core quantity is too low
func consume_consciousness_core(quantity : int) -> Error:
	if consciousness_core() < quantity:
		return Error.FAILED

	Game.ref.data.consciousness_core -= quantity
	consciousness_core_consumed.emit(quantity)
	
	return Error.OK

## Create consciousness core via the clicker, based on the upgrade level
#func trigger_clicker() -> void:
	#var quantity : int = 1
	#quantity += Game.ref.data.up_01_level

	#create_consciousness_core(quantity)

## Create consciousness core via the generator, based on the upgrade level
#func trigger_generator() -> void:
	#var quantity : int = 1
	#quantity += Game.ref.data.up_02_level
	
	#create_consciousness_core(quantity)
