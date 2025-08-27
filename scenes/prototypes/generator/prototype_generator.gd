class_name PrototypeGenerator
extends View
## A generator prototype for creating stardust

## References to the button that starts automatic generation of stardust
@export var button : Button
## The timer that automatically generates stardust on a schedule
@export var timer : Timer

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
