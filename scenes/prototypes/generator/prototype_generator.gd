class_name PrototypeGenerator
extends Control
## A generator prototype for creating stardust

## References to the button that starts automatic generation of stardust
@export var button : Button
## The timer that automatically generates stardust on a schedule
@export var timer : Timer

## User Interface references
@export var user_interface : UserInterface
@export var view : UserInterface.Views

## Initialise the label at launch
func _ready() -> void:
	visible = true
	user_interface.navigation_requested.connect(_on_navigation_requested)
	
## Create 1 stardust
func create_stardust() -> void:
	HandlerStardust.ref.create_stardust(1)
	
## Trigger the timer to start auto-generating stardust, also make sure the button can't be clicked again
func begin_generating_stardust() -> void:
	timer.start()
	button.disabled = true

## Begin generating stardust automatically
func _on_button_pressed() -> void:
	begin_generating_stardust()

## Create stardust + update label text
func _on_timer_timeout() -> void:
	HandlerStardust.ref.trigger_generator()

## Navigate to this page if it was requested
func _on_navigation_requested(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
		
	visible = false
