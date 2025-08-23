class_name PrototypeGenerator
extends Control
## A generator prototype for creating stardust

## References to the label displaying the current amount of stardust
@export var label : Label
## References to the button that starts automatic generation of stardust
@export var button : Button
## The timer that automatically generates stardust on a schedule
@export var timer : Timer

## User Interface references
@export var user_interface : UserInterface
@export var view : UserInterface.Views

## Initialise the label at launch
func _ready() -> void:
	update_label_text();
	visible = true
	user_interface.navigation_requested.connect(_on_navigation_requested)
	
## Temporary function to update the label
func _process(_delta: float) -> void:
	update_label_text()
	
## Create 1 stardust
func create_stardust() -> void:
	Game.ref.data.stardust += 1
	
## Update the label text to reflect current stardust amount
func update_label_text() -> void:
	label.text = "Stardust: %s" %Game.ref.data.stardust

## Trigger the timer to start auto-generating stardust, also make sure the button can't be clicked again
func begin_generating_stardust() -> void:
	timer.start()
	button.disabled = true

## Begin generating stardust automatically
func _on_button_pressed() -> void:
	begin_generating_stardust()

## Create stardust + update label text
func _on_timer_timeout() -> void:
	create_stardust()

## Navigate to this page if it was requested
func _on_navigation_requested(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
		
	visible = false
